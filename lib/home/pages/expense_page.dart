import 'package:cipherx_expense_tracker_app/home/pages/home_page.dart';
import 'package:cipherx_expense_tracker_app/home/providers/category_drop_down_menu_provider.dart';
import 'package:cipherx_expense_tracker_app/home/providers/home_provider.dart';
import 'package:cipherx_expense_tracker_app/home/providers/wallet_drop_down_menu_provider.dart';
import 'package:cipherx_expense_tracker_app/home/widgets/drop_down_menu.dart';
import 'package:cipherx_expense_tracker_app/home/widgets/wallet_drop_down_menu.dart';
import 'package:cipherx_expense_tracker_app/utils/colors_contants.dart';
import 'package:cipherx_expense_tracker_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ExpensePage extends StatefulWidget {
  const ExpensePage({super.key});

  @override
  State<ExpensePage> createState() => _ExpensePageState();
}

class _ExpensePageState extends State<ExpensePage> {
  late TextEditingController amountController, descriptionController;

  @override
  void initState() {
    amountController = TextEditingController();
    descriptionController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 119, 255, 1),
      appBar: AppBar(
        title: Text(
          'Expense',
          style: GoogleFonts.inter(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(color: Colors.white, Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Consumer<HomeProvider>(
        builder: (context, ref, child) {
          if (ref.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (ref.error) {
            return const Center(child: Text('Something went wrong'));
          }

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .4,
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0),
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'How much?',
                        style: GoogleFonts.inter(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromRGBO(252, 252, 252, .64),
                        ),
                      ),
                      TextField(
                        controller: amountController,
                        style: GoogleFonts.inter(
                          fontSize: 64.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromRGBO(252, 252, 252, 1),
                        ),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          fillColor: Colors.transparent,
                          border: InputBorder.none,
                          filled: true,
                          // isDense: true,
                          // prefixText: '₹',
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: Text(
                              '₹',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                fontSize: 64.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromRGBO(252, 252, 252, 1),
                              ),
                            ),
                          ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: '0',

                          hintStyle: GoogleFonts.inter(
                            fontSize: 64.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromRGBO(252, 252, 252, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  alignment: Alignment.bottomCenter,
                  height: MediaQuery.of(context).size.height * 0.54,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32.r),
                      topRight: Radius.circular(32.r),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 30.h),
                      CategoryDropDownMenuSelector(
                        category: category,
                      ),
                      SizedBox(height: 16.h),
                      TextField(
                        controller: descriptionController,
                        decoration: const InputDecoration(
                          hintText: 'Description',
                        ),
                      ),
                      SizedBox(height: 16.h),
                      WalletDropDownMenuSelector(wallet: wallet),
                      SizedBox(height: 24.h),
                      const Divider(
                        color: ColorConstants.splashScreenColor,
                        thickness: 1,
                      ),
                      // SizedBox(height: 29.h),
                      ElevatedButton(
                          onPressed: addIncome, child: const Text('Continue')),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void addIncome() {
    if (amountController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please enter amount',
          ),
        ),
      );
      return;
    }
    int amount = int.parse(amountController.text);
    String walletType = wallet[
            Provider.of<WalletDropDownProvider>(context, listen: false).value]
        .toString();
    String categoryType = category[
            Provider.of<CategoryDropDownProvider>(context, listen: false).value]
        .toString();

    String description = descriptionController.text;

    DateTime now = DateTime.now();

    Map<String, dynamic> data = {
      'amount': amount,
      'wallet': walletType,
      'category': categoryType,
      'description': description,
      'date': now,
      'type': 'expense',
    };

    Provider.of<HomeProvider>(context, listen: false)
        .addExpenses(data)
        .then((value) => {
              if (value)
                {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const HomePage(name: '', email: '')))
                }
            });
    ;
  }
}

// nitesh@cipherSchools.com;