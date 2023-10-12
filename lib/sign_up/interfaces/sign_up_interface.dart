import 'package:dartz/dartz.dart';
import 'package:kordi_mobile/core/models/kordi_exception.dart';
import 'package:kordi_mobile/sign_up/models/sign_up_dto.dart';

abstract class SignUpInterface {
  Future<Either<KordiException, Unit>> signUp(SignUpDto dto);
}
