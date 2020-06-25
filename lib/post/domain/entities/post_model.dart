import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';



part 'post_model.g.dart';
@JsonSerializable(nullable: false)
class PostModel extends Equatable {
  int userId;
  int id;
  String title;
  String body;

  PostModel({this.userId, this.id, this.title, this.body});

  factory PostModel.fromJson(Map<String,dynamic> json)=>_$PostModelFromJson(json);


  @override
  List<Object> get props => [this.id];
}