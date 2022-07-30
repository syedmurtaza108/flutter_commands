import 'package:flutter_commands/flutter_commands.dart';

Future<void> main(List<String> args) async {
  final a = ['build_runner', '-c', 'false'];
  await FCCommandRunner().run(a);
}
