part of 'post_detail_bloc.dart';

@immutable
abstract class PostDetailState {}

class PostDetailInitial extends PostDetailState {}

class PostInitial extends PostDetailState {}

class PostLoadedState extends PostDetailState {
  final PostModel post;

  PostLoadedState({@required this.post});
}

class PostLoadingState extends PostDetailState {}
class PostLoadingErrorState extends PostDetailState{}
