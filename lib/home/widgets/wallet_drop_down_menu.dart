import 'package:cipherx_expense_tracker_app/home/providers/wallet_drop_down_menu_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WalletDropDownMenuSelector extends StatelessWidget {
  final List<String> wallet;
  const WalletDropDownMenuSelector({super.key, required this.wallet});

  @override
  Widget build(BuildContext context) {
    return Consumer<WalletDropDownProvider>(
      builder: (context, ref, child) {
        return InputDecorator(
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(0)),
              borderSide: BorderSide(
                color: Colors.black,
                width: 2,
              ),
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              elevation: 0,
              isExpanded: true,
              isDense: true,
              value: ref.value,
              items: wallet
                  .map(
                    (e) => DropdownMenuItem(
                      value: wallet.indexOf(e),
                      child: Text(
                        e,
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            color: const Color.fromRGBO(145, 145, 159, 1),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),

              onChanged: (value) {
                ref.changeValue(value ?? 0);
                // ref.changeValue(category[value] ?? 0);
              },
              // borderRadius: BorderRadius.circular(20),
            ),
          ),
        );
      },
    );
  }
}
