import 'package:dartz/dartz.dart';
import 'package:kordi_mobile/change_password/models/change_password_dto.dart';
import 'package:kordi_mobile/core/models/kordi_exception.dart';

abstract class ChangePasswordInterface {
  Future<Either<KordiException, Unit>> changePassword(ChangePasswordDto dto);
}
