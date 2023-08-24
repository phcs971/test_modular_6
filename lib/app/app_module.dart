import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_modular_6/app/modules/core/core_module.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  List<Module> get imports => [
        HomeModule(),
        CoreModule(),
      ];

  @override
  void routes(r) {
    r.module('/', module: HomeModule());
  }
}
