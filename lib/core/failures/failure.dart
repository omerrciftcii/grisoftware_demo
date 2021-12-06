abstract class Failure {
  List<Object> get props => [];
}

// General failures
class ServerFailure extends Failure {
    final String errorMessage;
  ServerFailure({required this.errorMessage});
}
