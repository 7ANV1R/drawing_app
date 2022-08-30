import 'package:drawing_app/blank/cubit/blank_cubit.dart';
import 'package:drawing_app/blank/view/blank_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlankPage extends StatelessWidget {
  const BlankPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlankCubit(),
      child: const BlankView(),
    );
  }
}
