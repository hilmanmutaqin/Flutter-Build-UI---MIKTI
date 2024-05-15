import 'package:flutter/material.dart';
import 'package:latihan_flutter/colors/colors.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  double _xPosition = 0;
  double _yPosition = 0;
  double _containerHeight = 200;
  double _containerWidth = 200;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final screenWidth = MediaQuery.of(context).size.width;
      final screenHeight = MediaQuery.of(context).size.height;

      setState(() {
        _xPosition = (screenWidth - _containerWidth) / 2;
        _yPosition = (screenHeight - _containerHeight) / 2;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            child: Stack(
              children: [
                Positioned(
                  top: _yPosition,
                  left: _xPosition,
                  child: GestureDetector(
                    onPanUpdate: (DragUpdateDetails e) {
                      setState(() {
                        _xPosition += e.delta.dx;
                        _yPosition += e.delta.dy;
                      });
                    },
                    child: Container(
                      height: _containerHeight,
                      width: _containerWidth,
                      color: navigation,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
