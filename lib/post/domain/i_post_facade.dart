import 'package:dartz/dartz.dart';
import 'package:flutter_ddd/post/domain/entities/comment_model.dart';
import 'package:flutter_ddd/post/domain/entities/post_model.dart';

abstract class IPostFacade{
  Future<Either<Unit,List<PostModel>>> getPosts(); 
  Future<Either<Unit,PostModel>> getPost(int postId); 
  Future<Either<Unit,List<CommentModel>>> getPostComments(int postId); 
}