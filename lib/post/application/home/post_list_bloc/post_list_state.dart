part of 'post_list_bloc.dart';

@immutable
abstract class PostListState {}

class PostListInitial extends PostListState {}


class PostListLoadedState extends PostListState{
  final List<PostModel> posts;

  PostListLoadedState({this.posts});

}

class PostListErrorState extends PostListState{
  
}
class PostsLoadingState extends PostListState{}