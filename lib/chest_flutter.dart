import 'package:async/async.dart';
import 'package:chest/chest.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

export 'package:chest/chest.dart';
export 'package:flutter_tapers/flutter_tapers.dart';

Future<void> initializeChest() async {
  WidgetsFlutterBinding.ensureInitialized();
  tape.rootPath = (await getApplicationDocumentsDirectory()).path;
}

class ReferenceBuilder extends StatelessWidget {
  const ReferenceBuilder({
    super.key,
    required this.reference,
    required this.builder,
  });

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

class ReferencesBuilder extends StatelessWidget {
  const ReferencesBuilder({
    super.key,
    required this.references,
    required this.builder,
  });

  final List<Reference<Object?>> references;
  final WidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<void>(
      stream: StreamGroup.merge(
        references.map((reference) => reference.watch()),
      ),
      builder: (context, _) => builder(context),
    );
  }
}
