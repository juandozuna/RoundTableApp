/// Kind of a queued local change.
enum SyncOperationType { put, patch, delete }

/// One queued local change, copied out of PowerSync's CRUD queue.
class SyncOperation {
  const SyncOperation({
    required this.type,
    required this.table,
    required this.id,
    this.data = const {},
  });

  final SyncOperationType type;
  final String table;

  /// Device-generated UUID; the server keeps the same id (AGENTS.md §8).
  final String id;

  /// Full row for [SyncOperationType.put], changed columns for
  /// [SyncOperationType.patch], empty for [SyncOperationType.delete].
  final Map<String, Object?> data;
}

/// The changes of one local transaction, uploaded together.
class SyncUploadBatch {
  const SyncUploadBatch({required this.operations, this.transactionId});

  final List<SyncOperation> operations;
  final int? transactionId;
}

/// One change the server refused permanently.
class SyncRejection {
  const SyncRejection({
    required this.table,
    required this.id,
    this.code,
    this.message,
  });

  final String table;
  final String id;

  /// Stable machine code, e.g. `session_closed`.
  final String? code;

  /// Spanish message safe to show to the person.
  final String? message;
}
