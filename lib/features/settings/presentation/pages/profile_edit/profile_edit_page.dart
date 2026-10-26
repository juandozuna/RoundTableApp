import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../core/extensions/build_context_x.dart';
import '../../../../../core/form_rules/app_field_kind.dart';
import '../../../../../core/network/api_error_messages.dart';
import '../../../../../core/network/api_exception.dart';
import '../../../../../core/routing/navigation_x.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_scaffold.dart';
import '../../../../../core/widgets/app_toast.dart';
import '../../../../../core/widgets/empty_state.dart';
import '../../../../../core/widgets/form_fields/app_text_form_field.dart';
import '../../../../../core/widgets/skeleton.dart';
import '../../../domain/models/profile_update.dart';
import '../../../domain/models/user_profile.dart';
import '../../../settings_routes.dart';
import 'cubit/profile_edit_cubit.dart';
import 'cubit/profile_edit_state.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  static const String _firstName = 'first_name';
  static const String _lastName = 'last_name';
  static const String _position = 'position';
  static const String _phone = 'phone';

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileEditCubit, ProfileEditState>(
      listener: _onStateChanged,
      builder: (context, state) => AppScaffold(
        title: context.l10n.profileEditTitle,
        backFallbackLocation: SettingsRoutes.settings,
        maxContentWidth: AppSpacing.contentMaxWidth,
        body: switch (state) {
          ProfileEditLoading() => const Padding(
            padding: EdgeInsets.only(top: AppSpacing.lg),
            child: SkeletonList(count: 3),
          ),
          ProfileEditUnavailable(:final error) => ErrorState(
            message: error is ApiException
                ? error.userMessage(context.l10n)
                : context.l10n.settingsProfileUnavailable,
            onRetry: context.read<ProfileEditCubit>().load,
          ),
          ProfileEditEditing(:final profile, :final saving) => _buildForm(
            context,
            profile,
            saving: saving,
          ),
          ProfileEditSaved(:final profile) => _buildForm(
            context,
            profile,
            saving: false,
          ),
        },
      ),
    );
  }

  void _onStateChanged(BuildContext context, ProfileEditState state) {
    final l10n = context.l10n;
    if (state is ProfileEditSaved) {
      AppToast.show(context, l10n.toastSaved, kind: AppToastKind.success);
      context.popOrGo(SettingsRoutes.settings);
    } else if (state is ProfileEditEditing && state.error != null) {
      final error = state.error;
      AppToast.show(
        context,
        error is ApiException ? error.userMessage(l10n) : l10n.errorGeneric,
        kind: AppToastKind.error,
      );
    }
  }

  Widget _buildForm(
    BuildContext context,
    UserProfile profile, {
    required bool saving,
  }) {
    final l10n = context.l10n;
    return FormBuilder(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
        children: [
          Text(l10n.profileEditIntro, style: context.textTheme.bodyMedium),
          const SizedBox(height: AppSpacing.lg),
          AppTextFormField(
            name: _firstName,
            label: l10n.profileEditFirstName,
            kind: AppFieldKind.personName,
            required: true,
            initialValue: profile.firstName,
            enabled: !saving,
          ),
          const SizedBox(height: AppSpacing.md),
          AppTextFormField(
            name: _lastName,
            label: l10n.profileEditLastName,
            kind: AppFieldKind.personName,
            required: true,
            initialValue: profile.lastName,
            enabled: !saving,
          ),
          const SizedBox(height: AppSpacing.md),
          AppTextFormField(
            name: _position,
            label: l10n.profileEditPosition,
            initialValue: profile.position,
            enabled: !saving,
          ),
          const SizedBox(height: AppSpacing.md),
          AppTextFormField(
            name: _phone,
            label: l10n.profileEditPhone,
            kind: AppFieldKind.phone,
            helper: l10n.profileEditPhoneHelper,
            initialValue: profile.phone,
            enabled: !saving,
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            l10n.profileEditEmailNote(profile.email ?? '—'),
            style: context.textTheme.bodySmall,
          ),
          const SizedBox(height: AppSpacing.xl),
          AppButton(
            label: l10n.actionSave,
            icon: Icons.check_rounded,
            loading: saving,
            onPressed: saving ? null : () => _submit(context),
          ),
        ],
      ),
    );
  }

  void _submit(BuildContext context) {
    final form = _formKey.currentState;
    if (form == null || !form.saveAndValidate()) return;
    final values = form.value;
    String? optional(String key) {
      final value = (values[key] as String?)?.trim();
      return value == null || value.isEmpty ? null : value;
    }

    context.read<ProfileEditCubit>().save(
      ProfileUpdate(
        firstName: values[_firstName] as String,
        lastName: values[_lastName] as String,
        position: optional(_position),
        phone: optional(_phone),
      ),
    );
  }
}
