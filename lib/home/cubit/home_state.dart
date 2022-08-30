part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoaded extends HomeState {
  final List noteList;
  const HomeLoaded(this.noteList);

  @override
  List<Object> get props => [noteList];
}
