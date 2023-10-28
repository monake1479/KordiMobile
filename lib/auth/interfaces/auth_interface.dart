import 'package:dartz/dartz.dart';
import 'package:kordi_mobile/core/models/kordi_exception.dart';

abstract class AuthInterface {
  Future<Either<KordiException, Unit>> login(String username, String password);
}
