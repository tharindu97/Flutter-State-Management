import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodnew/riverpod/number_state_notifier.dart';

//  Provider
//  StateProvider
//  StateNotifierProvider
//  ChangeNotifierProvider
//  StreamProvider
//  FutureProvider
//  ScopedProvider

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod State manegment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

//  Provider
final numberProvider = Provider<int>(
  ((ref) {
    return 30;
  }),
);

//  StateProvider
final counterStateProvider = StateProvider<int>(
  ((ref) {
    return 0;
  }),
);

//  StateNotifierProvider
final numberStateNotifier =
    StateNotifierProvider<NumbersNotifier, List<int>>((ref) {
  return NumbersNotifier();
});

//  ChangeNotifierProvider

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var value = ref.watch(numberProvider);
    final stateProvider = ref.watch(counterStateProvider);
    final numbersNotofierState = ref.watch(numberStateNotifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Riverpod"),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: numbersNotofierState.length,
          itemBuilder: (context, index) {
            return Text(numbersNotofierState[index].toString());
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ref.read(numberStateNotifier.notifier).add(5);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
