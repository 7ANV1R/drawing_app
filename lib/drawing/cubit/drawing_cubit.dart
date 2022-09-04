import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/animation.dart';

part 'drawing_state.dart';

class DrawingCubit extends Cubit<DrawingState> {
  DrawingCubit() : super(const DrawingInitial(points: []));

  List<Offset> points = [];

  void addPoint(Offset point) {
    points.add(point);
    emit(DrawingInitial(points: points));
  }

  void resetPoint() {
    points = [];
    emit(DrawingInitial(points: points));
  }
}
