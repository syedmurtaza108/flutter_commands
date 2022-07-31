import 'package:args/command_runner.dart';
import 'package:flutter_commands/flutter_commands.dart';
import 'package:mason_logger/mason_logger.dart';

class TestCommand extends Command<int> {
  @override
  final name = 'test';
  @override
  final description = 'Wrapper for `flutter test`';

  TestCommand() {
    argParser.addOption(
      'flutter',
      abbr: 'f',
      help:
          'Alias for flutter, useful when different versions of flutter are available',
      defaultsTo: 'flutter',
    );
  }

  @override
  Future<int> run() async {
    FCMRunner.logger.info(yellow.wrap('Executing...'));
    final flutterAlias = argResults?['flutter'] as String? ?? 'flutter';
    await FCMRunner.shell.run('$flutterAlias test');
    FCMRunner.logger.success('Command executed successfully');
    return 0;
  }
}
