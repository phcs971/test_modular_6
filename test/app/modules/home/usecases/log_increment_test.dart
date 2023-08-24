import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_modular_6/app/modules/core/core_module.dart';
import 'package:test_modular_6/app/modules/core/services/log_service.dart';
import 'package:test_modular_6/app/modules/home/home_module.dart';
import 'package:test_modular_6/app/modules/home/usecases/log_increment.dart';

class MockLogService extends Mock implements ILogService {}

final mockLogService = MockLogService();

class TestModule extends Module {
  @override
  List<Module> imports = [
    HomeModule(),
    CoreModule(),
  ];
}

void main() {
  group('Log Increment Usecase:', () {
    setUp(() {
      Modular.bindModule(HomeModule());
      Modular.bindModule(CoreModule());
      Modular.bindModule(TestModule());

      Modular.replaceInstance<ILogService>(mockLogService);
    });

    test('should log', () {
      /// gets the original instance of the log service - wrong
      final logIncrement = Modular.get<ILogIncrement>();
      logIncrement();
      verify(() => mockLogService.log(any())).called(1);
    });

    test('should log 2', () {
      /// gets the mocked instance of the log service - correct
      final logIncrement = LogIncrement(Modular.get());
      logIncrement();
      verify(() => mockLogService.log(any())).called(1);
    });
  });
}
