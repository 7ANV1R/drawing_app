import 'dart:io';

import 'package:drawing_app/data/service/ui_helper.dart';
import 'package:flutter/material.dart';

class NoteListCard extends StatelessWidget {
  const NoteListCard({
    Key? key,
    required this.title,
    required this.content,
    required this.imageContent,
    required this.drawingContent,
  }) : super(key: key);

  final String? title;
  final String content;
  final String? imageContent;
  final String? drawingContent;

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // title and content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title ?? "untitled",
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
              imageContent == null
                  ? Container()
                  : Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: FileImage(
                            File(imageContent!),
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
