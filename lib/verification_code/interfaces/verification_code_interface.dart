import 'package:dartz/dartz.dart';
import 'package:kordi_mobile/core/models/kordi_exception.dart';

abstract class VerificationCodeInterface {
  Future<Either<KordiException, Unit>> verify(String username, String code);
  Future<Either<KordiException, Unit>> resend(String username);
}
