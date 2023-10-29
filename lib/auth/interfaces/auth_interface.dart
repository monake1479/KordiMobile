import 'package:dartz/dartz.dart';
import 'package:kordi_mobile/core/models/kordi_exception.dart';

abstract class AuthInterface {
  Future<Either<KordiException, Unit>> validateToken(
    String username,
    String token,
  );
}
