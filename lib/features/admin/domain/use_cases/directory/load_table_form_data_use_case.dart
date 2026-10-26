import 'package:injectable/injectable.dart';

import '../../models/admin_location.dart';
import '../../models/admin_person.dart';
import '../../models/admin_table.dart';
import '../../models/table_form_data.dart';
import '../../services/admin_directory_service.dart';

/// Choices for the table form: organizations, the chosen organization's
/// locations and the people who can facilitate, plus the table when editing.
@injectable
class LoadTableFormDataUseCase {
  const LoadTableFormDataUseCase(this._directory);

  final AdminDirectoryService _directory;

  Future<TableFormData> call({String? tableId, String? organizationId}) async {
    final table = tableId == null ? null : await _directory.table(tableId);
    final orgId = table?.organizationId ?? organizationId;
    final organizations = _directory.organizations();
    final locations = orgId == null
        ? Future.value(const <AdminLocation>[])
        : _directory.locations(organizationId: orgId);
    final people = orgId == null
        ? Future.value(const <AdminPerson>[])
        : _directory.people(organizationId: orgId);
    final tables = orgId == null
        ? Future.value(const <AdminTable>[])
        : _directory.tables(organizationId: orgId);
    return TableFormData(
      table: table,
      organizations: await organizations,
      locations: await locations,
      people: await people,
      organizationTables: await tables,
    );
  }
}
