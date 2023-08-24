import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_modular_6/app/modules/core/services/log_service.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.add<ILogService>(LogService.new);
  }
}
