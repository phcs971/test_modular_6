import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_modular_6/app/modules/home/home_module.dart';
import 'package:test_modular_6/app/modules/home/home_store.dart';
import 'package:test_modular_6/app/modules/home/usecases/log_increment.dart';

class MockLogIncrement extends Mock implements ILogIncrement {}

final mockLogIncrement = MockLogIncrement();

void main() {
  Modular.bindModule(HomeModule());

  Modular.replaceInstance<ILogIncrement>(mockLogIncrement);

  group("Home Store:", () {
    late HomeStore store;

    setUp(() {
      store = Modular.get<HomeStore>();
      store.update(0);
    });

    group("increment:", () {
      test("should increment and log", () async {
        await store.increment();
        verify(() => mockLogIncrement()).called(1);
        expect(store.state, 1);
      });

      test("should throw after 5", () async {
        store.update(4);
        await store.increment();
        expect(store.error, isA<Exception>());
      });
    });
  });
}
