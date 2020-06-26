import 'package:flutter_ddd/post/infrastructure/data_sources/api_data_source.dart';
import 'package:flutter_ddd/post/infrastructure/post_repository.dart';
import 'package:get_it/get_it.dart';

import 'post/application/home/post_list_bloc/post_list_bloc.dart';
import 'post/application/post_detail/comment_bloc/comment_bloc.dart';
import 'post/application/post_detail/post_detail_bloc/post_detail_bloc.dart';


final serviceLocator = GetIt.instance;

Future<void> init() async {
  catalogDependencies();
}

Future<void> catalogDependencies() async {
  serviceLocator.registerFactory(() => CommentBloc(repository: serviceLocator()));

  serviceLocator.registerFactory(() => PostDetailBloc(repository: serviceLocator()));

  serviceLocator.registerFactory(
    () => PostListBloc(
      repository: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => PostRepository(
      apiDataSource: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => ApiDataSource(),
  );
}
