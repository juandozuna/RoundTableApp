import 'package:freezed_annotation/freezed_annotation.dart';

part 'content_language.freezed.dart';

/// A language the curriculum text exists in (ADR 0017).
@freezed
abstract class ContentLanguage with _$ContentLanguage {
  const factory ContentLanguage({
    required String code,
    required String name,
    @Default(false) bool isBase,
  }) = _ContentLanguage;
}

/// The languages offered on this device and the one in use.
@freezed
abstract class ContentLanguageChoice with _$ContentLanguageChoice {
  const ContentLanguageChoice._();

  const factory ContentLanguageChoice({
    @Default([]) List<ContentLanguage> available,
    @Default(ContentLanguageChoice.baseCode) String selected,
  }) = _ContentLanguageChoice;

  /// The Spanish base text, shown whenever a translation is missing.
  static const String baseCode = 'es';

  /// Worth showing only when there is something to choose from.
  bool get canChoose => available.length > 1;
}
