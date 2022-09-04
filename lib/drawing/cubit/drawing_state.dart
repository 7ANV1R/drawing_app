// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'drawing_cubit.dart';

abstract class DrawingState extends Equatable {
  const DrawingState();

  @override
  List<Object> get props => [];
}

class DrawingInitial extends DrawingState {
  final List<Offset> points;
  const DrawingInitial({
    required this.points,
  });

  @override
  List<Object> get props => [points];
}

class DrawingStarted extends DrawingState {
  final List<Offset> points;
  const DrawingStarted({
    required this.points,
  });

  @override
  List<Object> get props => [points];
}
