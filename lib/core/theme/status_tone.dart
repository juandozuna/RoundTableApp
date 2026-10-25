/// Semantic status shown by pills, rings and banners. Each tone pairs a
/// colour with a line style and an icon so status never relies on colour
/// alone (ADR 0013).
enum StatusTone { ok, pending, syncing, late, offline, error, info, neutral }

/// Border style that accompanies a [StatusTone].
enum StatusLineStyle { solid, dotted, dashed, double }

extension StatusToneStyle on StatusTone {
  StatusLineStyle get lineStyle => switch (this) {
    StatusTone.pending => StatusLineStyle.dotted,
    StatusTone.offline || StatusTone.late => StatusLineStyle.dashed,
    StatusTone.error => StatusLineStyle.double,
    StatusTone.ok ||
    StatusTone.syncing ||
    StatusTone.info ||
    StatusTone.neutral => StatusLineStyle.solid,
  };
}
