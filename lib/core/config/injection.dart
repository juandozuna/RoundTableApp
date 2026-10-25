import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

final GetIt getIt = GetIt.instance;

/// Registers every `@injectable` / `@module` declaration under `lib/`.
/// Regenerate with `tool/codegen.sh` after changing annotations.
@InjectableInit(preferRelativeImports: true)
void configureDependencies() => getIt.init();
