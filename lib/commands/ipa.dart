import 'package:args/command_runner.dart';
import 'package:flutter_commands/flutter_commands.dart';
import 'package:mason_logger/mason_logger.dart';

class IpaCommand extends Command<int> {
  @override
  final name = 'ipa';
  @override
  final description =
      'Wrapper for `flutter build ipa --release --dart-define="env=env" --flavor flavor --export-options-plist=export-options.plist --target target`';

  IpaCommand() {
    argParser.addOption(
      'flutter',
      abbr: 'f',
      help:
          'Alias for flutter, useful when different versions of flutter are available',
      defaultsTo: 'flutter',
    );
    argParser.addOption(
      'env',
      abbr: 'e',
      allowed: ['dev', 'stg', 'prod'],
      allowedHelp: {
        'dev': 'Run in dev environment',
        'stg': 'Run in stg environment',
        'prod': 'Run in prod environment',
      },
      defaultsTo: 'dev',
    );
    argParser.addOption(
      'flavor',
      abbr: 'l',
      allowed: ['dev', 'stg', 'prod'],
      allowedHelp: {
        'development': 'Run for development flavor',
        'staging': 'Run for staging flavor',
        'production': 'Run for production flavor',
      },
      defaultsTo: 'development',
    );
    argParser.addOption(
      'export-options',
      abbr: 'x',
      defaultsTo: 'ExportOptions-AppStore.plist',
    );
    argParser.addOption(
      'target',
      abbr: 't',
      help:
          'Target file for executing this command, useful when main.dart is renamed.',
      defaultsTo: 'lib/main.dart',
    );
  }

  @override
  Future<int> run() async {
    FCMRunner.logger.info(yellow.wrap('Executing...'));
    final flutterAlias = argResults?['flutter'] as String? ?? 'flutter';
    final env = argResults?['env'] as String? ?? 'dev';
    final flavor = argResults?['flavor'] as String? ?? 'development';
    final target = argResults?['target'] as String? ?? 'lib/main.dart';
    final exportOptions = argResults?['export-options'] as String? ??
        'ExportOptions-AppStore.plist';
    await FCMRunner.shell.run(
      '$flutterAlias build ipa --release --dart-define="env=$env" --flavor $flavor --export-options-plist=$exportOptions --target $target',
    );
    FCMRunner.logger.success('Command executed successfully');
    return 0;
  }
}
