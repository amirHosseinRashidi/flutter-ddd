// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) {
  return CommentModel(
    name: json['name'] as String,
    email: json['email'] as String,
    body: json['body'] as String,
    id: json['id'] as int,
  );
}

Map<String, dynamic> _$CommentModelToJson(CommentModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'body': instance.body,
      'id': instance.id,
    };
