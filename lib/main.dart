import 'package:flutter/material.dart';
import 'package:chest/chest.dart';

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
    return StreamBuilder<T>(
      stream: reference.watch(),
      builder: (context, _) => builder(context),
    );
  }
}
