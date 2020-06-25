import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_ddd/post/domain/entities/comment_model.dart';
import 'package:flutter_ddd/post/infrastructure/post_repository.dart';
import 'package:meta/meta.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final PostRepository repository;

  CommentBloc({@required this.repository});

  @override
  CommentState get initialState => CommentInitial();

  @override
  Stream<CommentState> mapEventToState(
    CommentEvent event,
  ) async* {
    if (event is GetPostCommentsEvent) {
      yield CommentListLoadingState();
      var result = await repository.getPostComments(event.postId);
      if(result.isRight()){
          yield CommentListLoadedState(commentList: result.getOrElse(() => null));
    
      }else{
          yield CommentLoadingErrorState();
      }
    }
  }
}
