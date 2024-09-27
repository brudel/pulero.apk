
import 'package:flutter/material.dart';

class MyFutureBuilder<T> extends StatelessWidget {
  const MyFutureBuilder({
    super.key,
    this.future,
    this.initialData,
    required this.builder,
  });

  final Future<T>? future;
  final T? initialData;
  final Widget Function(BuildContext, T) builder;


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();

          } else if (snapshot.hasError) {
            return Text('Se fudeu: ${snapshot.error}');

          } else {
            return builder(context, snapshot.requireData);
          }
      }
    );
  }
}