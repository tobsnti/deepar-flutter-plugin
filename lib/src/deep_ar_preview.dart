import 'dart:io';
import 'package:flutter/material.dart';

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
    return widget.deepArController.isInitialized
        ? Platform.isAndroid
            ? _androidView()
            : _iOSView()
        : Container();
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
