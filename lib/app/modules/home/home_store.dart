import 'package:flutter_triple/flutter_triple.dart';
import 'package:test_modular_6/app/modules/usecases/log_increment.dart';

class HomeStore extends Store<int> {
  final ILogIncrement _logIncrement;
  HomeStore(this._logIncrement) : super(0);

  Future<void> increment() async {
    setLoading(true);

    await Future.delayed(const Duration(seconds: 1));

    int value = state + 1;
    if (value < 5) {
      _logIncrement();
      update(value);
    } else {
      setError(Exception('Error: state not can be > 4'));
    }

    setLoading(false);
  }
}
