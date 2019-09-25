import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

enum SlideDirection {
  RIGHT,
  LEFT,
}

enum ButtonState { NOTCONFIRMED, CONFIRMED }

class SlideButton extends StatefulWidget {


  /// The height of this widget
  final double height;

  /// The percentage the bar must be to the button be confirmed.
  /// defaults to 0.9
  final double confirmPercentage;

  /// The percentage the bar is set to snap when the user is not dragging
  /// Doubles as the initial value for the bar
  final double initialSliderPercentage;

  /// Allows toggling of the draggability of the SlidingUpPanel.
  /// Set this to false to prevent the user from being able to drag
  /// the panel up and down. Defaults to true.
  final bool isDraggable;

  /// If non-null, this callback
  /// is called as the button slides around with the
  /// current position of the panel. The position is a double
  /// between initialSliderPercentage and 1.0 where
  /// initialSlidePercentage is fully NOTCONFIRMED and 1.0 is CONFIRMED.
  final void Function(double position) onButtonSlide;

  /// If non-null, this callback is called when the
  /// button is CONFIRMED
  final VoidCallback onButtonOpened;

  /// If non-null, this callback is called when the button
  /// is NOTCONFIRMED
  final VoidCallback onButtonClosed;

  /// Either SlideDirection.LEFT or SlideDirection.RIGHT. Indicates which way
  /// the button need to be slided. Defaults to RIGHT. If set to LEFT, the panel attaches
  /// itself to the right of the screen and is confirmed .
  final SlideDirection slideDirection;


  const SlideButton({
      Key key,
      this.height,
      this.confirmPercentage = 0.9,
      this.initialSliderPercentage = 0.2,
      this.slideDirection = SlideDirection.RIGHT,
      this.isDraggable = true,
      this.onButtonSlide,
      this.onButtonOpened,
      this.onButtonClosed,
  }) : super(key: key);

  @override
  _SlideButtonState createState() => _SlideButtonState();
}

class _SlideButtonState extends State<SlideButton>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  var _maxWidth = 0.0;
  var _buttonState = ButtonState.NOTCONFIRMED;
  

  var logger = Logger();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300))
      ..addListener(() {
        setState(() {});

        if(_animationController.value == 1.0) _buttonState = ButtonState.CONFIRMED;

        if(widget.onButtonSlide != null) widget.onButtonSlide(_animationController.value);

        if(widget.onButtonOpened != null && _animationController.value == 1.0) widget.onButtonOpened();

        if(widget.onButtonClosed != null && _animationController.value == widget.initialSliderPercentage) widget.onButtonClosed();

      });
    _animationController.value = widget.initialSliderPercentage;

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
                          decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(50),
                              topRight: Radius.circular(50)
                            )
                          ),
                          
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
    if(widget.slideDirection == SlideDirection.RIGHT) {
      _animationController.value = (details.globalPosition.dx) / _maxWidth;
    } else {
      _animationController.value = 1.0 - (details.globalPosition.dx) / _maxWidth;
    }
  }

  void _onDragEnd(DragEndDetails details) {
    if(_animationController.isAnimating) return;
    if(_animationController.value > widget.confirmPercentage) {
      _open();
    } else {
      _animationController.animateTo(
          widget.initialSliderPercentage,
          duration: Duration(milliseconds: 300),
          curve: Curves.fastOutSlowIn
      );
    }
  }

  void _open() {
    _animationController.fling(velocity: 1.0);
  }
}