import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../profile/model/post_model.dart';

class PostWidget extends StatefulWidget {
  final Post index;
  const PostWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingNormal,
      child: SizedBox(
        width: context.dynamicWidth(1),
        height: context.dynamicWidth(0.5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(13),
          child: Image.network(
            widget.index.url,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
