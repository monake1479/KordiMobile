import 'package:dartz/dartz.dart';
import 'package:kordi_mobile/core/models/kordi_exception.dart';
import 'package:kordi_mobile/donation/models/donation_dto.dart';

abstract class DonationInterface {
  Future<Either<KordiException, Unit>> donate(
    DonationDto dto,
    int collectionId,
  );
}
