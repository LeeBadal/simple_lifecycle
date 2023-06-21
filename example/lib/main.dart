import 'package:flutter/material.dart';
import 'package:simple_lifecycle/simple_lifecycle.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ExampleScreen(),
    );
  }
}

class ExampleScreen extends StatefulWidget {
  @override
  _ExampleScreenState createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {
  SimpleLifecycle _lifecycle = SimpleLifecycle();

  @override
  void initState() {
    super.initState();
    _lifecycle.initialize();
    _lifecycle.onAppActive = () {
      print("App is active");
    };
    _lifecycle.onAppPaused = () {
      print("App has been paused");
    };
  }

  @override
  void dispose() {
    _lifecycle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example'),
      ),
      body: Center(
        child: Text('Example Screen'),
      ),
    );
  }
}
