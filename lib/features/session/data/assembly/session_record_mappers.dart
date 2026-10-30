import '../../../../core/data/records/records.dart';
import '../../domain/models/session_info.dart';

extension SessionRecordMapper on SessionRecord {
  SessionInfo toInfo() => SessionInfo(
    id: id,
    tableId: roundTableId,
    status: status,
    stage: stage,
    scheduledAt: scheduledAt.toUtc(),
    valueId: valueId,
    followUpValueId: followUpValueId,
    startedAt: startedAt?.toUtc(),
    endedAt: endedAt?.toUtc(),
    answersClosedAt: answersClosedAt?.toUtc(),
  );
}
