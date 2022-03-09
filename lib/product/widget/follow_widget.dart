import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class RowInformation extends StatefulWidget {
  int deger;
  String text;
  RowInformation({
    Key? key,
    required this.deger,
    required this.text,
  }) : super(key: key);

  @override
  State<RowInformation> createState() => _RowInformationState();
}

class _RowInformationState extends State<RowInformation> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.verticalPaddingMedium,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: context.horizontalPaddingMedium,
            child: Text(widget.deger.toString()),
          ),
          Text(widget.text),
        ],
      ),
    );
  }
}
