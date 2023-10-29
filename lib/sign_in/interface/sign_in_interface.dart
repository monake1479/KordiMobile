import 'package:dartz/dartz.dart';
import 'package:kordi_mobile/core/models/kordi_exception.dart';
import 'package:kordi_mobile/sign_in/models/sign_in_dto.dart';

abstract class SignInInterface {
  Future<Either<KordiException, String>> signIn(SignInDto dto);
}
