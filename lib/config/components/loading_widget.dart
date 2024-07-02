import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatefulWidget {

  final double size;

  const LoadingWidget({super.key,this.size =60});

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size,
      width: widget.size,
      child: Platform.isAndroid ? const CircularProgressIndicator(
        color: Colors.deepPurple,

      ): const CupertinoActivityIndicator(
        color: Colors.deepPurple,
      ),
    );
  }
}
