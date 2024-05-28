import 'dart:async';

import 'package:flutter/material.dart';

class MultiTouchDetector extends StatefulWidget {
  const MultiTouchDetector(
      {super.key, required this.afterTouches, required this.child});

  final Function() afterTouches;
  final Widget child;

  @override
  State<MultiTouchDetector> createState() => _MultiTouchDetectorState();
}

class _MultiTouchDetectorState extends State<MultiTouchDetector> {
  int _touchCount = 0;
  Timer? _timer;

  void _handleTap() {
    setState(() {
      _touchCount++;
      if (_touchCount == 1) {
        _timer = Timer(const Duration(seconds: 3), _resetCounter);
      } else if (_touchCount >= 7) {
        widget.afterTouches();
        _resetCounter();
      }
    });
  }

  void _resetCounter() {
    _touchCount = 0;
    _timer?.cancel();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: widget.child,
    );
  }
}
