const genericMessage =
    'Ocorreu um erro inesperado, tente novamente mais tarde.';

class AppErrorException {
  final int code;
  final String message;

  AppErrorException({this.code = 500, this.message = genericMessage});
}
