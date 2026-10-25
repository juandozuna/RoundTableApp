import 'package:flutter/material.dart';

import '../../l10n/gen/app_localizations.dart';
import '../theme/app_breakpoints.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../theme/status_colors.dart';

extension BuildContextX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);

  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  AppColors get colors => Theme.of(this).extension<AppColors>()!;

  StatusColors get statusColors => Theme.of(this).extension<StatusColors>()!;

  AppTextStyles get textStyles => Theme.of(this).extension<AppTextStyles>()!;

  AppLayout get layout => AppLayout.of(this);
}
