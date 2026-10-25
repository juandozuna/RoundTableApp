import 'package:flutter/painting.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/theme/app_palette.dart';
import 'package:gold_roundtables/core/theme/app_theme.dart';
import 'package:gold_roundtables/core/theme/contrast.dart';

void main() {
  test('ratio matches known WCAG values', () {
    expect(
      Contrast.ratio(const Color(0xFF000000), const Color(0xFFFFFFFF)),
      closeTo(21, 0.01),
    );
    expect(
      Contrast.ratio(const Color(0xFF777777), const Color(0xFFFFFFFF)),
      closeTo(4.48, 0.01),
    );
  });

  for (final (name, p) in [
    ('dark', AppPalette.dark),
    ('light', AppPalette.light),
  ]) {
    group('$name theme', () {
      void expectRatio(String pair, Color fg, Color bg, double min) {
        final ratio = Contrast.ratio(fg, bg);
        expect(
          ratio,
          greaterThanOrEqualTo(min),
          reason: '$pair = ${ratio.toStringAsFixed(2)} < $min',
        );
      }

      test('body text on every surface', () {
        for (final (surface, color) in [
          ('bg', p.bg),
          ('bg2', p.bg2),
          ('surf', p.surf),
          ('surf2', p.surf2),
        ]) {
          expectRatio('ink/$surface', p.ink, color, Contrast.text);
          expectRatio('mut/$surface', p.mut, color, Contrast.text);
        }
      });

      test('accent text and accent-filled controls', () {
        expectRatio('acc/bg', p.acc, p.bg, Contrast.text);
        expectRatio('acc/surf', p.acc, p.surf, Contrast.text);
        expectRatio('onacc/accb', p.onacc, p.accb, Contrast.text);
        expectRatio('onacc/accg', p.onacc, p.accg, Contrast.text);
        expectRatio(
          'onc/acc (colorScheme.onPrimary)',
          p.onc,
          p.acc,
          Contrast.text,
        );
        expectRatio('bg/ink (toast)', p.bg, p.ink, Contrast.text);
      });

      test('error text on surfaces', () {
        expectRatio('err/bg', p.err, p.bg, Contrast.text);
        expectRatio('err/surf', p.err, p.surf, Contrast.text);
      });

      test('status colours as icons and borders (non-text)', () {
        for (final (status, color) in [
          ('lime', p.lime),
          ('amber', p.amber),
          ('off', p.off),
          ('mag', p.mag),
          ('err', p.err),
          ('sky', p.sky),
          ('acc', p.acc),
        ]) {
          expectRatio('$status/bg', color, p.bg, Contrast.nonText);
          expectRatio('$status/surf', color, p.surf, Contrast.nonText);
        }
      });

      test('content on solid status fills (badges)', () {
        for (final (status, color) in [
          ('lime', p.lime),
          ('amber', p.amber),
          ('off', p.off),
          ('mag', p.mag),
          ('err', p.err),
          ('sky', p.sky),
        ]) {
          expectRatio('onc/$status', p.onc, color, Contrast.text);
        }
      });

      test('pill and banner text over tinted fills', () {
        for (final (status, color) in [
          ('lime', p.lime),
          ('amber', p.amber),
          ('off', p.off),
          ('mag', p.mag),
          ('err', p.err),
          ('acc', p.acc),
        ]) {
          final tinted = Contrast.over(color.withValues(alpha: 0.16), p.bg);
          expectRatio('ink/$status-tint', p.ink, tinted, Contrast.text);
        }
      });

      test('control boundaries are visible', () {
        expectRatio('bd/bg', p.bd, p.bg, Contrast.nonText);
        expectRatio('bd/surf', p.bd, p.surf, Contrast.nonText);
      });

      test('ThemeData exposes the tokens', () {
        final theme = p == AppPalette.dark ? AppTheme.dark : AppTheme.light;
        expect(theme.colorScheme.primary, p.acc);
        expect(theme.colorScheme.onPrimary, p.onc);
        expect(theme.scaffoldBackgroundColor, p.bg);
      });
    });
  }

  test('white initials on every avatar colour', () {
    for (final color in AppPalette.avatarColors) {
      expect(
        Contrast.ratio(const Color(0xFFFFFFFF), color),
        greaterThanOrEqualTo(Contrast.text),
        reason: color.toString(),
      );
    }
  });

  test('white text on the offline gradient', () {
    for (final color in AppPalette.offlineGradient) {
      expect(
        Contrast.ratio(const Color(0xFFFFFFFF), color),
        greaterThanOrEqualTo(Contrast.text),
      );
    }
  });
}
