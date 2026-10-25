import 'package:flutter/material.dart';

import '../extensions/build_context_x.dart';
import '../theme/app_spacing.dart';

/// Pulsing placeholder shown while content loads. Static when the platform
/// asks for reduced motion.
class Skeleton extends StatefulWidget {
  const Skeleton({
    super.key,
    this.width,
    this.height = 16,
    this.radius = AppRadii.sm,
  });

  final double? width;
  final double height;
  final double radius;

  @override
  State<Skeleton> createState() => _SkeletonState();
}

class _SkeletonState extends State<Skeleton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1100),
    lowerBound: 0.45,
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (MediaQuery.disableAnimationsOf(context)) {
      _controller.value = 1;
    } else if (!_controller.isAnimating) {
      _controller.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ExcludeSemantics(
      child: FadeTransition(
        opacity: _controller,
        child: Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            color: context.colors.surfaceAlt,
            borderRadius: BorderRadius.circular(widget.radius),
          ),
        ),
      ),
    );
  }
}

/// A list of card-shaped skeletons with a spoken "Cargando…".
class SkeletonList extends StatelessWidget {
  const SkeletonList({super.key, this.count = 4, this.itemHeight = 72});

  final int count;
  final double itemHeight;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: context.l10n.loading,
      liveRegion: true,
      child: Column(
        children: [
          for (var i = 0; i < count; i++)
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.sm + 2),
              child: Skeleton(height: itemHeight, radius: AppRadii.xl),
            ),
        ],
      ),
    );
  }
}
