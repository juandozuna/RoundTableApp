import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

/// Date and time text for the session screens.
abstract final class SessionFormatters {
  /// "jueves 29 de octubre, 7:00 p. m." in the app's locale.
  static String when(BuildContext context, DateTime utc) {
    final locale = Localizations.localeOf(context).toString();
    return DateFormat("EEEE d 'de' MMMM, h:mm a", locale).format(utc.toLocal());
  }

  /// "Jue 7:00 p. m."
  static String shortWhen(BuildContext context, DateTime utc) {
    final locale = Localizations.localeOf(context).toString();
    return DateFormat('EEE h:mm a', locale).format(utc.toLocal());
  }

  /// "7:05 p. m."
  static String clock(BuildContext context, DateTime utc) {
    final locale = Localizations.localeOf(context).toString();
    return DateFormat.jm(locale).format(utc.toLocal());
  }
}
