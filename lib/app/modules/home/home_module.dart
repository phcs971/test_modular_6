import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_modular_6/app/modules/usecases/log_increment.dart';

import 'home_page.dart';
import 'home_store.dart';

class HomeModule extends Module {
  @override
  void binds(i) {
    i.add<ILogIncrement>(LogIncrement.new);
    i.addLazySingleton(HomeStore.new);
  }

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (_) => const HomePage());
  }
}
