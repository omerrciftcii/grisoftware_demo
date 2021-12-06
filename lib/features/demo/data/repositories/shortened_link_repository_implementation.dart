import 'package:grisoft/core/network_info.dart';
import 'package:grisoft/features/demo/data/datasources/link_datasource.dart';
import 'package:grisoft/features/demo/domain/entities/shortened_link.dart';
import 'package:grisoft/core/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:grisoft/features/demo/domain/repositories/shortened_link_repository.dart';

class ShortenedLinkRepositoryImpl implements ShortenedLinkRepository {
  final LinkShorterDatasource datasource;
  final NetworkInfo network;
  ShortenedLinkRepositoryImpl(
      {required this.datasource, required this.network});

  @override
  Future<Either<Failure, ShortenedLink>> getShortenedLink(String link) async {
    if (await network.isConnected) {
      try {
        final datasourceResponse = await datasource.getShortenedLink(link);
        return Right(datasourceResponse);
      } catch (e) {
        return Left(ServerFailure(errorMessage: 'Entered url is not valid'));
      }
    } else {
      return Left(
          ServerFailure(errorMessage: 'Please check your internet connection'));
    }
  }
}
