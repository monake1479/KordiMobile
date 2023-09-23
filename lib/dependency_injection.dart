import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:kordi_mobile/dependency_injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: false,
  asExtension: true,
)
void configureDependencies() => getIt.$initGetIt();
