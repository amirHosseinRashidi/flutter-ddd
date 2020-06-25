part of 'comment_bloc.dart';

@immutable
abstract class CommentState {}

class CommentInitial extends CommentState {}

class CommentListLoadingState extends CommentState {}

class CommentListLoadedState extends CommentState {
  final List<CommentModel> commentList;

  CommentListLoadedState({@required this.commentList});

}

class CommentLoadingErrorState extends CommentState{
  
}