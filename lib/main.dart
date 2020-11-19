import 'package:flutter/material.dart';
import 'package:pos_system/cart.dart';
import 'package:pos_system/pages/Teams.dart';
import 'consts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: TITLE,
      theme: ThemeData(
        primarySwatch: PRIMARY_COLOR,
      ),
      home: MyHomePage(title: TITLE),
      routes: {Cart.ROUTE: (context) => Cart()},
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Teams();
  }
}
