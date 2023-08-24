abstract class ILogService {
  void log(String message);
}

class LogService implements ILogService {
  LogService();

  @override
  void log(String message) {
    // ignore: avoid_print
    print(message);
  }
}
