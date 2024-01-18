import 'package:cipherx_expense_tracker_app/home/providers/home_provider.dart';
import 'package:cipherx_expense_tracker_app/home/services/remote/home_remote_data_sources.dart';
import 'package:cipherx_expense_tracker_app/home/widgets/account_overview.dart';
import 'package:cipherx_expense_tracker_app/home/widgets/recent_transaction.dart';
import 'package:cipherx_expense_tracker_app/home/widgets/tab_bar.dart';
import 'package:cipherx_expense_tracker_app/utils/colors_contants.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  final String name, email;
  const HomePage({super.key, required this.name, required this.email});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // Future.delayed(Duration.zero, () {
    //   context.read<HomeProvider>().getAccount();
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        color: ColorConstants.splashScreenColor,
        backgroundColor: Colors.transparent,
        onTap: (index) {},
        items: const [
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.add,
            color: Colors.white,
          ),
          Icon(
            Icons.person,
            color: Colors.white,
          ),
          Icon(
            Icons.settings,
            color: Colors.white,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: GetIt.I.get<HomeRemoteDataSources>().getAccountDetails(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return Column(
                children: [
                  AccountOverview(
                    accountBalance: snapshot.data!.totalMoney,
                    income: snapshot.data!.totalIncome,
                    expenses: snapshot.data!.totalExpense,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const RecentTransactions(),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
