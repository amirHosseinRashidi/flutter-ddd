part of 'comment_bloc.dart';

@immutable
abstract class CommentEvent {}
class GetPostCommentsEvent extends CommentEvent{
  final int postId;

  GetPostCommentsEvent({@required this.postId});
}