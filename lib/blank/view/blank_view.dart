import 'dart:io';

import 'package:drawing_app/blank/cubit/blank_cubit.dart';
import 'package:drawing_app/data/service/ui_helper.dart';
import 'package:drawing_app/home/view/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class BlankView extends StatefulWidget {
  const BlankView({Key? key}) : super(key: key);

  @override
  State<BlankView> createState() => _BlankViewState();
}

class _BlankViewState extends State<BlankView> {
  late TextEditingController titleController;
  late TextEditingController contentController;

  File? _image;
  final picker = ImagePicker();

  Future getImage(ImageSource imageSource) async {
    XFile? imageFile = await picker.pickImage(source: imageSource);
    if (imageFile == null) {
      return;
    }
    File tempFile = File(imageFile.path);
    final appDir = await getApplicationDocumentsDirectory();
    final fileName = basename(imageFile.path);
    tempFile = await tempFile.copy('${appDir.path}/$fileName');
    setState(() {
      _image = tempFile;
    });
  }

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
                          getImage(ImageSource.gallery);
                        },
                        icon: const Icon(Icons.add_photo_alternate_outlined),
                      ),
                      IconButton(
                        onPressed: () {
                          getImage(ImageSource.camera);
                        },
                        icon: const Icon(Icons.add_a_photo_outlined),
                      ),
                      kHorizontalSpaceL,
                      IconButton(
                        onPressed: () {
                          if (titleController.text.isNotEmpty && contentController.text.isNotEmpty) {
                            context.read<BlankCubit>().onTapAddNote(
                                title: titleController.text,
                                content: contentController.text,
                                imageContent: _image?.path);

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
                            // maxLines: 5,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                            decoration: const InputDecoration(
                              hintText: 'Note',
                              border: InputBorder.none,
                            ),
                          ),
                          _image != null
                              ? Container(
                                  padding: const EdgeInsets.all(16),
                                  height: 250,
                                  width: MediaQuery.of(context).size.width,
                                  child: Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(16),
                                          image: DecorationImage(
                                            image: FileImage(_image!),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : Container(),
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
