import 'dart:math' as math;
import 'dart:ui';

/// Geometry of the seats around the table: a circle for up to 5 people, an
/// increasingly tall ellipse for crowded tables (up to 9 including the
/// facilitator), so avatars never overlap on a 360 px wide phone.
class RoundTableLayout {
  const RoundTableLayout._({
    required this.width,
    required this.height,
    required this.avatarSize,
    required this.seatWidth,
    required this.seatHeight,
    required this.seats,
    required this.centerRect,
  });

  final double width;
  final double height;
  final double avatarSize;
  final double seatWidth;
  final double seatHeight;

  /// Top-left corner of each seat, in seating order starting at the top and
  /// going clockwise.
  final List<Offset> seats;

  /// The tabletop in the middle.
  final Rect centerRect;

  static RoundTableLayout compute({required int seats, required double width}) {
    final n = math.max(1, seats);
    final avatar = n <= 5
        ? 60.0
        : n <= 7
        ? 52.0
        : 46.0;
    final seatW = n <= 5
        ? 80.0
        : n <= 7
        ? 70.0
        : 64.0;
    final seatH = avatar + 38;
    final rx = ((width - seatW - 8) / 2).floorToDouble();
    final stretch = n <= 5
        ? 1.0
        : n <= 7
        ? 1.16
        : n <= 9
        ? 1.3
        : 1.42;
    final ry = (rx * stretch).roundToDouble();
    final cx = width / 2;
    final cy = ry + avatar / 2 + 4;
    final positions = <Offset>[
      for (var i = 0; i < n; i++)
        Offset(
          cx + rx * math.cos((-90 + 360 * i / n) * math.pi / 180) - seatW / 2,
          cy + ry * math.sin((-90 + 360 * i / n) * math.pi / 180) - avatar / 2,
        ),
    ];
    final tableW = math.max(110.0, 2 * rx - seatW * 1.1);
    final tableH = n <= 5 ? tableW : math.max(110.0, 2 * ry - seatH * 0.9);
    return RoundTableLayout._(
      width: width,
      height: 2 * ry + avatar + 4 + 44,
      avatarSize: avatar,
      seatWidth: seatW,
      seatHeight: seatH,
      seats: positions,
      centerRect: Rect.fromCenter(
        center: Offset(cx, cy),
        width: tableW,
        height: tableH,
      ),
    );
  }
}
