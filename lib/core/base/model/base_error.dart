import 'package:vexana/vexana.dart';

class BaseError extends IErrorModel{
  final String? message;
  BaseError({
    required this.message,
  });
}
