/// One change sent to the `sync-upload` Edge Function.
enum SessionWriteType {
  put('PUT'),
  patch('PATCH');

  const SessionWriteType(this.wireValue);

  final String wireValue;
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
    'op': type.wireValue,
    'type': table,
    'id': id,
    'opData': data,
  };
}
