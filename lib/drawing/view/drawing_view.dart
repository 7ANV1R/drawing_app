import 'dart:ui' as ui;

import 'package:drawing_app/drawing/cubit/drawing_cubit.dart';
import 'package:drawing_app/drawing/view/model/drawing_model.dart';
import 'package:drawing_app/drawing/view/widget/custom_drawing_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
  GlobalKey globalKey = GlobalKey();
  List<DrawingPaths?> drawingPaths = [];
  late Color selectedColor;
  double sliderValue = 3.0;

  @override
  void initState() {
    super.initState();
    selectedColor = Colors.black;
  }

  void onTapDone(BuildContext context) async {
    RenderRepaintBoundary boundary = globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    final image = await boundary.toImage();
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final pngBytes = byteData!.buffer.asUint8List();
    if (!mounted) return;
    Navigator.pop(context, pngBytes);
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
    return BlocBuilder<DrawingCubit, DrawingState>(
      builder: (context, state) {
        return state is DrawingInitial
            ? Scaffold(
                appBar: AppBar(
                  title: Row(
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
                        icon: Icon(
                          Icons.layers_clear,
                          color: selectedColor,
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {
                        onTapDone(context);
                      },
                      icon: const Icon(Icons.done_all_rounded),
                    )
                  ],
                ),
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
                                ..isAntiAlias = false
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
                                ..isAntiAlias = false
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
                      child: RepaintBoundary(
                        key: globalKey,
                        child: CustomPaint(
                          painter: CustomDrawing(drawingPaths),
                          child: Container(),
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
