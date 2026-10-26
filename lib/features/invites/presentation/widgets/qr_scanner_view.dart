import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_button.dart';

/// Camera preview that reports the first QR it reads. Handles a denied
/// camera permission with a way to retry or type the code instead.
class QrScannerView extends StatefulWidget {
  const QrScannerView({
    super.key,
    required this.onScanned,
    required this.onTypeCode,
  });

  final ValueChanged<String> onScanned;
  final VoidCallback onTypeCode;

  @override
  State<QrScannerView> createState() => _QrScannerViewState();
}

class _QrScannerViewState extends State<QrScannerView> {
  MobileScannerController _controller = MobileScannerController(
    formats: const [BarcodeFormat.qrCode],
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _retry() {
    final old = _controller;
    setState(() {
      _controller = MobileScannerController(
        formats: const [BarcodeFormat.qrCode],
      );
    });
    old.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          fit: StackFit.expand,
          children: [
            MobileScanner(
              controller: _controller,
              onDetect: (capture) {
                final value = capture.barcodes
                    .map((barcode) => barcode.rawValue)
                    .whereType<String>()
                    .firstOrNull;
                if (value != null) widget.onScanned(value);
              },
              errorBuilder: (context, error) => _buildDenied(
                context,
                denied:
                    error.errorCode == MobileScannerErrorCode.permissionDenied,
              ),
            ),
            IgnorePointer(child: _buildFrame(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildFrame(BuildContext context) {
    final color = Colors.white.withValues(alpha: 0.9);
    return Center(
      child: FractionallySizedBox(
        widthFactor: 0.64,
        heightFactor: 0.64,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: color, width: 4),
          ),
        ),
      ),
    );
  }

  Widget _buildDenied(BuildContext context, {required bool denied}) {
    final l10n = context.l10n;
    return ColoredBox(
      color: context.colors.surface,
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.no_photography_rounded,
              size: 40,
              color: context.colors.muted,
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              l10n.invitesCameraDeniedTitle,
              textAlign: TextAlign.center,
              style: context.textTheme.titleMedium,
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              denied
                  ? l10n.invitesCameraDeniedBody
                  : l10n.invitesCameraUnavailableBody,
              textAlign: TextAlign.center,
              style: context.textTheme.bodySmall,
            ),
            const SizedBox(height: AppSpacing.md),
            AppButton(
              label: l10n.invitesTypeCode,
              size: AppButtonSize.small,
              onPressed: widget.onTypeCode,
            ),
            AppButton(
              label: l10n.invitesCameraRetry,
              icon: Icons.refresh_rounded,
              variant: AppButtonVariant.ghost,
              size: AppButtonSize.small,
              onPressed: _retry,
            ),
          ],
        ),
      ),
    );
  }
}
