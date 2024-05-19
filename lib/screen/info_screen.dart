import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class DraggableContainer extends StatelessWidget {
  const DraggableContainer({super.key});


  @override
  Widget build(BuildContext context) {
    return const DraggableContainerDemo();
  }
}

class DraggableContainerDemo extends StatefulWidget {
  const DraggableContainerDemo({super.key});

  @override
  _DraggableContainerDemoState createState() => _DraggableContainerDemoState();
}

class _DraggableContainerDemoState extends State<DraggableContainerDemo> {
  Offset position = const Offset(100, 100);
  double radius = 0.0;
  EdgeInsets margin = const EdgeInsets.all(0.0);
  Color color = Colors.blue;
  Timer? cooldownTimer;
  bool canChangeShape = true;

  void _changeShape() {
    setState(() {
      final random = Random();
      radius = random.nextDouble() * 50;
      margin = EdgeInsets.all(random.nextDouble() * 20);
      color = Color.fromARGB(
        255,
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
      );
    });
  }

  void _onPanUpdate(DragUpdateDetails details, double maxWidth, double maxHeight) {
    setState(() {
      double newDx = position.dx + details.delta.dx;
      double newDy = position.dy + details.delta.dy;

      bool atBorder = false;

      // Check if the new position is touching the borders
      if (newDx <= 0.0 || newDx >= maxWidth || newDy <= 0.0 || newDy >= maxHeight) {
        atBorder = true;
      }

      // Clamp the new position within the screen bounds
      newDx = newDx.clamp(0.0, maxWidth);
      newDy = newDy.clamp(0.0, maxHeight);

      position = Offset(newDx, newDy);

      // Trigger shape change if at the border and cooldown allows
      if (atBorder && canChangeShape) {
        _changeShape();
        canChangeShape = false;
        cooldownTimer?.cancel();
        cooldownTimer = Timer(Duration(seconds: 1), () {
          canChangeShape = true;
        });
      }
    });
  }

  @override
  void dispose() {
    cooldownTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Draggable Container'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double maxWidth = constraints.maxWidth - 100 - margin.horizontal;
          double maxHeight = constraints.maxHeight - 100 - margin.vertical;

          return Stack(
            children: <Widget>[
              Positioned(
                top: position.dy,
                left: position.dx,
                child: GestureDetector(
                  onPanUpdate: (details) => _onPanUpdate(details, maxWidth, maxHeight),
                  child: Container(
                    margin: margin,
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(radius),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: _changeShape,
                    child: Text('Change Shape and Color'),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}