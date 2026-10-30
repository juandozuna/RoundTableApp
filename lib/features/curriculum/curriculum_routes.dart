/// Paths and query keys of the curriculum administration.
abstract final class CurriculumRoutes {
  static const String curriculum = '/admin/curriculo';
  static const String upload = '/admin/curriculo/subir';

  /// Language of the text to view or upload (a content-language code).
  static const String localeQuery = 'idioma';

  static String curriculumPath({String? locale}) =>
      Uri(path: curriculum, queryParameters: {localeQuery: ?locale}).toString();

  static String uploadPath({String? locale}) =>
      Uri(path: upload, queryParameters: {localeQuery: ?locale}).toString();
}
