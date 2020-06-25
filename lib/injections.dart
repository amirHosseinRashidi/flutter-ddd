import 'package:flutter_ddd/post/infrastructure/data_sources/api_data_source.dart';
import 'package:flutter_ddd/post/infrastructure/post_repository.dart';
import 'package:flutter_ddd/post/presentation/home/post_list/bloc/post_list_bloc.dart';
import 'package:flutter_ddd/post/presentation/post_detail/comment/bloc/comment_bloc.dart';
import 'package:flutter_ddd/post/presentation/post_detail/detail/bloc/post_detail_bloc.dart';
import 'package:get_it/get_it.dart';


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
