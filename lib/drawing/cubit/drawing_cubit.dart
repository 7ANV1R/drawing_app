import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'drawing_state.dart';

class DrawingCubit extends Cubit<DrawingState> {
  DrawingCubit() : super(DrawingInitial());
}
