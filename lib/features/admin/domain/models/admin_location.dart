import 'package:freezed_annotation/freezed_annotation.dart';

import 'record_status.dart';

part 'admin_location.freezed.dart';
part 'admin_location.g.dart';

@freezed
abstract class AdminLocation with _$AdminLocation {
  const factory AdminLocation({
    required String id,
    required String organizationId,
    required String name,
    String? city,
    String? region,
    String? address,
    @JsonKey(unknownEnumValue: RecordStatus.inactive)
    @Default(RecordStatus.active)
    RecordStatus status,
  }) = _AdminLocation;

  factory AdminLocation.fromJson(Map<String, dynamic> json) =>
      _$AdminLocationFromJson(json);
}
