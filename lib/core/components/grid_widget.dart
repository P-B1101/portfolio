import 'package:flutter/material.dart';

class GridWidget extends StatelessWidget {
  final int crossAxisCount;
  final List<Widget> children;
  final double mainAxisSpacing;
  final double crossAxisSpacing;

  const GridWidget({
    Key? key,
    required this.crossAxisCount,
    required this.children,
    this.mainAxisSpacing = 0,
    this.crossAxisSpacing = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int columnsCount = crossAxisCount;
    final int rowsCount = (children.length / crossAxisCount).ceil();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(
        columnsCount,
        (index) => Flexible(
          child: _ColumnItemWidget(
            crossAxisSpacing: crossAxisSpacing,
            mainAxisSpacing: mainAxisSpacing,
            items: List.generate(
              rowsCount,
              (innerIndex) {
                final bool hasChild =
                    innerIndex + (rowsCount * index) < children.length;
                return hasChild
                    ? children[innerIndex + (rowsCount * index)]
                    : const SizedBox();
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _ColumnItemWidget extends StatelessWidget {
  final List<Widget> items;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  const _ColumnItemWidget({
    Key? key,
    required this.items,
    required this.crossAxisSpacing,
    required this.mainAxisSpacing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: mainAxisSpacing / 2,
        bottom: mainAxisSpacing / 2,
      ),
      child: Column(
        children: List.generate(
          items.length,
          (index) => Padding(
            padding: EdgeInsetsDirectional.only(
              start: crossAxisSpacing / 2,
              end: crossAxisSpacing / 2,
              top: mainAxisSpacing / 2,
              bottom: mainAxisSpacing / 2,
            ),
            child: items[index],
          ),
        ),
      ),
    );
  }
}
