import 'package:freezed_annotation/freezed_annotation.dart';

part 'organization_input.freezed.dart';
part 'organization_input.g.dart';

/// Fields of an organization; absent ones are left unchanged on update.
@freezed
abstract class OrganizationInput with _$OrganizationInput {
  const factory OrganizationInput({
    String? name,
    String? kind,
    String? countryCode,
    String? countryName,
    String? region,
    String? contactName,
    String? contactEmail,
    String? contactPhone,
  }) = _OrganizationInput;

  factory OrganizationInput.fromJson(Map<String, dynamic> json) =>
      _$OrganizationInputFromJson(json);
}
