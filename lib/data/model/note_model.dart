// ignore_for_file: public_member_api_docs, sort_constructors_first
class Note {
  int id;
  String? title;
  String content;
  String? imageContent;
  String? drawingContent;
  Note({
    required this.id,
    required this.title,
    required this.content,
    required this.imageContent,
    required this.drawingContent,
  });
}
