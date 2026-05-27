import 'package:exam/Views/Widgets/ProductWidget.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
      separatorBuilder: (context, index) => ProductWidgetStateFull(),
      itemBuilder: (context, index) => ProductWidgetStateFull(),
    );
  }
}
