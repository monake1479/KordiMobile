import 'package:dartz/dartz.dart';

extension EitherEx<L, R> on Either<L, R> {
  L getLeftOrThrow() {
    return this.fold(
      (l) => l,
      (r) => throw Exception(
        'Got Right<> instead of Left<> at unrecoverable state',
      ),
    );
  }

  R getRightOrThrow() {
    return this.fold(
      (l) => throw Exception(
        'Got Left<> instead of Right<> at unrecoverable state',
      ),
      (r) => r,
    );
  }
}
