// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:salloon_app/config/theme/app_colors.dart';
import 'package:salloon_app/core/util/utils.dart';
import 'package:salloon_app/features/booking/data/model/booking_model.dart';
import 'package:salloon_app/features/booking/presentation/bloc/booking/booking_bloc.dart';
import 'package:salloon_app/responsive/responsive.dart';

class BookingPage extends StatefulWidget {
  final String saLoonUid;
  const BookingPage({
    Key? key,
    required this.saLoonUid,
  }) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final TextEditingController _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void book() {
    if (_currentIndex == null) {
      Fluttertoast.showToast(msg: "Please select Time");
      return;
    }
    if (_formKey.currentState!.validate() && _controller.text.length == 10) {
      var bookingModel = BookingModel(
        phone: _controller.text.trim(),
        money: "50000",
        date: _currentDay.toString(),
        time:
            "${_currentIndex! + 9}:00 ${_currentIndex! + 9 > 11 ? "PM" : "AM"}",
      );

      context.read<BookingBloc>().add(
            BookingTheSaloon(
              bookingModel: bookingModel,
              uid: widget.saLoonUid,
            ),
          );
    } else {
      Fluttertoast.showToast(msg: "Please Enter Valid Number");
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<BookingBloc>().add(HandleRazorPay(context: context));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  CalendarFormat _formate = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _currentDay = DateTime.now();

  int? _currentIndex;

  bool _isWeekend = false;

  @override
  Widget build(BuildContext context) {
    Utility().init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("Appointment"),
      ),
      body: Responsive(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Column(
                children: [
                  _tableCalender(),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Text(
                      "Select The Slot",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
            _isWeekend
                ? SliverToBoxAdapter(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 30,
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        "Weekend is not availabel, plese select another date",
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  )
                : SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return InkWell(
                          splashColor: Colors.transparent,
                          onTap: () {
                            setState(() {
                              _currentIndex = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: _currentIndex == index
                                  ? AppColors.kButtonColor
                                  : null,
                              border: Border.all(
                                color: _currentIndex == index
                                    ? AppColors.baseLightColor
                                    : AppColors.kblack,
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              '${index + 9}:00 ${index + 9 > 11 ? "PM" : "AM"}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: _currentIndex == index
                                    ? AppColors.background
                                    : null,
                              ),
                            ),
                          ),
                        );
                      },
                      childCount: 8,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 1.5,
                    ),
                  ),
            SliverToBoxAdapter(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 10,
                  ),
                  child: CupertinoTextFormFieldRow(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Your Number';
                      }
                      return null;
                    },
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(),
                    ),
                    keyboardType: TextInputType.phone,
                    maxLength: 10,
                    controller: _controller,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 80),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.kButtonColor,
                  ),
                  onPressed: book,
                  icon: const Icon(
                    Icons.book_outlined,
                    color: AppColors.kblack,
                  ),
                  label: const Text(
                    "Make Appointment",
                    style: TextStyle(
                      color: AppColors.kblack,
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _tableCalender() {
    return TableCalendar(
      focusedDay: _focusedDay,
      firstDay: DateTime.now(),
      lastDay: DateTime(2023, 12, 31),
      calendarFormat: _formate,
      currentDay: _currentDay,
      rowHeight: 48,
      calendarStyle: const CalendarStyle(
        todayDecoration: BoxDecoration(
          color: AppColors.kButtonColor,
          shape: BoxShape.circle,
        ),
      ),
      availableCalendarFormats: const {
        CalendarFormat.month: "Month",
      },
      onFormatChanged: (format) {
        setState(() {
          _formate = format;
        });
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _currentDay = selectedDay;
          _focusedDay = focusedDay;
          if (selectedDay.weekday == 6 || selectedDay.weekday == 7) {
            _isWeekend = true;
            _currentIndex = null;
          } else {
            _isWeekend = false;
          }
        });
      },
    );
  }
}
