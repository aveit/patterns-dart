import 'dart:io';

import 'log_strategy.dart';

class FileLogStrategy implements LogStrategy {
  final File _file;

  FileLogStrategy() : _file = File('log.txt');

  @override
  void log({required String content}) {
    _file.writeAsString(content + '\n', mode: FileMode.append);
  }
}
