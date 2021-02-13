import 'package:flutter/material.dart';
import 'package:chest/chest.dart';
import 'package:path_provider/path_provider.dart';

Future<void> initializeChest() async {
  WidgetsFlutterBinding.ensureInitialized();
  tape.rootPath = (await getApplicationDocumentsDirectory()).path;
}

class ReferenceBuilder extends StatelessWidget {
  const ReferenceBuilder({
    Key? key,
    required this.reference,
    required this.builder,
  }) : super(key: key);

  final Reference<Object?> reference;
  final WidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<void>(
      stream: reference.watch(),
      builder: (context, _) => builder(context),
    );
  }
}
