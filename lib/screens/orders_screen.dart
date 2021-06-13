import 'package:flutter/material.dart';
import 'package:shop/widgets/app_drawer.dart';

class OrderScreen extends StatelessWidget {
  static const routName = '/OrderScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('OrderScreen'),),
      body: Center(child: Text('OrderScreen'),),
      drawer: AppDrawer(),
    );
  }
}