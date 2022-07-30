import 'package:args/command_runner.dart';
import 'package:flutter_commands/commands/build_runner.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:process_run/shell_run.dart';

class FCCommandRunner extends CommandRunner<int> {
  FCCommandRunner()
      : super(
          'FC Commands',
          'A wrapper of Flutter commands used daily for flutter development',
        ) {
    addCommand(BuildRunnerCommand());
  }

  final _logger = Logger();
  static final shell = Shell();
  
  @override
  Future<int> run(Iterable<String> args) async {
    try {
      final _argResults = parse(args);
      return await runCommand(_argResults) ?? ExitCode.success.code;
    } on FormatException catch (e, stackTrace) {
      _logger
        ..err(e.message)
        ..err('$stackTrace')
        ..info('')
        ..info(usage);
      return ExitCode.usage.code;
    } on UsageException catch (e) {
      _logger
        ..err(e.message)
        ..info('')
        ..info(e.usage);
      return ExitCode.usage.code;
    }
  }
}
