import 'dart:convert';

import 'package:flutter_ddd/post/domain/entities/comment_model.dart';
import 'package:flutter_ddd/post/domain/entities/post_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_ddd/post/domain/i_post_facade.dart';
import 'package:http/http.dart' as http;

class ApiDataSource implements IPostFacade {
  @override
  Future<Either<Unit, PostModel>> getPost(int postId) async {
    try {
      var response = await http.Client()
          .get('https://jsonplaceholder.typicode.com/posts/$postId');

      return right(PostModel.fromJson(json.decode(response.body)));
    } catch (e) {
      return left(null);
    }
  }

  @override
  Future<Either<Unit, List<PostModel>>> getPosts() async {
    try {
      var response =
          await http.Client().get('https://jsonplaceholder.typicode.com/posts');

      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      return right(
          parsed.map<PostModel>((json) => PostModel.fromJson(json)).toList());
    } catch (e) {
      return left(null);
    }
  }

  @override
  Future<Either<Unit, List<CommentModel>>> getPostComments(int postId) async {
    try {
      var response = await http.Client()
          .get('https://jsonplaceholder.typicode.com/posts/$postId/comments');

      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      return right(parsed
          .map<CommentModel>((json) => CommentModel.fromJson(json))
          .toList());
    } catch (e) {
      return left(null);
    }
  }
}
