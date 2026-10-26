import 'package:drift/drift.dart';

import '../../../../core/sync/data/powersync_drift_migration.dart';
import '../../../../core/sync/data/sync_database.dart';
import 'tables/session_tables.dart';

part 'session_drift_database.g.dart';

/// Typed view of the session-domain tables inside the single PowerSync
/// database (ADR 0004). Schema version stays 1: PowerSync owns the schema.
@DriftDatabase(
  tables: [
    CurriculumValues,
    ValueQuestions,
    Organizations,
    People,
    RoundTables,
    TableMembers,
    Sessions,
    SessionAttendance,
    MemberAssessments,
    MemberAnswers,
    MemberCommitments,
    SyncUploadRejections,
  ],
)
class SessionDriftDatabase extends _$SessionDriftDatabase {
  SessionDriftDatabase(SyncDatabase database)
    : super(database.createDriftConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => PowerSyncDriftMigration.strategy;
}
