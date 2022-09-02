import 'package:drawing_app/drawing/cubit/drawing_cubit.dart';
import 'package:drawing_app/drawing/view/drawing_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawingPage extends StatelessWidget {
  const DrawingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DrawingCubit(),
      child: const DrawingView(),
    );
  }
}
