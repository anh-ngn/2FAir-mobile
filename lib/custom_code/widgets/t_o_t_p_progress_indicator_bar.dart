// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class TOTPProgressIndicatorBar extends StatefulWidget {
  const TOTPProgressIndicatorBar({
    super.key,
    this.width,
    this.height,
    required this.period,
    this.paddingValue,
    this.color,
    this.thickness,
    this.backgroundColor,
  });

  final double? width;
  final double? height;
  final int period;
  final double? paddingValue;
  final Color? color;
  final double? thickness;
  final Color? backgroundColor;

  @override
  State<TOTPProgressIndicatorBar> createState() =>
      _TOTPProgressIndicatorBarState();
}

class _TOTPProgressIndicatorBarState extends State<TOTPProgressIndicatorBar>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    int secondsElapsed = DateTime.now().second % widget.period;
    int secondsRemaining = widget.period - secondsElapsed;
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.period),
    )..addListener(() {
        setState(() {});
      });
    controller.value = secondsElapsed / widget.period;
    controller.forward(from: controller.value);
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.forward(from: 0.0);
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(widget.paddingValue ?? 0),
      child: Container(
        width: widget.width ?? double.infinity,
        height: widget.height ?? 4.0,
        child: LinearProgressIndicator(
          value: controller.value,
          semanticsLabel: 'Linear progress indicator for TOTP',
          valueColor: AlwaysStoppedAnimation<Color?>(widget.color),
          backgroundColor: widget.backgroundColor,
          minHeight: widget.thickness ?? 4.0,
        ),
      ),
    );
  }
}
