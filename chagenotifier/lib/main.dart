import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => Favorites(),
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title:
              Text('My Favoriet is ' + Provider.of<Favorites>(context).fruit),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              FruitButton(fruit: 'Apples'),
              FruitButton(fruit: 'Orange'),
              FruitButton(fruit: 'bananas')
            ],
          ),
        ),
      ),
    );
  }
}

class FruitButton extends StatelessWidget {
  final String? fruit;
  FruitButton({@required this.fruit});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Provider.of<Favorites>(context, listen: false)
              .changeFruit(fruit ?? 'fruit');
        },
        child: Text(fruit ?? 'fruit'));
  }
}

class Favorites extends ChangeNotifier {
  String fruit = 'Unkonwn';
  void changeFruit(String newFruit) {
    fruit = newFruit;
    notifyListeners();
  }
}
