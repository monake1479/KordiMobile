import 'package:dartz/dartz.dart';
import 'package:kordi_mobile/core/models/kordi_exception.dart';
import 'package:kordi_mobile/user/models/user.dart';

abstract class GetUserInterface {
  Future<Either<KordiException, User>> getUser();
}
