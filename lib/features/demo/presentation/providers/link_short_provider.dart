import 'package:flutter/cupertino.dart';
import 'package:grisoft/core/failures/failure.dart';
import 'package:grisoft/features/demo/data/models/shortened_link_model.dart';
import 'package:grisoft/features/demo/domain/entities/shortened_link.dart';
import 'package:grisoft/features/demo/domain/usecases/get_shortened_link.dart';

import '../../../../dependency_injection.dart';

class LinkShorterProvider extends ChangeNotifier {
  bool _isWaiting = false;
  String? _errorHintText;
  String _errorMessage = "";
  bool _autoValidate = false;
  bool get autoValidate => _autoValidate;
  set autoValidate(value) {
    _autoValidate = value;
    notifyListeners();
  }

  String get errorMessage => _errorMessage;
  set errorMessage(value) {
    _errorMessage = value;
    notifyListeners();
  }

  String? get errorHintText => _errorHintText;
  set errorHintText(value) {
    _errorHintText = value;
    notifyListeners();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;

  ServerFailure? _failure;
  String _copiedLink = "";
  String get copiedLink => _copiedLink;
  set copiedLink(value) {
    _copiedLink = value;
    notifyListeners();
  }

  ShortenedLink? _shortenedLinkResponse;
  ShortenedLink? get shortenedLinkResponse => _shortenedLinkResponse;
  set shortenedLinkResponse(value) {
    _shortenedLinkResponse = value;
    notifyListeners();
  }

  ServerFailure? get failure => _failure;
  set failure(value) {
    _failure = value;
    notifyListeners();
  }

  bool get isWaiting => _isWaiting;
  set isWaiting(value) {
    _isWaiting = value;
    notifyListeners();
  }

  final TextEditingController _linkController = TextEditingController();
  TextEditingController get linkController => _linkController;

  getShortenedLink() async {
    GetShortenedLink getShortenedLink = sl<GetShortenedLink>();
    try {
      isWaiting = true;
      var failOrSuccess =
          await getShortenedLink(LinkShorterParameters(_linkController.text));

      failOrSuccess.fold((l) {
        failure = l;
      }, (r) {
        shortenedLinkResponse = r;
        linkHistory = r;
        failure = null;
      });
      isWaiting = false;
      errorMessage = "";
    } on ServerFailure catch (_, e) {
      errorMessage = _.errorMessage;
      isWaiting = false;
    }
  }

  deleteLink(String code) {
    linkHistory.removeWhere((element) => element.result!.code == code);
    notifyListeners();
  }

  final List<ShortenedLinkModel> _linkHistory = [];
  List<ShortenedLinkModel> get linkHistory => _linkHistory;
  set linkHistory(value) {
    _linkHistory.add(value);
    notifyListeners();
  }

  String? formValidation(String? input) {
    if (input == "") {
      errorHintText = 'Please add a link here';
      return '';
    } else {
      errorHintText = "";
      return null;
    }
  }
}
