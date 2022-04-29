import 'log_strategy.dart';

class ConsoleLogStrategy implements LogStrategy {
  @override
  void log({required String content}) {
    print(content);
  }
}
