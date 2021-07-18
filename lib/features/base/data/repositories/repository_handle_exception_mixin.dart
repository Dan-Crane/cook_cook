import 'package:cook_cook/core/errors/failures.dart';
import 'package:cook_cook/core/services/logger.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';

mixin RepositoryHandleExceptionMixin {
  final _logger = LoggerService().createLogger('BaseRepositoryMixin');

  Future<Either<Failure, T>> handleException<T>(Future<T> future) async {
    try {
      return Right(await future);
    } on FirebaseException catch (e) {
      _logger.e('handleException', e);
      return Left(FirebaseFailure(e.toString()));
    } catch (e, stack) {
      _logger.e('handleException', e, stack);

      return Left(UnknownFailure(e.toString()));
    }
  }
}
