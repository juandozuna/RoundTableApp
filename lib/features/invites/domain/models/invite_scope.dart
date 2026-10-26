/// Which invites to list. Platform administrators list without filters.
class InviteScope {
  const InviteScope({this.organizationId, this.roundTableId});

  final String? organizationId;
  final String? roundTableId;
}
