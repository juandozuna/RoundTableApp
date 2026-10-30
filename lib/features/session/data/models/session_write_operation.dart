/// One change sent to the `sync-upload` Edge Function.
enum SessionWriteType {
  put('PUT'),
  patch('PATCH');

  const SessionWriteType(this.wireValue);

  final String wireValue;
}

/// JSON keys of the `sync-upload` request (api-contract.md §4).
abstract final class SessionWriteKeys {
  static const String batch = 'batch';
  static const String op = 'op';
  static const String type = 'type';
  static const String id = 'id';
  static const String opData = 'opData';
}

class SessionWriteOperation {
  const SessionWriteOperation({
    required this.type,
    required this.table,
    required this.id,
    this.data = const {},
  });

  const SessionWriteOperation.put({
    required String table,
    required String id,
    required Map<String, Object?> data,
  }) : this(type: SessionWriteType.put, table: table, id: id, data: data);

  const SessionWriteOperation.patch({
    required String table,
    required String id,
    required Map<String, Object?> data,
  }) : this(type: SessionWriteType.patch, table: table, id: id, data: data);

  final SessionWriteType type;
  final String table;

  /// Device-generated UUID; the server keeps the same id, so resending an
  /// operation is safe (AGENTS.md §8).
  final String id;

  /// Full row for a put, only the changed columns for a patch.
  final Map<String, Object?> data;

  Map<String, Object?> toJson() => {
    SessionWriteKeys.op: type.wireValue,
    SessionWriteKeys.type: table,
    SessionWriteKeys.id: id,
    SessionWriteKeys.opData: data,
  };
}
