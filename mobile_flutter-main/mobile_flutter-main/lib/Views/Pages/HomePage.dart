import 'package:exam/Views/Widgets/ProductList.dart';
import 'package:flutter/material.dart';
import 'package:exam/Views/Widgets/ButtonBar.dart';
import 'package:exam/Views/Widgets/Product_Widget.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        title: Center(child: Text("Home Page")),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        ],
      ),
      body: ProductWidget(),
      bottomNavigationBar: Buttonbar(),
    );
  }
}
