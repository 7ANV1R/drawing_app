import 'package:drawing_app/blank/widgets/note_input_widgets.dart';
import 'package:drawing_app/data/service/ui_helper.dart';
import 'package:drawing_app/home/view/homepage.dart';
import 'package:flutter/material.dart';

class BlankPage extends StatelessWidget {
  const BlankPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.cottage_outlined),
                  ),
                  const Expanded(child: kHorizontalSpaceS),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.brush_outlined),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add_photo_alternate_outlined),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add_a_photo_outlined),
                  ),
                ],
              ),
            ),

            // canvas
            Expanded(
                child: Container(
              color: Colors.white,
              child: const NoteInputWidget(),
            ))
          ],
        ),
      ),
    );
  }
}
