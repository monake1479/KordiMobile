import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kordi_mobile/core/models/kordi_exception.dart';
import 'package:kordi_mobile/sign_up/interfaces/sign_up_interface.dart';
import 'package:kordi_mobile/sign_up/models/sign_up_dto.dart';

@singleton
class SignUpService implements SignUpInterface {
  @override
  Future<Either<KordiException, Unit>> signUp(SignUpDto dto) async {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
