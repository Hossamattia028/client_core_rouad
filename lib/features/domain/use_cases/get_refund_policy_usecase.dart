import 'package:dartz/dartz.dart';
import 'package:client_core/core/error/failure.dart';
import 'package:client_core/features/domain/entities/refund_policy.dart';
import 'package:client_core/features/domain/repositories/refund_policy.dart';

class GetRefundPolicyUsecase {
  final RefundPolicyRepository refundPloicyRepository;

  GetRefundPolicyUsecase(this.refundPloicyRepository);

  Future<Either<Failure, List<RefundPolicy>>> call() async {
    return await refundPloicyRepository.getRefundPolicyData();
  }
}
