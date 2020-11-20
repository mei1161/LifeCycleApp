import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  //#1
  @override
  _LifecycleAppState createState() => _LifecycleAppState();
}

class _LifecycleAppState extends State<MyApp> with WidgetsBindingObserver {
  AppLifecycleState _lifecycleState;
  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose(){
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state){
    setState(() {
      _lifecycleState = state;
      print('state = $_lifecycleState');
    });
  }

  @override
  Widget build(BuildContext context){
      return MaterialApp(
        title:'LifecycleApp',
        home: Scaffold(
          appBar: AppBar(
            title: Text('lifecycle app'),
          ),
        ),
      );
    }
  }


