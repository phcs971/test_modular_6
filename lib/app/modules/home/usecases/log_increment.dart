import '../../core/services/log_service.dart';

abstract interface class ILogIncrement {
  void call();
}

final class LogIncrement implements ILogIncrement {
  final ILogService _logService;

  LogIncrement(this._logService);

  @override
  void call() {
    _logService.log("Incremented");
  }
}
