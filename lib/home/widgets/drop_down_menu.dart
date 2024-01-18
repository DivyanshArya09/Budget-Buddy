import 'package:cipherx_expense_tracker_app/home/providers/category_drop_down_menu_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CategoryDropDownMenuSelector extends StatelessWidget {
  final List<String> category;
  const CategoryDropDownMenuSelector({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryDropDownProvider>(
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
              items: category
                  .map(
                    (e) => DropdownMenuItem(
                      value: category.indexOf(e),
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
                print('------------------------------------> $value');
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

/**DropdownMenuItem(
            value: 1,
            child: Text(
              'Food',
              style: GoogleFonts.inter(
                  textStyle: TextStyle(
                color: const Color.fromRGBO(145, 145, 159, 1),
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              )),
            ),
          ), */


/**DropdownButton(
        borderRadius: BorderRadius.circular(20),
        // underline: const SizedBox(),
        isExpanded: true,
        focusColor: Colors.red,
        value: 1,
        icon: const Icon(Icons.arrow_drop_down),
        elevation: 0,
        items: const [
          DropdownMenuItem(
            value: 1,
            child: Text('Food'),
          ),
          DropdownMenuItem(
            value: 2,
            child: Text('Travel'),
          ),
          DropdownMenuItem(
            value: 3,
            child: Text('Subscription'),
          ),
        ],
        onChanged: (value) {});
  
   */