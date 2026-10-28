import 'package:freezed_annotation/freezed_annotation.dart';

part 'program_value.freezed.dart';
part 'program_value.g.dart';

/// Module a [ProgramValue] belongs to.
@freezed
abstract class ProgramModule with _$ProgramModule {
  const factory ProgramModule({required int number, required String name}) =
      _ProgramModule;

  factory ProgramModule.fromJson(Map<String, dynamic> json) =>
      _$ProgramModuleFromJson(json);
}

/// One of the 48 values of the program, in global order ([sequence] 1–48).
@freezed
abstract class ProgramValue with _$ProgramValue {
  const factory ProgramValue({
    required String id,
    required int sequence,
    required int numberInModule,
    required String name,
    required ProgramModule module,
  }) = _ProgramValue;

  factory ProgramValue.fromJson(Map<String, dynamic> json) =>
      _$ProgramValueFromJson(json);
}
