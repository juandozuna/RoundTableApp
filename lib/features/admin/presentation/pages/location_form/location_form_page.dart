import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/extensions/build_context_x.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_toast.dart';
import '../../../../../core/widgets/empty_state.dart';
import '../../../../../core/widgets/form_fields/app_checkbox_form_field.dart';
import '../../../../../core/widgets/form_fields/app_text_form_field.dart';
import '../../../../../core/widgets/skeleton.dart';
import '../../../admin_routes.dart';
import '../../../domain/models/location_input.dart';
import '../../../domain/models/record_status.dart';
import '../../admin_error_messages.dart';
import '../../widgets/admin_denied_view.dart';
import '../../widgets/admin_page_frame.dart';
import 'cubit/location_form_cubit.dart';
import 'cubit/location_form_state.dart';

/// Full-page form to add or edit a location of an organization.
class LocationFormPage extends StatefulWidget {
  const LocationFormPage({
    super.key,
    required this.organizationId,
    this.locationId,
  });

  final String organizationId;

  /// Null when creating.
  final String? locationId;

  @override
  State<LocationFormPage> createState() => _LocationFormPageState();
}

class _LocationFormPageState extends State<LocationFormPage> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  bool get _isEdit => widget.locationId != null;

  String get _back => AdminRoutes.organizationPath(widget.organizationId);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AdminPageFrame(
      title: _isEdit ? l10n.adminEditLocation : l10n.adminNewLocation,
      backFallbackLocation: _back,
      maxContentWidth: 760,
      builder: (context, access) {
        if (!access.scope!.canAccessOrganization(widget.organizationId)) {
          return AdminDeniedView(
            title: l10n.adminDeniedOrganizationTitle,
            message: l10n.adminDeniedOrganizationMessage,
            homeLocation: AdminRoutes.explorer,
          );
        }
        return BlocConsumer<LocationFormCubit, LocationFormState>(
          listenWhen: (a, b) => a.status != b.status,
          listener: _onStatus,
          builder: (context, state) =>
              _buildBody(context, state, access.online),
        );
      },
    );
  }

  void _onStatus(BuildContext context, LocationFormState state) {
    final l10n = context.l10n;
    if (state.status == LocationFormStatus.saved) {
      AppToast.show(
        context,
        _isEdit
            ? l10n.adminToastLocationUpdated
            : l10n.adminToastLocationCreated,
        kind: AppToastKind.success,
      );
      context.canPop() ? context.pop() : context.go(_back);
    } else if (state.error != null &&
        state.status == LocationFormStatus.editing) {
      final message = state.error!.adminMessage(l10n);
      final field = state.error!.adminFieldName;
      if (field != null) {
        _formKey.currentState?.fields[field]?.invalidate(message);
      }
      AppToast.show(context, message, kind: AppToastKind.error);
    }
  }

  Widget _buildBody(
    BuildContext context,
    LocationFormState state,
    bool online,
  ) {
    final l10n = context.l10n;
    if (state.status == LocationFormStatus.loading) {
      return ListView(children: const [SkeletonList(count: 3, itemHeight: 72)]);
    }
    if (_isEdit && state.location == null) {
      return ErrorState(
        message: state.error?.adminMessage(l10n),
        onRetry: () => context.read<LocationFormCubit>().init(
          locationId: widget.locationId,
        ),
      );
    }
    final location = state.location;
    final submitting = state.status == LocationFormStatus.submitting;
    return FormBuilder(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
        children: [
          AppTextFormField(
            name: 'name',
            label: l10n.adminFieldLocationName,
            required: true,
            initialValue: location?.name,
            hint: l10n.adminFieldLocationNameHint,
          ),
          const SizedBox(height: AppSpacing.md),
          AppTextFormField(
            name: 'city',
            label: l10n.adminFieldCity,
            initialValue: location?.city,
          ),
          const SizedBox(height: AppSpacing.md),
          AppTextFormField(
            name: 'region',
            label: l10n.adminFieldRegion,
            initialValue: location?.region,
          ),
          const SizedBox(height: AppSpacing.md),
          AppTextFormField(
            name: 'address',
            label: l10n.adminFieldAddress,
            initialValue: location?.address,
          ),
          if (_isEdit) ...[
            const SizedBox(height: AppSpacing.md),
            AppCheckboxFormField(
              name: 'active',
              label: l10n.adminFieldLocationActive,
              initialValue: location?.status == RecordStatus.active,
            ),
          ],
          const SizedBox(height: AppSpacing.xl),
          AppButton(
            label: _isEdit ? l10n.adminSaveChanges : l10n.adminCreateLocation,
            icon: Icons.check_rounded,
            loading: submitting,
            onPressed: online && !submitting ? _submit : null,
          ),
          const SizedBox(height: AppSpacing.sm),
          AppButton(
            label: l10n.actionCancel,
            variant: AppButtonVariant.secondary,
            onPressed: submitting
                ? null
                : () => context.canPop() ? context.pop() : context.go(_back),
          ),
        ],
      ),
    );
  }

  void _submit() {
    final form = _formKey.currentState;
    if (form == null || !form.saveAndValidate()) return;
    final values = form.value;
    String? text(String key) {
      final value = (values[key] as String?)?.trim();
      return value == null || value.isEmpty ? null : value;
    }

    final input = LocationInput(
      name: text('name'),
      city: text('city'),
      region: text('region'),
      address: text('address'),
      status: _isEdit
          ? (values['active'] == true
                ? RecordStatus.active
                : RecordStatus.inactive)
          : null,
    );
    context.read<LocationFormCubit>().submit(widget.organizationId, input);
  }
}
