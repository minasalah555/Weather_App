import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with apiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with apiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with apiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad Certificate with apiServer');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponce(
          dioException.response!.statusCode!,
          dioException.response!.data,
        );

      case DioExceptionType.cancel:
        return ServerFailure('Requiest was apiServer was Canceled');

      case DioExceptionType.connectionError:
        return ServerFailure('No Internet Connection');
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('UnExpected Error , Please try Again!');
      default:
        return ServerFailure('Oops There Was an Error ,Please try again');
    }
  }
  factory ServerFailure.fromResponce(int statusCode, dynamic responce) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(responce['error']['message']);
    } else if (statusCode == 404) {
      // 404 -> Method not found
      return ServerFailure('Your request not found , please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal server error , please try later!');
    } else {
      return ServerFailure('Oops There Was an Error ,Please try again');
    }
  }
}
