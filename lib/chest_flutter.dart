import 'package:flutter/material.dart';
import 'package:chest/chest.dart';
import 'package:path_provider/path_provider.dart';

Future<void> initializeChest() async {
  WidgetsFlutterBinding.ensureInitialized();
  tape.rootPath = (await getApplicationDocumentsDirectory()).path;
}

class ReferenceBuilder<T> extends StatelessWidget {
  const ReferenceBuilder({
    Key key,
    @required this.reference,
    @required this.builder,
  }) : super(key: key);

  final Reference<T> reference;
  final Widget Function(BuildContext) builder;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<void>(
      stream: reference.watch(),
      builder: (context, _) => builder(context),
    );
  }
}
