import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_model.g.dart';


@JsonSerializable(nullable: false)
class CommentModel extends Equatable {

  final String name;
  final String email;
  final String body;
  final int id;

  CommentModel({this.name, this.email, this.body, this.id});

factory CommentModel.fromJson(Map<String,dynamic> json) => _$CommentModelFromJson(json);


  @override
  List<Object> get props => [this.id];
}
