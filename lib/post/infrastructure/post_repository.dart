import 'package:flutter_ddd/post/domain/entities/comment_model.dart';
import 'package:flutter_ddd/post/domain/entities/post_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_ddd/post/domain/i_post_facade.dart';
import 'package:flutter_ddd/post/infrastructure/data_sources/api_data_source.dart';

class PostRepository implements IPostFacade {
  final ApiDataSource apiDataSource;

  PostRepository({this.apiDataSource});

  @override
  Future<Either<Unit, PostModel>> getPost(int postId) {
   return  apiDataSource.getPost(postId);
  }

  @override
  Future<Either<Unit, List<PostModel>>> getPosts() {
  return apiDataSource.getPosts();
  }

  @override
  Future<Either<Unit, List<CommentModel>>> getPostComments(int postId) {
  return apiDataSource.getPostComments(postId);
  }
}
