import 'package:args/command_runner.dart';
import 'package:flutter_commands/commands/commands.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:process_run/shell_run.dart';

class FCMRunner extends CommandRunner<int> {
  FCMRunner()
      : super(
          'fcm',
          'A wrapper of Flutter commands used daily for flutter development',
        ) {
    addCommand(ApkCommand());
    addCommand(BuildRunnerCommand());
    addCommand(FormatCommand());
    addCommand(IpaCommand());
    addCommand(RunCommand());
    addCommand(TestCommand());
    addCommand(ScreenshotCommand());
  }

  static final logger = Logger();
  static final shell = Shell();

  @override
  Future<int> run(Iterable<String> args) async {
    try {
      final _argResults = parse(args);
      return await runCommand(_argResults) ?? ExitCode.success.code;
    } on FormatException catch (e, stackTrace) {
      logger
        ..err(e.message)
        ..err('$stackTrace')
        ..info('')
        ..info(usage);
      return ExitCode.usage.code;
    } on UsageException catch (e) {
      logger
        ..err(e.message)
        ..info('')
        ..info(e.usage);
      return ExitCode.usage.code;
    }
  }
}
