/// ISO 3166-1 alpha-2 countries offered when creating an organization
/// (Spanish names; reference data, not UI copy).
abstract final class AdminCountries {
  static const List<({String code, String name})> all = [
    (code: 'AR', name: 'Argentina'),
    (code: 'BO', name: 'Bolivia'),
    (code: 'BR', name: 'Brasil'),
    (code: 'CL', name: 'Chile'),
    (code: 'CO', name: 'Colombia'),
    (code: 'CR', name: 'Costa Rica'),
    (code: 'DO', name: 'República Dominicana'),
    (code: 'EC', name: 'Ecuador'),
    (code: 'SV', name: 'El Salvador'),
    (code: 'ES', name: 'España'),
    (code: 'US', name: 'Estados Unidos'),
    (code: 'GT', name: 'Guatemala'),
    (code: 'HN', name: 'Honduras'),
    (code: 'MX', name: 'México'),
    (code: 'NI', name: 'Nicaragua'),
    (code: 'PA', name: 'Panamá'),
    (code: 'PY', name: 'Paraguay'),
    (code: 'PE', name: 'Perú'),
    (code: 'UY', name: 'Uruguay'),
    (code: 'VE', name: 'Venezuela'),
  ];

  static String? nameOf(String code) {
    for (final country in all) {
      if (country.code == code) return country.name;
    }
    return null;
  }

  /// IANA time zone most tables of the country use, as a form default.
  static String defaultTimezone(String countryCode) => switch (countryCode) {
    'DO' => 'America/Santo_Domingo',
    'CO' => 'America/Bogota',
    'GT' => 'America/Guatemala',
    'MX' => 'America/Mexico_City',
    'EC' => 'America/Guayaquil',
    'PE' => 'America/Lima',
    'CL' => 'America/Santiago',
    'AR' => 'America/Argentina/Buenos_Aires',
    'ES' => 'Europe/Madrid',
    'US' => 'America/New_York',
    'VE' => 'America/Caracas',
    'PA' => 'America/Panama',
    'CR' => 'America/Costa_Rica',
    'HN' => 'America/Tegucigalpa',
    'SV' => 'America/El_Salvador',
    'NI' => 'America/Managua',
    'BO' => 'America/La_Paz',
    'PY' => 'America/Asuncion',
    'UY' => 'America/Montevideo',
    'BR' => 'America/Sao_Paulo',
    _ => 'America/Bogota',
  };

  static const List<String> timezones = [
    'America/Santo_Domingo',
    'America/Bogota',
    'America/Guatemala',
    'America/Mexico_City',
    'America/Guayaquil',
    'America/Lima',
    'America/Santiago',
    'America/Argentina/Buenos_Aires',
    'America/Caracas',
    'America/Panama',
    'America/Costa_Rica',
    'America/Tegucigalpa',
    'America/El_Salvador',
    'America/Managua',
    'America/La_Paz',
    'America/Asuncion',
    'America/Montevideo',
    'America/Sao_Paulo',
    'America/New_York',
    'Europe/Madrid',
  ];
}
