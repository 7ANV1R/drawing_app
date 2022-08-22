import 'package:flutter/material.dart';

class NoteInputWidget extends StatefulWidget {
  const NoteInputWidget({Key? key}) : super(key: key);

  @override
  State<NoteInputWidget> createState() => _NoteInputWidgetState();
}

class _NoteInputWidgetState extends State<NoteInputWidget> {
  late TextEditingController noteTextEditingController;

  @override
  void initState() {
    super.initState();
    noteTextEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 16.0,
          right: 16.0,
          left: 16.0,
        ),
        child: Column(
          children: [
            TextFormField(
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
              controller: noteTextEditingController,
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
    );
  }
}
