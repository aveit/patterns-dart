import 'package:strategy_pattern/strategies/console_log_strategy.dart';
import 'package:strategy_pattern/strategies/file_log_strategy.dart';

void main(List<String> arguments) {
  final fileStrategy = FileLogStrategy();
  final consoleStrategy = ConsoleLogStrategy();

  consoleStrategy.log(content: 'Logging into the console :)');

  fileStrategy.log(content: 'Logging into a file :)');
}
