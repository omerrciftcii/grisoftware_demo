import 'package:dartz/dartz.dart';
import 'package:grisoft/core/failures/failure.dart';
import 'package:grisoft/features/demo/domain/entities/shortened_link.dart';

abstract class ShortenedLinkRepository {
  Future<Either<Failure, ShortenedLink>> getShortenedLink(String link);
}
