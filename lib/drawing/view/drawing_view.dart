import 'package:drawing_app/data/service/ui_helper.dart';
import 'package:drawing_app/drawing/cubit/drawing_cubit.dart';
import 'package:drawing_app/drawing/view/widget/custom_drawing_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawingView extends StatefulWidget {
  const DrawingView({Key? key}) : super(key: key);

  @override
  State<DrawingView> createState() => _DrawingViewState();
}

class _DrawingViewState extends State<DrawingView> {
  List<Offset> points = [];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<DrawingCubit, DrawingState>(
      builder: (context, state) {
        return state is DrawingInitial
            ? Scaffold(
                body: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.purple.shade100,
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: size.width * 0.8,
                            height: size.height * 0.8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.4),
                                  blurRadius: 5.0,
                                  spreadRadius: 1.0,
                                ),
                              ],
                            ),
                            child: GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onPanDown: (details) {
                                setState(() {
                                  points.add(details.localPosition);
                                  points.add(details.localPosition);
                                });
                                // context.read<DrawingCubit>().addPoint(details.localPosition);
                                // context.read<DrawingCubit>().addPoint(details.localPosition);
                              },
                              onPanUpdate: (details) {
                                setState(() {
                                  points.add(details.localPosition);
                                  points.add(details.localPosition);
                                });
                                // context.read<DrawingCubit>().addPoint(details.localPosition);
                              },
                              onPanEnd: (details) {
                                setState(() {
                                  points.clear();
                                });
                                // context.read<DrawingCubit>().resetPoint();
                              },
                              child: RepaintBoundary(
                                child: CustomPaint(
                                  isComplex: true,
                                  willChange: true,
                                  painter: CustomDrawing(points: points),
                                ),
                              ),
                            ),
                          ),
                          kVerticalSpaceM,
                          Container(
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
                                  icon: const Icon(Icons.color_lens),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.layers_clear),
                                ),
                              ],
                            ),
                          ),
                        ],
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
