/// Why a session write (answers, attendance, facilitator controls) did not
/// reach the server. Nothing is kept for later: the person retries.
enum SessionWriteFailureKind {
  /// No connection, or the server could not be reached.
  offline,

  /// The server refused the change; [SessionWriteFailure.messages] says why.
  rejected,
}

class SessionWriteFailure implements Exception {
  const SessionWriteFailure.offline()
    : kind = SessionWriteFailureKind.offline,
      messages = const [];

  const SessionWriteFailure.rejected(this.messages)
    : kind = SessionWriteFailureKind.rejected;

  final SessionWriteFailureKind kind;

  /// Spanish messages from the server, safe to show to the person.
  final List<String> messages;

  bool get isOffline => kind == SessionWriteFailureKind.offline;

  @override
  String toString() => 'SessionWriteFailure($kind, $messages)';
}
