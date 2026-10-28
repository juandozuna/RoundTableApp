import '../models/admin_location.dart';
import '../models/admin_organization.dart';
import '../models/admin_person.dart';
import '../models/location_input.dart';
import '../models/organization_input.dart';
import '../models/organization_status.dart';
import '../models/person_input.dart';
import '../models/session_cancel_reason.dart';
import '../models/table_change.dart';
import '../models/table_input.dart';

/// Online administration writes. Failures carry the server's typed code
/// (`table_full`, `duplicate_table_code`, `organization_inactive`, …).
abstract interface class AdminManagementService {
  Future<AdminOrganization> createOrganization(OrganizationInput input);

  Future<AdminOrganization> updateOrganization(
    String id,
    OrganizationInput input,
  );

  Future<AdminOrganization> setOrganizationStatus(
    String id,
    OrganizationStatus status,
  );

  Future<AdminLocation> createLocation(
    String organizationId,
    LocationInput input,
  );

  Future<AdminLocation> updateLocation(String id, LocationInput input);

  /// Creates the table with its first session schedule and its facilitator.
  Future<TableChange> createTable({
    required String organizationId,
    required TableInput input,
    required PersonRef facilitator,
  });

  Future<void> updateTable(String id, TableInput input);

  /// Moves one scheduled session; [localDateTime] is a wall-clock time in the
  /// table's timezone (RF-30).
  Future<void> rescheduleSession({
    required String sessionId,
    required DateTime localDateTime,
    String? reason,
  });

  /// Cancels one scheduled session; the next one carries the same value.
  Future<void> cancelSession({
    required String sessionId,
    required SessionCancelReason reason,
    String? note,
  });

  /// Adds an extra meeting before the table's next regular session.
  Future<void> addExtraordinarySession({
    required String tableId,
    required DateTime localDateTime,
    String? reason,
  });

  /// The previous facilitator ends their seat; they stay as a member when
  /// [keepPreviousAsMember] is set. History is kept.
  Future<TableChange> changeFacilitator({
    required String tableId,
    required PersonRef facilitator,
    required bool keepPreviousAsMember,
  });

  Future<void> addMember({required String tableId, required String personId});

  Future<void> moveMember({
    required String tableMemberId,
    required String toTableId,
  });

  /// Ends the seat without deleting any history.
  Future<void> deactivateMember(String tableMemberId);

  Future<AdminPerson> updatePerson(
    String id, {
    String? firstName,
    String? lastName,
    String? position,
    String? email,
    String? phone,
    PersonStatusChange? status,
  });
}

/// Only these statuses can be set on a person by an administrator.
enum PersonStatusChange { active, inactive }
