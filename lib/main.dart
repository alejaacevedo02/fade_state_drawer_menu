import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: FadeAppTest()));
}

class FadeAppTest extends StatelessWidget {
  const FadeAppTest({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fade Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyFadeTest(title:"Drawer and animation App"),
    );
  }
}

class MyFadeTest extends StatefulWidget {
  const MyFadeTest({super.key, required this.title});

  final String title;

  @override
  State<MyFadeTest> createState() => _MyFadeTest();
}

class _MyFadeTest extends State<MyFadeTest> with TickerProviderStateMixin {
  late AnimationController controller;
  late CurvedAnimation curve;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    curve = CurvedAnimation(
      parent: controller,
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("my App UI"), actions: <Widget>[
        IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.monetization_on)),
      ]),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text("Drawer Header"),
            ),
            ListTile(
              title: const Text("test item1"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("test item2"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("test item3"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: FadeTransition(
          opacity: curve,
          child: const FlutterLogo(
            size: 100.0,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Fade',
        onPressed: () {
          controller.forward();
        },
        child: const Icon(Icons.brush),
      ),
    );
  }
}
