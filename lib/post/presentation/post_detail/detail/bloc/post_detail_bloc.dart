import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_ddd/post/domain/entities/post_model.dart';
import 'package:flutter_ddd/post/infrastructure/post_repository.dart';
import 'package:flutter_ddd/post/presentation/home/post_list/bloc/post_list_bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../injections.dart';

part 'post_detail_event.dart';
part 'post_detail_state.dart';

class PostDetailBloc extends Bloc<PostDetailEvent, PostDetailState> {
  final PostRepository repository;

  PostDetailBloc({@required this.repository});

  @override
  PostDetailState get initialState => PostDetailInitial();

  @override
  Stream<PostDetailState> mapEventToState(
    PostDetailEvent event,
  ) async* {
    if (event is GetPostEvent) {
      yield PostLoadingState();
      var result = await repository.getPost(event.postId);
      if (result.isRight()) {
        yield PostLoadedState(post: result.getOrElse(() => null));
      } else {
        yield PostLoadingErrorState();
      }
    }
  }
}
