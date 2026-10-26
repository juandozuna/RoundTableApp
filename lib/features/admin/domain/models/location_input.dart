import 'package:freezed_annotation/freezed_annotation.dart';

import 'record_status.dart';

part 'location_input.freezed.dart';
part 'location_input.g.dart';

@freezed
abstract class LocationInput with _$LocationInput {
  const factory LocationInput({
    String? name,
    String? city,
    String? region,
    String? address,
    RecordStatus? status,
  }) = _LocationInput;

  factory LocationInput.fromJson(Map<String, dynamic> json) =>
      _$LocationInputFromJson(json);
}
