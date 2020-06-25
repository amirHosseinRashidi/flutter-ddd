import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_ddd/post/domain/entities/post_model.dart';
import 'package:flutter_ddd/post/infrastructure/post_repository.dart';
import 'package:meta/meta.dart';

part 'post_list_event.dart';
part 'post_list_state.dart';

class PostListBloc extends Bloc<PostListEvent, PostListState> {
  final PostRepository repository;

  PostListBloc({this.repository});

  @override
  PostListState get initialState => PostListInitial();

  @override
  Stream<PostListState> mapEventToState(
    PostListEvent event,
  ) async* {
    if (event is GetPostsEvent) {
      yield PostsLoadingState();
      var result = await repository.getPosts();
      if (result.isLeft()) {
        yield PostListErrorState();
      } else {
        yield PostListLoadedState(posts: result.getOrElse(() => null));
      }
    }
  }
}
