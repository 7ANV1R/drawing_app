import 'package:drawing_app/drawing/cubit/drawing_cubit.dart';
import 'package:drawing_app/drawing/view/model/drawing_model.dart';
import 'package:drawing_app/drawing/view/widget/custom_drawing_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawingView extends StatefulWidget {
  const DrawingView({Key? key}) : super(key: key);

  @override
  State<DrawingView> createState() => _DrawingViewState();
}

class _DrawingViewState extends State<DrawingView> {
  List<DrawingPaths?> drawingPaths = [];
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
                            DrawingPaths(offset: details.localPosition),
                          );
                        });
                      },
                      onPanUpdate: (details) {
                        setState(() {
                          drawingPaths.add(
                            DrawingPaths(offset: details.localPosition),
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
                              onPressed: () {},
                              icon: const Icon(
                                Icons.color_lens,
                                color: Colors.purple,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
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
