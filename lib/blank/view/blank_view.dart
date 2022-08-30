import 'package:drawing_app/blank/cubit/blank_cubit.dart';
import 'package:drawing_app/data/service/ui_helper.dart';
import 'package:drawing_app/home/view/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlankView extends StatefulWidget {
  const BlankView({Key? key}) : super(key: key);

  @override
  State<BlankView> createState() => _BlankViewState();
}

class _BlankViewState extends State<BlankView> {
  late TextEditingController titleController;
  late TextEditingController contentController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    contentController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BlankCubit, BlankState>(
        builder: (context, state) {
          return SafeArea(
            child: Column(
              children: [
                //Top nav bar
                SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          // i hate this kind of routing :(

                          if (titleController.text.isNotEmpty && contentController.text.isNotEmpty) {
                            context
                                .read<BlankCubit>()
                                .onTapAddNote(title: titleController.text, content: contentController.text);

                            //navigation
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomePage(),
                                ),
                                (route) => false);
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                            );
                          }
                        },
                        icon: const Icon(Icons.cottage_outlined),
                      ),
                      const Expanded(child: kHorizontalSpaceS),
                      IconButton(
                        onPressed: () {
                          if (titleController.text.isNotEmpty && contentController.text.isNotEmpty) {
                            context
                                .read<BlankCubit>()
                                .onTapAddNote(title: titleController.text, content: contentController.text);

                            //navigation
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomePage(),
                                ),
                                (route) => false);
                          }
                        },
                        icon: const Icon(Icons.done),
                      ),
                      // IconButton(
                      //   onPressed: () {},
                      //   icon: const Icon(Icons.add_photo_alternate_outlined),
                      // ),
                      // IconButton(
                      //   onPressed: () {},
                      //   icon: const Icon(Icons.add_a_photo_outlined),
                      // ),
                    ],
                  ),
                ),

                // canvas
                Expanded(
                    child: Container(
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 16.0,
                        right: 16.0,
                        left: 16.0,
                      ),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: titleController,
                            maxLines: 1,
                            style: const TextStyle(
                              fontSize: 24,
                            ),
                            decoration: const InputDecoration(
                              hintText: 'Title',
                              border: InputBorder.none,
                            ),
                          ),
                          TextFormField(
                            controller: contentController,
                            maxLines: 100,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                            decoration: const InputDecoration(
                              hintText: 'Note',
                              border: InputBorder.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ))
              ],
            ),
          );
        },
      ),
    );
  }
}
