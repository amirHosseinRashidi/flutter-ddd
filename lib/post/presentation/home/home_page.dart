import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ddd/injections.dart';
import 'package:flutter_ddd/post/presentation/home/post_list/widgets/post_list_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Flutter DDD Sample'),
      ),
      body: PostListWidget(),
    );
  }
}
