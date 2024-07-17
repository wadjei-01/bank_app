import 'package:models/models.dart';
import 'package:collection/collection.dart';
import 'package:template_app/core/core_provider.dart';
import 'package:template_app/core/helpers/time_utils.dart';

typedef OrderedTransactions = Map<String?, List<Transaction>>;

extension TransactionListExtension on List<Transaction> {
  OrderedTransactions get orderedTransactions {
    try {
      final sortedList = [...this]
        ..sort((a, b) => b.dateCreated.compareTo(a.dateCreated));

      final groupedList = groupBy(sortedList, (Transaction transaction) {
        return TimeUtils.timeAgoHeader(
            DateTime.tryParse(transaction.dateCreated));
      });

      return groupedList;
    } catch (e) {
      printWarning('Ordered Transactions error:>> $e');
      return {};
    }
  }
}