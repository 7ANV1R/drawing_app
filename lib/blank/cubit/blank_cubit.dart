import 'package:bloc/bloc.dart';
import 'package:drawing_app/data/service/database_helper.dart';
import 'package:equatable/equatable.dart';

part 'blank_state.dart';

class BlankCubit extends Cubit<BlankState> {
  BlankCubit() : super(BlankInitial());

  Future<void> onTapAddNote({
    required String title,
    required String content,
    String? imageContent,
    String? drawingContent,
  }) async {
    await Databasehelper.insertNote(
      {
        "title": title,
        "content": content,
        "imageContent": imageContent,
        "drawingContent": drawingContent,
      },
    );
  }
}
