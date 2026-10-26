import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_explorer_view.freezed.dart';
part 'saved_explorer_view.g.dart';

/// A table view the user saved on this device ("Guardar vista").
@freezed
abstract class SavedExplorerView with _$SavedExplorerView {
  const factory SavedExplorerView({
    required String id,
    required String name,
    @Default({}) Map<String, String> filters,
    @Default('') String search,
    @Default('code') String sortKey,
    @Default(true) bool ascending,
  }) = _SavedExplorerView;

  factory SavedExplorerView.fromJson(Map<String, dynamic> json) =>
      _$SavedExplorerViewFromJson(json);
}
