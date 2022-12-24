class AppException{
  final _message;
  final _prefix;
  AppException(this._message,this._prefix);

  String toString(){
    return '$_prefix$_message';
  }
}

class FetchDataException extends AppException{
  FetchDataException([String? message]):super(message , 'Error during communication');
}

class BadRequestException extends AppException{
  BadRequestException([String? message]):super(message,'Invalid request');
}

class UnauthoriseException extends AppException{
  UnauthoriseException(String? message):super(message,"Unaothorised request");
}

class InvalidInputRequest extends AppException{
  InvalidInputRequest(String? message):super(message,"Invalid input");
}