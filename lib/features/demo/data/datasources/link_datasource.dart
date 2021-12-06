import 'dart:convert';

import 'package:grisoft/common/api_constants.dart';
import 'package:grisoft/core/failures/failure.dart';
import 'package:grisoft/features/demo/data/models/shortened_link_model.dart';
import 'package:grisoft/features/demo/domain/entities/shortened_link.dart';
import 'package:http/http.dart' as http;

abstract class LinkShorterDatasource {
  Future<ShortenedLink> getShortenedLink(String link);
}

class LinkShorterDatasourceImpl implements LinkShorterDatasource {
  final http.Client client;
  LinkShorterDatasourceImpl({required this.client});
  @override
  Future<ShortenedLink> getShortenedLink(String link) async {
    try {
      final response = await client.get(
        Uri.parse(ApiConstants.baseUrl + ApiConstants.shorten + '?url=$link'),
        // headers: {
        //   'Content-Type': 'application/json',
        // },
      );
      if (response.statusCode == 201) {
        return ShortenedLinkModel.fromJson(json.decode(response.body));
      } else {
        throw ServerFailure(errorMessage: 'Entered url is not valid');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
