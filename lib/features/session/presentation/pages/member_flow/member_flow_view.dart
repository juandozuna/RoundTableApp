import 'package:flutter/material.dart';

import '../session/cubit/session_state.dart';

/// Member experience for every stage. Replaced by the member-flow track.
class MemberFlowView extends StatelessWidget {
  const MemberFlowView({super.key, required this.view, this.embedded = false});

  final SessionView view;

  /// Rendered inside the facilitator's "Mis respuestas" tab: no page chrome.
  final bool embedded;

  @override
  Widget build(BuildContext context) => const Placeholder();
}
