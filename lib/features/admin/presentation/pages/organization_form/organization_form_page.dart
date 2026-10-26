import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/extensions/build_context_x.dart';
import '../../../../../core/form_rules/app_field_kind.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../core/theme/status_tone.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_message.dart';
import '../../../../../core/widgets/app_toast.dart';
import '../../../../../core/widgets/empty_state.dart';
import '../../../../../core/widgets/form_fields/app_checkbox_form_field.dart';
import '../../../../../core/widgets/form_fields/app_dropdown_form_field.dart';
import '../../../../../core/widgets/form_fields/app_text_form_field.dart';
import '../../../../../core/widgets/skeleton.dart';
import '../../../admin_routes.dart';
import '../../../domain/models/organization_input.dart';
import '../../admin_countries.dart';
import '../../admin_error_messages.dart';
import '../../widgets/admin_denied_view.dart';
import '../../widgets/admin_page_frame.dart';
import '../../widgets/explorer_labels.dart';
import 'cubit/organization_form_cubit.dart';
import 'cubit/organization_form_state.dart';

/// Full-page form to create or edit an organization (platform admin only).
class OrganizationFormPage extends StatefulWidget {
  const OrganizationFormPage({super.key, this.organizationId});

  /// Null when creating.
  final String? organizationId;

  @override
  State<OrganizationFormPage> createState() => _OrganizationFormPageState();
}

