import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

import 'id_generator.dart';

@LazySingleton(as: IdGenerator)
class UuidIdGenerator implements IdGenerator {
  static const Uuid _uuid = Uuid();

  @override
  String newId() => _uuid.v4();
}
