import 'package:cipherx_expense_tracker_app/home/services/remote/home_remote_data_sources.dart';
import 'package:cipherx_expense_tracker_app/home/widgets/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GetIt.I.get<HomeRemoteDataSources>().getTransactions(),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        print(
            '-------88888888888888888----------->>> ${snapshot.data?.length}');
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: snapshot.data?.length ?? 0,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TransactionCard(
                category: snapshot.data![index].category,
                description: snapshot.data![index].description,
                amount: snapshot.data![index].type == 'income'
                    ? '+${snapshot.data![index].amount}'
                    : '-${snapshot.data![index].amount}',
                date: formatDateTime(snapshot.data![index].date),
                color: snapshot.data![index].type == 'income'
                    ? Colors.green
                    : Colors.red,
              ),
            );
          },
        );
      },
    );
  }

  String formatDateTime(DateTime inputDate) {
    Duration offset = const Duration(hours: 5, minutes: 30);
    DateTime formattedDate = inputDate.subtract(offset);
    DateFormat outputFormat = DateFormat('hh:mm a');
    return outputFormat.format(formattedDate);
  }
}
