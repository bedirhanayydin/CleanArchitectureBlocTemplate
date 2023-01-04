import 'package:dartz/dartz.dart';

import '../../1_domain/entities/advice_entity.dart';
import '../../1_domain/failures/failures.dart';
import '../../1_domain/repositories/advice_repo.dart';
import '../datasources/advice_remote_datasource.dart';
import '../exceptions/exceptions.dart';

class AdviceRepoImpl implements AdviceRepo {
  AdviceRepoImpl({required this.adviceRemoteDatasource});
  final AdviceRemoteDatasource adviceRemoteDatasource;

  @override
  Future<Either<Failure, AdviceEntity>> getAdviceFromDatasource() async {
    try {
      final result = await adviceRemoteDatasource.getAdvice();
      return right(result);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }
}
