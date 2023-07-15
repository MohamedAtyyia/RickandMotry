import 'package:dio/dio.dart';

abstract class Failuer {
  final String erroMessage;

  const  Failuer(this.erroMessage);
}

class ServerFailuer extends Failuer {
   ServerFailuer(super.erroMessage);

  factory ServerFailuer.fromdioerror(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return ServerFailuer('Conection timeoute APi server');
      case DioErrorType.sendTimeout:
        return ServerFailuer('Send timeoute APi server');
      case DioErrorType.receiveTimeout:
        return ServerFailuer('Recived timeoute APi server');
      case DioErrorType.badCertificate:
        return ServerFailuer('There is proplem in th Website');
      case DioErrorType.cancel:
        return ServerFailuer('Request to api was cancled');
      case DioErrorType.connectionError:
        return ServerFailuer('Please Connect Internet ');
      case DioErrorType.badResponse:
        return ServerFailuer.fromresponse(
            dioError.response!.statusCode!, dioError.response!.data);
      
      default :
       return ServerFailuer('Opps There was an error ,Fixed');
    }
  }
  factory ServerFailuer.fromresponse(int statuscode, dynamic response) {
    if (statuscode == 400 || statuscode == 401 || statuscode == 403) {
      return ServerFailuer(response['error']['message']);
    } else if (statuscode == 500) {
      return ServerFailuer('Internal Server, try later');
    } else if (statuscode == 404) {
      return ServerFailuer('Your request not found , please try again ');
    } else {
      return ServerFailuer('Opps There was an error ,Fixed');
    }
  }
}
