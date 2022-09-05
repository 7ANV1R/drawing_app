import 'package:drawing_app/drawing/cubit/drawing_cubit.dart';
import 'package:drawing_app/drawing/view/model/drawing_model.dart';
import 'package:drawing_app/drawing/view/widget/custom_drawing_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class DrawingView extends StatefulWidget {
  const DrawingView({
    Key? key,
  }) : super(key: key);

  @override
  State<DrawingView> createState() => _DrawingViewState();
}

class _DrawingViewState extends State<DrawingView> {
  List<DrawingPaths?> drawingPaths = [];
  late Color selectedColor;
  double sliderValue = 3.0;

  @override
  void initState() {
    super.initState();
    selectedColor = Colors.black;
  }

  void selectColor() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: const EdgeInsets.all(16),
          contentPadding: const EdgeInsets.all(16),
          title: const Text('Select a color :'),
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: selectedColor,
              onColorChanged: (color) {
                setState(() {
                  selectedColor = color;
                });
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Okay'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<DrawingCubit, DrawingState>(
      builder: (context, state) {
        return state is DrawingInitial
            ? Scaffold(
                body: Stack(
                  alignment: Alignment.center,
                  children: [
                    GestureDetector(
                      onPanStart: (details) {
                        setState(() {
                          drawingPaths.add(
                            DrawingPaths(
                              offset: details.localPosition,
                              paint: Paint()
                                ..color = selectedColor
                                ..isAntiAlias = true
                                ..strokeWidth = sliderValue
                                ..strokeCap = StrokeCap.round
                                ..strokeJoin = StrokeJoin.round,
                            ),
                          );
                        });
                      },
                      onPanUpdate: (details) {
                        setState(() {
                          drawingPaths.add(
                            DrawingPaths(
                              offset: details.localPosition,
                              paint: Paint()
                                ..color = selectedColor
                                ..isAntiAlias = true
                                ..strokeWidth = sliderValue
                                ..strokeCap = StrokeCap.round
                                ..strokeJoin = StrokeJoin.round,
                            ),
                          );
                        });
                      },
                      onPanEnd: (details) {
                        setState(() {
                          drawingPaths.add(null);
                        });
                      },
                      child: CustomPaint(
                        painter: CustomDrawing(drawingPaths),
                        child: Container(),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      child: Container(
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.4),
                              blurRadius: 5.0,
                              spreadRadius: 1.0,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                selectColor();
                              },
                              icon: Icon(
                                Icons.color_lens,
                                color: selectedColor,
                              ),
                            ),
                            Expanded(
                              child: Slider(
                                value: sliderValue,
                                min: 1,
                                max: 10,
                                onChanged: (value) {
                                  setState(() {
                                    sliderValue = value;
                                  });
                                },
                                activeColor: selectedColor,
                                inactiveColor: selectedColor.withOpacity(0.25),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  drawingPaths.clear();
                                });
                              },
                              icon: const Icon(Icons.layers_clear),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : const CircularProgressIndicator();
      },
    );
  }
}
