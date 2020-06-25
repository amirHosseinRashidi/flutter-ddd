import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ddd/injections.dart';
import 'package:flutter_ddd/post/presentation/home/post_list/widgets/post_list_widget.dart';
import 'package:flutter_ddd/post/presentation/post_detail/comment/widgets/comment_list_widget.dart';
import 'package:flutter_ddd/post/presentation/post_detail/detail/widgets/post_detail_widget.dart';

class PostDetailPage extends StatelessWidget {
  final int postId;

  const PostDetailPage({Key key, this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Post $postId'),
      ),
      body: ListView(
        padding: EdgeInsets.all( 12),
        children: <Widget>[
        SizedBox(height: 8,),
        PostDetailWidget(postId: postId,),
        SizedBox(height: 12,),
        Container(width: double.infinity,height: 1,color: Colors.black.withOpacity(0.1),),
        SizedBox(height: 16,),
        Container(child: Text('Comments ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),),
        CommentListWidget(postId: postId,)
      ],)
    );
  }
}
