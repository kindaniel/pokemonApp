import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poke_design_system/theme/pokeds_colors.dart';

class BaseStatsWidget extends StatelessWidget {
  const BaseStatsWidget({super.key, required this.name, required this.value});

  final String name;
  final int value;

  linearProgressValue(int value) {
    if (value >= 100) {
      return double.tryParse(value.toString());
    }
    return double.tryParse('0.$value');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0.w),
      child: Row(
        children: [
          SizedBox(
            width: 90.w,
            child: Text(
              name,
              textAlign: TextAlign.right,
              style: TextStyle(
                color: PokedsColors.primaryColor,
                fontWeight: FontWeight.w700,
                fontSize: 10.sp,
              ),
            ),
          ),
          SizedBox(
            width: 16.w,
          ),
          Text(
            value.toString(),
            style: TextStyle(
              fontSize: 10.sp,
              color: const Color(0xff212121),
            ),
          ),
          SizedBox(
            width: 16.w,
          ),
          Expanded(
            child: LinearProgressIndicator(
              value: linearProgressValue(value),
              color: PokedsColors.primaryColor,
              backgroundColor: PokedsColors.primaryColor.withOpacity(0.1),
            ),
          )
        ],
      ),
    );
  }
}
