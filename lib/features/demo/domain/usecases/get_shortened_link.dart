import 'package:grisoft/core/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:grisoft/core/usecase.dart';
import 'package:grisoft/features/demo/domain/entities/shortened_link.dart';
import 'package:grisoft/features/demo/domain/repositories/shortened_link_repository.dart';

class GetShortenedLink
    implements UseCase<ShortenedLink, LinkShorterParameters> {
  final ShortenedLinkRepository repository;
  GetShortenedLink({required this.repository});
  @override
  Future<Either<Failure, ShortenedLink>> call(params) async {
    return await repository.getShortenedLink(params.link);
  }
}

class LinkShorterParameters {
  final String link;
  LinkShorterParameters(this.link);
}
