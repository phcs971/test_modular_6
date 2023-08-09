abstract interface class ILogIncrement {
  void call();
}

final class LogIncrement implements ILogIncrement {
  LogIncrement();

  @override
  void call() {
    // ignore: avoid_print
    print("Incremented");
  }
}
