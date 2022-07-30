import 'package:args/command_runner.dart';
import 'package:flutter_commands/flutter_commands.dart';

class BuildRunnerCommand extends Command<int> {
  @override
  final name = 'build_runner';
  @override
  final description =
      'Wrapper for `flutter pub run build_runner build --delete-conflicting-outputs`';

  BuildRunnerCommand() {
    argParser.addOption(
      'conflict',
      abbr: 'c',
      help: 'Toggle conflicting outputs.',
      defaultsTo: 'true',
      allowed: ['true', 'false'],
      allowedHelp: {
        'true': 'Will run with --delete-conflicting-outputs',
        'false': 'Will run without --delete-conflicting-outputs',
      },
    );

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
    print(argResults?.arguments.join(','));
    print('Command executing...');
    await FCCommandRunner.shell.run(
      'flutter pub run build_runner build --delete-conflicting-outputs',
    );
    print('Command executed.');
    return 0;
  }
}
