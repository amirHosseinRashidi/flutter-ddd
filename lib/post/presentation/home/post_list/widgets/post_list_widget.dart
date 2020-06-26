import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ddd/post/application/home/post_list_bloc/post_list_bloc.dart';
import 'package:flutter_ddd/post/presentation/core/widgets/error_retry_widget.dart';
import 'package:flutter_ddd/post/presentation/post_detail/post_detail_page.dart';

import '../../../../../injections.dart';

class PostListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PostListBloc postListBloc = serviceLocator<PostListBloc>();

    return BlocProvider<PostListBloc>(
      create: (context) => postListBloc..add(GetPostsEvent()),
      child: BlocBuilder<PostListBloc, PostListState>(
        builder: (BuildContext context, PostListState state) {
          if (state is PostListLoadedState) {
            return ListView.builder(
              itemCount: state.posts.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return PostDetailPage(postId: state.posts[index].id);
                    }));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                    child: Text(
                      state.posts[index].title,
                      maxLines: 1,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              },
            );
          } else if (state is PostsLoadingState) {
            return Center(
              child: Container(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  backgroundColor: Colors.blue,
                ),
              ),
            );
          } else if (state is PostListErrorState) {
            return ErrorRetryWidget(error:'Error while fetching posts' ,onRetry: (){
              postListBloc..add(GetPostsEvent());
            },);
          }
        },
      ),
    );
  }
}
