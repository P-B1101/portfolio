import 'package:equatable/equatable.dart';

import 'exceptions.dart';

abstract class Failure extends Equatable {
  const Failure();
  @override
  List<Object?> get props => [];
}

/// Return [ServerFailure] from Repository to the UseCase
///
/// if [ServerException] thrown in the DataSource.
///
class ServerFailure extends Failure {
  final String? message;
  const ServerFailure({
    this.message,
  });

  @override
  List<Object?> get props => [message];
}

/// Return [NoInternetConnectionFailure] from Repository to the UseCase
///
/// if [NetworkInfo.isConnected] return false.
///

class NoInternetConnectionFailure extends Failure {}
