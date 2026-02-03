import 'package:aivolve/core/constants/theme/colors.dart';
import 'package:aivolve/core/constants/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class StreakCalendar extends StatefulWidget {
  final DateTime streakStart;
  final DateTime streakEnd;

  const StreakCalendar({
    super.key,
    required this.streakStart,
    required this.streakEnd,
  });

  @override
  State<StreakCalendar> createState() => _StreakCalendarState();
}

class _StreakCalendarState extends State<StreakCalendar> {
  DateTime currentMonth = DateTime(2025, 1);

  @override
  Widget build(BuildContext context) {
    final daysInMonth =
        DateUtils.getDaysInMonth(currentMonth.year, currentMonth.month);
    final firstDayOfMonth =
        DateTime(currentMonth.year, currentMonth.month, 1).weekday;

    return Transform.scale(
  scale: 0.95, 
  alignment: Alignment.topCenter,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _header(),
      const SizedBox(height: 6),
      _weekDays(),
      const SizedBox(height: 6),
      _calendarGrid(daysInMonth, firstDayOfMonth),
    ],
  ),
);

  }

  SizedBox _calendarGrid(int daysInMonth, int firstDayOfMonth) {
    return SizedBox(
        height: 180.h, 
    child: GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: daysInMonth + firstDayOfMonth - 1,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        crossAxisSpacing: 6,
        mainAxisSpacing: 6,
        childAspectRatio: 1.6,
      ),
          itemBuilder: (context, index) {
            if (index < firstDayOfMonth - 1) {
              return const SizedBox();
            }
        
            final day = index - firstDayOfMonth + 2;
            final date = DateTime(currentMonth.year, currentMonth.month, day);
        
            final isStreak = date.isAfter(
                    widget.streakStart.subtract(const Duration(days: 1))) &&
                date.isBefore(widget.streakEnd.add(const Duration(days: 1)));
        
            return _dayCell(day, isStreak);
          },
        ),
      );
  }

  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Text(
          "Streak Calendar",
          style: AivolveTextStyles.heading2.copyWith(fontSize: 18.sp),
        ),
        const Spacer(),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.chevron_left, color: AivolveColors.neonPurple),
              iconSize: 18.sp,
              onPressed: () {
                setState(() {
                  currentMonth =
                      DateTime(currentMonth.year, currentMonth.month - 1);
                });
              },
            ),
            Text(
              DateFormat("MMMM yyyy").format(currentMonth),
              style: AivolveTextStyles.paragraph.copyWith(color: AivolveColors.neonPurple,
                
                )
            ),
            IconButton(
              icon:
                  const Icon(Icons.chevron_right,color: AivolveColors.neonPurple),
                  iconSize: 18.sp,
              onPressed: () {
                setState(() {
                  currentMonth =
                      DateTime(currentMonth.year, currentMonth.month + 1);
                });
              },
            ),
          ],
        )
      ],
    );
  }

  Widget _weekDays() {
    const days = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: days
          .map(
            (d) => Expanded(
              child: Center(
                child: Text(
                  d,
                  style: AivolveTextStyles.paragraph
                      .copyWith(color: AivolveColors.lightPurple, fontSize: 12.sp),
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _dayCell(int day, bool isStreak) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: isStreak
            ? const LinearGradient(
                //colors: [Color(0xFFB388FF), Color(0xFF7C4DFF)],
                colors: [AivolveColors.neonPurple, AivolveColors.neonViolet],
              )
            : null,
        color: isStreak ? null : AivolveColors.glassBg,
        boxShadow: isStreak
            ? [
                BoxShadow(
                  color: Colors.purpleAccent.withOpacity(0.6),
                  blurRadius: 10,
                  spreadRadius: 1,
                )
              ]
            : [],
      ),
      alignment: Alignment.center,
      child: Text(
        "$day",
        style: TextStyle(
          color:  Colors.white ,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
