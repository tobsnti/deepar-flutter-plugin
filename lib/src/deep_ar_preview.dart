import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'deep_ar_controller.dart';

/// Displays live preview with desired effects.
class DeepArPreview extends StatefulWidget {
  const DeepArPreview(this.deepArController, {Key? key, this.onViewCreated})
      : super(key: key);
  final DeepArController deepArController;
  final Function? onViewCreated;

  @override
  State<DeepArPreview> createState() => _DeepArPreviewState();
}

class _DeepArPreviewState extends State<DeepArPreview> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: (1 / widget.deepArController.aspectRatio),
      child: Platform.isAndroid
          ? (widget.deepArController.isInitialized
              ? _androidView()
              : Container())
          : _iOSView(),
    );
  }

  Widget _iOSView() {
    return widget.deepArController.buildPreview(oniOSViewCreated: () {
      widget.onViewCreated?.call();
      setState(() {});
    });
  }

  Widget _androidView() {
    widget.onViewCreated?.call();
    return widget.deepArController.buildPreview();
  }
}
