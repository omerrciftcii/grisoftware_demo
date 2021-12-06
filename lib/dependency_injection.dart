import 'package:get_it/get_it.dart';
import 'package:grisoft/features/demo/data/datasources/link_datasource.dart';
import 'package:grisoft/features/demo/data/repositories/shortened_link_repository_implementation.dart';
import 'package:grisoft/features/demo/domain/repositories/shortened_link_repository.dart';
import 'package:grisoft/features/demo/domain/usecases/get_shortened_link.dart';
import 'package:http/http.dart' as http;

import 'core/network_info.dart';

final sl = GetIt.instance;

Future<void> initialize() async {
  sl.registerLazySingleton(() => http.Client());

//Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());

  //Demo

  //Usecases
  sl.registerLazySingleton(
    () => GetShortenedLink(
      repository: sl(),
    ),
  );

  //Repositories
  sl.registerLazySingleton<ShortenedLinkRepository>(
    () => ShortenedLinkRepositoryImpl(
      datasource: sl(),
      network: sl(),
    ),
  );

  //Datasources
  sl.registerLazySingleton<LinkShorterDatasource>(
    () => LinkShorterDatasourceImpl(
      client: sl(),
    ),
  );
}
