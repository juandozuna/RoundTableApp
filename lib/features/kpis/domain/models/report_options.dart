import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_options.freezed.dart';

@freezed
abstract class ReportOption with _$ReportOption {
  const factory ReportOption({
    required String id,
    required String label,
    String? parentId,
  }) = _ReportOption;
}

/// Values the report filter bar can offer inside the user's scope.
@freezed
abstract class ReportOptions with _$ReportOptions {
  const factory ReportOptions({
    @Default([]) List<ReportOption> countries,
    @Default([]) List<ReportOption> organizations,
    @Default([]) List<ReportOption> locations,
    @Default([]) List<ReportOption> tables,
    @Default([]) List<ReportOption> facilitators,
    @Default([]) List<ReportOption> modules,
  }) = _ReportOptions;
}
