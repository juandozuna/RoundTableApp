import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/extensions/build_context_x.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_toast.dart';
import '../../../../../core/widgets/form_fields/app_text_form_field.dart';
import '../../../../admin/admin_routes.dart';
import '../../../../admin/presentation/admin_error_messages.dart';
import '../../../../admin/presentation/widgets/admin_denied_view.dart';
import '../../../../admin/presentation/widgets/admin_page_frame.dart';
import '../../../curriculum_routes.dart';
import 'cubit/curriculum_upload_cubit.dart';
import 'cubit/curriculum_upload_state.dart';
import 'widgets/curriculum_diff_view.dart';

/// Upload of the curriculum (Spanish) or of one language's text: choose a
/// JSON/CSV file or paste it, review the diff, then apply it.
class CurriculumUploadPage extends StatefulWidget {
  const CurriculumUploadPage({super.key, this.locale});

  /// Content-language code; null uploads the Spanish curriculum.
  final String? locale;

  @override
  State<CurriculumUploadPage> createState() => _CurriculumUploadPageState();
}

class _CurriculumUploadPageState extends State<CurriculumUploadPage> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final TextEditingController _content = TextEditingController();

  String get _back => CurriculumRoutes.curriculumPath(locale: widget.locale);

  @override
  void dispose() {
    _content.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AdminPageFrame(
      title: widget.locale == null
          ? l10n.curriculumUploadTitle
          : l10n.curriculumUploadTranslationTitle(widget.locale!),
      backFallbackLocation: _back,
      maxContentWidth: 820,
      builder: (context, access) {
        if (!access.scope!.isAdministrator) {
          return AdminDeniedView(
            message: l10n.curriculumDeniedMessage,
            homeLocation: AdminRoutes.explorer,
          );
        }
        return BlocConsumer<CurriculumUploadCubit, CurriculumUploadState>(
          listenWhen: (a, b) =>
              a.pickedContent != b.pickedContent ||
              a.status != b.status ||
              a.error != b.error,
          listener: _onState,
          builder: (context, state) =>
              _buildBody(context, state, access.online),
        );
      },
    );
  }

  void _onState(BuildContext context, CurriculumUploadState state) {
    final l10n = context.l10n;
    final picked = state.pickedContent;
    if (picked != null) _content.text = picked;
    if (state.status == CurriculumUploadStatus.applied) {
      AppToast.show(
        context,
        l10n.curriculumToastApplied,
        kind: AppToastKind.success,
      );
      context.go(_back);
    } else if (state.error != null) {
      AppToast.show(
        context,
        state.error!.adminMessage(l10n),
        kind: AppToastKind.error,
      );
    }
  }

  Widget _buildBody(
    BuildContext context,
    CurriculumUploadState state,
    bool online,
  ) {
    final l10n = context.l10n;
    final cubit = context.read<CurriculumUploadCubit>();
    final busy =
        state.status == CurriculumUploadStatus.previewing ||
        state.status == CurriculumUploadStatus.applying;
    final plan = state.plan;
    final previewed = state.status == CurriculumUploadStatus.previewed;
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
      children: [
        Text(
          widget.locale == null
              ? l10n.curriculumUploadIntro
              : l10n.curriculumUploadTranslationIntro,
          style: context.textTheme.bodyMedium,
        ),
        const SizedBox(height: AppSpacing.md),
        AppButton(
          label: l10n.curriculumPickFile,
          icon: Icons.folder_open_rounded,
          variant: AppButtonVariant.secondary,
          fullWidth: false,
          onPressed: busy ? null : cubit.pickFile,
        ),
        if (state.fileName != null)
          Padding(
            padding: const EdgeInsets.only(top: AppSpacing.xs),
            child: Text(
              l10n.curriculumPickedFile(state.fileName!),
              style: context.textTheme.bodySmall,
            ),
          ),
        const SizedBox(height: AppSpacing.md),
        FormBuilder(
          key: _formKey,
          child: AppTextFormField(
            name: 'content',
            label: l10n.curriculumPasteLabel,
            hint: l10n.curriculumPasteHint,
            controller: _content,
            maxLines: 8,
            enabled: !busy,
            onChanged: (_) => cubit.contentChanged(),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        ListenableBuilder(
          listenable: _content,
          builder: (context, _) => AppButton(
            label: l10n.curriculumReviewChanges,
            icon: Icons.fact_check_outlined,
            loading: state.status == CurriculumUploadStatus.previewing,
            onPressed: online && !busy && _content.text.trim().isNotEmpty
                ? () => cubit.preview(_content.text, locale: widget.locale)
                : null,
          ),
        ),
        if (plan != null) ...[
          const SizedBox(height: AppSpacing.lg),
          Text(
            l10n.curriculumReviewTitle,
            style: context.textTheme.titleMedium,
          ),
          const SizedBox(height: AppSpacing.sm),
          CurriculumDiffView(plan: plan),
        ],
        if (previewed && plan != null && plan.canApply) ...[
          const SizedBox(height: AppSpacing.lg),
          AppButton(
            label: l10n.curriculumApplyChanges,
            icon: Icons.check_rounded,
            loading: state.status == CurriculumUploadStatus.applying,
            onPressed: online && !busy
                ? () => cubit.apply(_content.text, locale: widget.locale)
                : null,
          ),
        ],
        const SizedBox(height: AppSpacing.sm),
        AppButton(
          label: l10n.actionCancel,
          variant: AppButtonVariant.secondary,
          onPressed: busy
              ? null
              : () => context.canPop() ? context.pop() : context.go(_back),
        ),
      ],
    );
  }
}
