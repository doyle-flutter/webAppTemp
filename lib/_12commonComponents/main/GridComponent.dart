import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GridComponent extends StatelessWidget {
  final List datas;
  final int gridCount;
  final Widget Function(BuildContext context, int index) itemBuilder;
  const GridComponent({
    required this.datas,
    required this.gridCount,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: this.gridCount,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0
      ),
      itemCount: this.datas.length,
      itemBuilder: this.itemBuilder
    );
  }
}
