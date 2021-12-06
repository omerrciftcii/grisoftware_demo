import 'package:grisoft/features/demo/domain/entities/shortened_link.dart';

class ShortenedLinkModel extends ShortenedLink {
  ShortenedLinkModel({
    required ok,
    result,
  }) : super(ok: ok, result: result);
  factory ShortenedLinkModel.fromJson(Map<String, dynamic> json) =>
      ShortenedLinkModel(
        ok: json["ok"],
        result: ResultModel.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "result": (result as ResultModel).toJson(),
      };
}

class ResultModel extends Result {
  ResultModel({
    required code,
    required shortLink,
    required fullShortLink,
    required shortLink2,
    required fullShortLink2,
    required shortLink3,
    required fullShortLink3,
    required shareLink,
    required fullShareLink,
    required originalLink,
  }) : super(
          code: code,
          shortLink: shortLink,
          fullShortLink: fullShortLink,
          shortLink2: shortLink2,
          fullShortLink2: fullShortLink2,
          shortLink3: shortLink3,
          fullShortLink3: fullShortLink3,
          shareLink: shareLink,
          fullShareLink: fullShareLink,
          originalLink: originalLink,
        );
  factory ResultModel.fromJson(Map<String, dynamic> json) => ResultModel(
        code: json["code"],
        shortLink: json["short_link"],
        fullShortLink: json["full_short_link"],
        shortLink2: json["short_link2"],
        fullShortLink2: json["full_short_link2"],
        shortLink3: json["short_link3"],
        fullShortLink3: json["full_short_link3"],
        shareLink: json["share_link"],
        fullShareLink: json["full_share_link"],
        originalLink: json["original_link"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "short_link": shortLink,
        "full_short_link": fullShortLink,
        "short_link2": shortLink2,
        "full_short_link2": fullShortLink2,
        "short_link3": shortLink3,
        "full_short_link3": fullShortLink3,
        "share_link": shareLink,
        "full_share_link": fullShareLink,
        "original_link": originalLink,
      };
}
