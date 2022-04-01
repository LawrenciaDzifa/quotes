import 'package:flutter/material.dart';
import 'package:quotes/Views/category_grid.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: AllCategory(),
      ),
    );
  }
}
