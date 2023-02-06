import 'package:dartz/dartz.dart';
import 'package:client_core/core/error/failure.dart';
import 'package:client_core/features/domain/entities/refund_policy.dart';

abstract class RefundPolicyRepository {
  Future<Either<Failure, List<RefundPolicy>>> getRefundPolicyData();
}