class _OrganizationFormPageState extends State<OrganizationFormPage> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  bool get _isEdit => widget.organizationId != null;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AdminPageFrame(
      title: _isEdit
          ? l10n.adminEditOrganization
          : l10n.adminCreateOrganization,
      backFallbackLocation: AdminRoutes.explorer,
      maxContentWidth: 760,
      builder: (context, access) {
        if (!access.scope!.isAdministrator) {
          return AdminDeniedView(
            message: l10n.adminDeniedAdminOnlyMessage,
            homeLocation: AdminRoutes.explorer,
          );
        }
        return BlocConsumer<OrganizationFormCubit, OrganizationFormState>(
          listenWhen: (a, b) => a.status != b.status,
          listener: _onStatus,
          builder: (context, state) =>
              _buildBody(context, state, access.online),
        );
      },
    );
  }

  void _onStatus(BuildContext context, OrganizationFormState state) {
    final l10n = context.l10n;
    final error = state.error;
    if (state.status == OrganizationFormStatus.saved) {
      AppToast.show(
        context,
        _isEdit
            ? l10n.adminToastOrganizationUpdated
            : state.invite != null
            ? l10n.adminToastOrganizationCreatedInvited
            : l10n.adminToastOrganizationCreated,
        kind: AppToastKind.success,
      );
      final invite = state.invite;
      if (invite != null) {
        context.go(
          AdminRoutes.invitePath(
            role: 'coordinator',
            organizationId: state.savedId,
          ),
          extra: invite,
        );
      } else {
        context.go(AdminRoutes.organizationPath(state.savedId!));
      }
    } else if (error != null &&
        state.status == OrganizationFormStatus.editing) {
      final field = error.adminFieldName;
      final message = error.adminMessage(l10n);
      if (field != null) {
        _formKey.currentState?.fields[field]?.invalidate(message);
      }
      AppToast.show(context, message, kind: AppToastKind.error);
    }
  }

  Widget _buildBody(
    BuildContext context,
    OrganizationFormState state,
    bool online,
  ) {
    final l10n = context.l10n;
    if (state.status == OrganizationFormStatus.loading) {
      return ListView(children: const [SkeletonList(count: 4, itemHeight: 72)]);
    }
    if (_isEdit && state.organization == null) {
      return ErrorState(
        message: state.error?.adminMessage(l10n),
        onRetry: () => context.read<OrganizationFormCubit>().init(
          organizationId: widget.organizationId,
        ),
      );
    }
    final org = state.organization;
    final submitting = state.status == OrganizationFormStatus.submitting;
    return FormBuilder(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
        children: [
          if (!online)
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.md),
              child: AppMessage(
                tone: StatusTone.offline,
                title: l10n.adminOfflineFormTitle,
                detail: l10n.adminOfflineFormDetail,
              ),
            ),
          Text(
            l10n.adminSectionOrganization.toUpperCase(),
            style: context.textStyles.kicker,
          ),
          const SizedBox(height: AppSpacing.sm),
          AppTextFormField(
            name: 'name',
            label: l10n.adminFieldOrganizationName,
            required: true,
            initialValue: org?.name,
            hint: l10n.adminFieldOrganizationNameHint,
          ),
          const SizedBox(height: AppSpacing.md),
          AppDropdownFormField<String>(
            name: 'kind',
            label: l10n.adminFieldKind,
            required: true,
            initialValue: org?.kind ?? 'foundation',
            items: [
              for (final kind in ExplorerLabels.organizationKinds)
                AppDropdownItem(
                  value: kind,
                  label: ExplorerLabels.organizationKind(context, kind),
                ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          AppDropdownFormField<String>(
            name: 'country',
            label: l10n.adminColCountry,
            required: true,
            initialValue: org?.countryCode,
            items: [
              for (final country in AdminCountries.all)
                AppDropdownItem(value: country.code, label: country.name),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          AppTextFormField(
            name: 'region',
            label: l10n.adminFieldRegion,
            initialValue: org?.region,
          ),
          const SizedBox(height: AppSpacing.xl),
          Text(
            l10n.adminSectionContact.toUpperCase(),
            style: context.textStyles.kicker,
          ),
          const SizedBox(height: AppSpacing.sm),
          AppTextFormField(
            name: 'contactName',
            label: l10n.adminFieldContactName,
            kind: AppFieldKind.personName,
            required: true,
            initialValue: org?.contactName,
          ),
          const SizedBox(height: AppSpacing.md),
          AppTextFormField(
            name: 'contactEmail',
            label: l10n.adminFieldEmail,
            kind: AppFieldKind.email,
            required: true,
            initialValue: org?.contactEmail,
          ),
          const SizedBox(height: AppSpacing.md),
          AppTextFormField(
            name: 'contactPhone',
            label: l10n.adminFieldPhone,
            kind: AppFieldKind.phone,
            initialValue: org?.contactPhone,
            helper: l10n.adminFieldPhoneHelper,
          ),
          if (!_isEdit) ...[
            const SizedBox(height: AppSpacing.md),
            AppCheckboxFormField(
              name: 'inviteContact',
              label: l10n.adminInviteContactAsCoordinator,
              initialValue: true,
            ),
          ],
          const SizedBox(height: AppSpacing.xl),
          AppButton(
            label: _isEdit
                ? l10n.adminSaveChanges
                : l10n.adminCreateOrganization,
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
                : () => context.canPop()
                      ? context.pop()
                      : context.go(AdminRoutes.explorer),
          ),
        ],
      ),
    );
  }

  void _submit() {
    final form = _formKey.currentState;
    if (form == null || !form.saveAndValidate()) return;
    final values = form.value;
    final code = values['country'] as String;
    final input = OrganizationInput(
      name: values['name'] as String,
      kind: values['kind'] as String,
      countryCode: code,
      countryName: AdminCountries.nameOf(code),
      region: _nullIfEmpty(values['region']),
      contactName: values['contactName'] as String,
      contactEmail: values['contactEmail'] as String,
      contactPhone: _nullIfEmpty(values['contactPhone']),
    );
    context.read<OrganizationFormCubit>().submit(
      input,
      inviteContact: values['inviteContact'] == true,
    );
  }

  String? _nullIfEmpty(Object? value) {
    final text = (value as String?)?.trim();
    return text == null || text.isEmpty ? null : text;
  }
}
