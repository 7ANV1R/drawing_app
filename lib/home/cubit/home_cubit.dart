import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:drawing_app/data/model/note_model.dart';
import 'package:drawing_app/data/service/database_helper.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    getNote();
  }

  Future getNote() async {
    final noteList = await Databasehelper.getNotes();
    log('in get notes');

    List item = noteList
        .map(
          (e) => Note(
            id: e['id'],
            title: e['title'],
            content: e['content'],
            imageContent: e['imageContent'],
            drawingContent: e['drawingContent'],
          ),
        )
        .toList();

    emit(HomeLoaded(item));
  }
}
