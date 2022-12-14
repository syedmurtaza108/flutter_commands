import 'package:args/command_runner.dart';
import 'package:flutter_commands/flutter_commands.dart';
import 'package:mason_logger/mason_logger.dart';

class BuildRunnerCommand extends Command<int> {
  @override
  final name = 'build';
  @override
  final description =
      'Wrapper for `flutter pub run build_runner build --delete-conflicting-outputs`';

  BuildRunnerCommand() {
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
    await FCMRunner.shell.run(
      '$flutterAlias pub run build_runner build --delete-conflicting-outputs',
    );
    FCMRunner.logger.success('Command executed successfully');
    return 0;
  }
}
