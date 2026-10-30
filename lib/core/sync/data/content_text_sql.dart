import 'sync_schema.dart';

/// SQL fragments that resolve curriculum text in the user's content language
/// with the Spanish base text as fallback (ADR 0017). Pure strings, so the
/// queries stay reactive to both the translations and the language setting.
abstract final class ContentTextSql {
  /// The selected content language code, or null when none is stored.
  static const String locale =
      '(SELECT ${CoreSyncTables.valueColumn} FROM '
      '${CoreSyncTables.localSyncState} WHERE id = '
      "'${CoreSyncTables.contentLocaleKey}')";

  /// Translated [field] of the [entityType] row aliased [alias], else [base].
  static String text({
    required String entityType,
    required String alias,
    required String field,
    required String base,
  }) =>
      'COALESCE((SELECT NULLIF(TRIM(tr.$field), \'\') '
      'FROM curriculum_translations tr '
      "WHERE tr.entity_type = '$entityType' AND tr.entity_id = $alias.id "
      'AND tr.locale = $locale), $base)';

  /// Name of a module or value.
  static String name(String entityType, String alias) => text(
    entityType: entityType,
    alias: alias,
    field: 'name',
    base: '$alias.name',
  );
}
