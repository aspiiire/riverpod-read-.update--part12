import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

final providerOfNumber = StateProvider((ref) => 0);

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int myNumber = ref.watch(providerOfNumber);

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            '$myNumber',
            style: const TextStyle(fontSize: 60),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ref
                .read(providerOfNumber.notifier)
                .update((prevState) => prevState + 1);
          },
          child: const Icon(Icons.plus_one_rounded),
        ),
      ),
    );
  }
}
