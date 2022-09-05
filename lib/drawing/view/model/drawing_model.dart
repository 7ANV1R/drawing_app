// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class DrawingPaths extends Equatable {
  final Offset offset;
  final Paint paint;
  const DrawingPaths({
    required this.offset,
    required this.paint,
  });

  @override
  List<Object?> get props => [offset];
}
