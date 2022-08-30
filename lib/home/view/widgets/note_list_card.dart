import 'package:drawing_app/data/service/ui_helper.dart';
import 'package:flutter/material.dart';

class NoteListCard extends StatelessWidget {
  const NoteListCard({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.purple[50],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // title and content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: textTheme.headline6!.copyWith(fontWeight: FontWeight.bold),
                    ),
                    kVerticalSpaceS,
                    Text(
                      content,
                      style: textTheme.bodyText1,
                    )
                  ],
                ),
              ),
              // image/drawing
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 160,
                  width: 90,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
