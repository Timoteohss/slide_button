import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

enum SlideDirection {
  RIGHT,
  LEFT,
}

enum ButtonState { NOTCONFIRMED, CONFIRMED }

class SwipeButton extends StatefulWidget {


  /// The height of this widget
  final double height;

  /// The percentage the bar must be to the button be confirmed.
  /// defaults to 0.9
  final double confirmPercentage;

  /// Allows toggling of the draggability of the SlidingUpPanel.
  /// Set this to false to prevent the user from being able to drag
  /// the panel up and down. Defaults to true.
  final bool isDraggable;

  /// Either SlideDirection.LEFT or SlideDirection.RIGHT. Indicates which way
  /// the button need to be slided. Defaults to RIGHT. If set to LEFT, the panel attaches
  /// itself to the right of the screen and is confirmed .
  final SlideDirection slideDirection;

  /// The default state of the button; either ButtonState.CONFIRMED or ButtonState.NOTCONFIRMED.
  /// This value defaults to ButtonState.NOTCONFIRMED which indicates that the button is
  /// in not confirmed by the user. ButtonState.CONFIRMED indicates that
  /// by default the button is confirmed and the user does not have to swipe.
  final ButtonState defaultPanelState;

  const SwipeButton(
      {Key key,
      this.height,
      this.confirmPercentage = 0.9,
      this.slideDirection = SlideDirection.RIGHT,
      this.defaultPanelState = ButtonState.NOTCONFIRMED,
      this.isDraggable = true, })
      : super(key: key);

  @override
  _SwipeButtonState createState() => _SwipeButtonState();
}

class _SwipeButtonState extends State<SwipeButton>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  var _maxWidth = 0.0;
  var _minWidth = 0.0;

  var logger = Logger();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300))
      ..addListener(() {
        setState(() {});
      });
    _animationController.value = 0.2;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          _maxWidth = constraints.maxWidth;
          _minWidth = constraints.minWidth;

          return Stack(
            children: <Widget>[
              Align(
                alignment: Alignment(-1.0, 0.0),
                child: Container(
                  height: widget.height,
                  color: Colors.green,
                ),
              ),
              Align(
                alignment: Alignment(-1.0, 0.0),
                child: GestureDetector(
                  onVerticalDragUpdate: widget.isDraggable ? _onDrag : null,
                  onVerticalDragEnd: widget.isDraggable ? _onDragEnd : null,
                  onTap: () => print(_animationController.value),
                  child: Container(
                    height: widget.height,
                    child: Align(
                      alignment: widget.slideDirection == SlideDirection.RIGHT
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      child: FractionallySizedBox(
                        widthFactor: _animationController.value,
                        heightFactor: 1.0,
                        child: Container(
                          color: Colors.pink,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
    });
  }

  void _onDrag(DragUpdateDetails details) {
    _animationController.value = (details.globalPosition.dx) / _maxWidth;
  }

  void _onDragEnd(DragEndDetails details) {
    if(_animationController.isAnimating) return;
    if(_animationController.value > 0.9) {
      _open();
    } else {
      _animationController.animateTo(
          0.2,
          duration: Duration(milliseconds: 300),
          curve: Curves.decelerate
      );
    }
  }

  void _open() {
    _animationController.fling(velocity: 1.0);
  }
}

//
//void _onDragUpdate(DragUpdateDetails details) {
//  final pos = _container.globalToLocal(details.globalPosition) - _start;
////    print("container: ${_container.globalToLocal(details.globalPosition)}, start: $_start");
//
//  final off = _container.size.width * 0.7;
//  final extent = _container.size.width - _positioned.size.width + off;
////    print("container width: ${_container.size.width}, positioned: ${_positioned.size.width}");
//
////    _controller.value = 0.2 + ((pos.dx.clamp(0.0, extent) / extent) * 0.75);
//  _controller.value = 0.2 + ((pos.dx.clamp(0.0, extent) / extent) * 0.75);
////    print("Pos: ${pos.dx}, extend: $extent, value: ${_controller.value}");
//}
//
//void _onDragEnd(DragEndDetails details) {
//  final extent = _container.size.width - _positioned.size.width;
//  var fractionalVelocity = (details.primaryVelocity / extent).abs();
//  if (fractionalVelocity < 0.5) {
//    fractionalVelocity = 0.5;
//  }
//  SwipePosition result;
//  double acceleration, velocity;
//  if (_controller.value > 0.90) {
//    acceleration = 3;
//    velocity = fractionalVelocity;
//    result = SwipePosition.SwipeRight;
//    if(widget.onChanged != null) {
//      widget.onChanged(result);
//    }
//  } else {
//    acceleration = -3;
//    velocity = -fractionalVelocity;
//    result = SwipePosition.SwipeLeft;
//  }
//  final simulation = _SwipeSimulation(
//    acceleration,
//    _controller.value,
//    1.0,
//    velocity,
//  );
//  _controller.animateWith(simulation).then((_) {
//    if (widget.onChanged != null) {
//      _controller.value = 0.2;
//    }
//  });
//}
//
//
//class _SwipeSimulation extends GravitySimulation {
//  _SwipeSimulation(
//      double acceleration, double distance, double endDistance, double velocity)
//      : super(acceleration, distance, endDistance, velocity);
//
//  @override
//  double x(double time) => super.x(time).clamp(0.2, 1.0);
//
//  @override
//  bool isDone(double time) {
//    final _x = x(time).abs();
//    return _x <= 0.2 || _x >= 1.0;
//  }
//}
