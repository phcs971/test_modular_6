import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_modular_6/app/modules/core/core_module.dart';
import 'package:test_modular_6/app/modules/home/usecases/log_increment.dart';

import 'home_page.dart';
import 'home_store.dart';

class HomeModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(HomeStore.new);
  }

  @override
  void exportedBinds(Injector i) {
    i.add<ILogIncrement>(LogIncrement.new);
  }

  @override
  List<Module> get imports => [CoreModule()];

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (_) => const HomePage());
  }
}
