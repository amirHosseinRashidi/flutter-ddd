import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ddd/post/application/post_detail/comment_bloc/comment_bloc.dart';
import 'package:flutter_ddd/post/presentation/core/widgets/error_retry_widget.dart';

import '../../../../../injections.dart';

class CommentListWidget extends StatelessWidget {
  final int postId;

  const CommentListWidget({Key key, this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final commentListBloc = serviceLocator<CommentBloc>();
    return BlocProvider<CommentBloc>(
      create: (context) =>
          commentListBloc..add(GetPostCommentsEvent(postId: postId)),
      child: BlocBuilder<CommentBloc, CommentState>(
        builder: (BuildContext context, CommentState state) {
          if (state is CommentListLoadedState) {
            return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: state.commentList.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        state.commentList[index].name,
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        state.commentList[index].email,
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.black38),
                      ),
                      Text(
                        state.commentList[index].body,
                        maxLines: 1,
                        style: TextStyle(fontSize: 15, color: Colors.black54),
                      )
                    ],
                  ),
                );
              },
            );
          } else if (state is CommentListLoadingState) {
            return Center(
              child: Container(),
            );
          } else if (state is CommentLoadingErrorState) {
            return ErrorRetryWidget(
              error: 'Error while fetching comments',
              onRetry: () {
                commentListBloc..add(GetPostCommentsEvent(postId: postId));
              },
            );
          }else{return Container();}
        },
      ),
    );
  }
}
