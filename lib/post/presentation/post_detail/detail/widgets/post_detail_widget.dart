import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ddd/post/presentation/core/widgets/error_retry_widget.dart';
import 'package:flutter_ddd/post/presentation/post_detail/detail/bloc/post_detail_bloc.dart';

import '../../../../../injections.dart';

class PostDetailWidget extends StatelessWidget {
  final int postId;

  const PostDetailWidget({Key key, this.postId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final postDetailBloc = serviceLocator<PostDetailBloc>();
    return BlocProvider<PostDetailBloc>(
      create: (context) => postDetailBloc..add(GetPostEvent(postId: postId)),
      child: BlocBuilder<PostDetailBloc, PostDetailState>(
        builder: (BuildContext context, PostDetailState state) {
          if (state is PostLoadedState) {
            return Container(
              child: Column(
                children: <Widget>[
                  Text(
                    state.post.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    state.post.body,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            );
          } else if (state is PostLoadingState) {
            return Expanded(
              child: Center(
                child: Container(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    backgroundColor: Colors.blue,
                  ),
                ),
              ),
            );
          }else if(state is PostLoadingErrorState){
            return ErrorRetryWidget(
              error: 'Error while fetching post detail',
              onRetry: () {
                postDetailBloc..add(GetPostEvent(postId: postId));
              },
            );
          }else{
            return Container();
          }
        },
      ),
    );
  }
}
