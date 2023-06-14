// ignore: import_of_legacy_library_into_null_safe
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:sche_lab/models/weeks.dart';
import 'package:sche_lab/screens/create_schedule_screen.dart';

import '../components/empty_home_screen.dart';
import '../models/agendamento.dart';
import '../models/schedule_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List<Schedule> schedules = [];
  List<Schedule> schedules = Schedule.schedules;
  List<Weeks> daysOfMonth = [];
  late int selectedDay;
  late Future<List<Agendamento>> agendamentos;

  @override
  void initState() async {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    final ScrollController _controller = ScrollController();

    Future<List<Agendamento>> getDailySchedules() async {
      final response = await http.post(
          Uri.parse('http://localhost:8080/api/v1/agendamentos'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: {
            jsonEncode({
              {
                "startDate": "2023-05-${DateTime.now().day}T00:00:00.900+00:00",
                "finalDate": "2023-05-${DateTime.now().day}T23:59:00.900+00:00"
              }
            })
          });

      if (response.statusCode == 200) {
        List listSchedules = json.decode(response.body);
        return listSchedules.map((json) => Agendamento.fromJson(json)).toList();
      } else {
        throw Exception('Não foi possível carregar os Agendamentos');
      }
    }

    void _handleDay(int day) async {
      setState(() {
        selectedDay = day;
      });
    }

    int daysInMonth(DateTime date) {
      var firstDayThisMonth = new DateTime(date.year, date.month, date.day);
      var firstDayNextMonth = new DateTime(firstDayThisMonth.year,
          firstDayThisMonth.month + 1, firstDayThisMonth.day);
      return firstDayNextMonth.difference(firstDayThisMonth).inDays;
    }

    void addToList(number) {
      var dateNow = DateTime.now();
      var date = DateTime(dateNow.year, dateNow.month, number);

      var week = Weeks(
          day: int.parse(DateFormat.d('pt_BR').format(date)),
          weekDay: DateFormat.E('pt_BR').format(date),
          month: DateFormat.M('pt_BR').format(date));

      List<Weeks> copy = daysOfMonth;
      copy.add(week);
      setState(() {
        daysOfMonth = copy;
      });
    }

    void generateDates() {
      var dateNow = DateTime.now();
      var now = DateTime(dateNow.year, dateNow.month);

      var totalDays = daysInMonth(now);

      for (var i = 1; i <= totalDays; i++) {
        addToList(i);
      }
    }

    generateDates();

    @override
    _floatButtonAdd() {
      if (schedules.isNotEmpty) {
        return FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CreateScheduleScreen()));
          },
          focusElevation: 1,
          backgroundColor: Color.fromRGBO(64, 123, 255, 1),
          child: const Icon(Icons.add),
        );
      }
    }

    // @override
    // void initState() {
    //   super.initState();
    // }

    return Container(
        decoration: BoxDecoration(color: Color.fromRGBO(245, 245, 245, 1)),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              toolbarHeight: 24,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            floatingActionButton: _floatButtonAdd(),
            bottomNavigationBar: const _CustomAppBar(),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const _TitleMain(),
                  Container(
                    margin: const EdgeInsets.only(bottom: 24),
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 90,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                controller: _controller,
                                shrinkWrap: true,
                                itemCount: daysOfMonth.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () async {
                                      // await this.getDailySchedules();
                                      _handleDay(daysOfMonth[index].day);
                                    },
                                    child: WeekDayCard(
                                        weekDay: daysOfMonth[index].weekDay,
                                        day: daysOfMonth[index].day,
                                        selectedDay: selectedDay),
                                  );
                                }),
                          ),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 24.0, horizontal: 28.0),
                      child: Column(
                        children: [
                          const SectionHeader(),
                          Divider(color: Color.fromRGBO(217, 217, 217, 1)),
                          SizedBox(
                            height: 24,
                          ),
                          (schedules.isEmpty)
                              ? EmptyHomeComponent()
                              : ScheduleListComponent(schedules: schedules),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )));
  }
}

class WeekDayCard extends StatefulWidget {
  WeekDayCard(
      {super.key,
      required this.weekDay,
      required this.day,
      required this.selectedDay});

  final String weekDay;
  final int day;
  final int selectedDay;

  @override
  State<WeekDayCard> createState() => _WeekDayCardState();
}

class _WeekDayCardState extends State<WeekDayCard> {
  bool isCurrentDay() {
    final currentDate = DateTime.now();
    final currentDay = DateFormat.d().format(currentDate);

    if (int.parse(currentDay) == widget.day) return true;

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      margin: EdgeInsets.only(right: 12),
      padding: const EdgeInsets.only(left: 2, right: 2),
      decoration: BoxDecoration(
          color:
              isCurrentDay() ? Color.fromRGBO(64, 123, 255, 1) : Colors.white,
          borderRadius: BorderRadius.circular(14.0),
          border: Border.all(
              color: Color.fromRGBO(64, 123, 255, 1),
              width: 1,
              style: widget.selectedDay == widget.day
                  ? BorderStyle.solid
                  : BorderStyle.none)),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          widget.weekDay,
          style: TextStyle(
              color: isCurrentDay()
                  ? Colors.white
                  : Color.fromRGBO(64, 123, 255, 1),
              fontWeight: FontWeight.w400,
              fontSize: 12),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          "${widget.day}",
          style: GoogleFonts.poppins(
              color: isCurrentDay()
                  ? Colors.white
                  : Color.fromRGBO(64, 123, 255, 1),
              fontWeight: FontWeight.bold,
              fontSize: 28),
        )
      ]),
    );
  }
}

class ScheduleListComponent extends StatefulWidget {
  const ScheduleListComponent({
    super.key,
    required this.schedules,
  });

  final List<Schedule> schedules;

  @override
  State<ScheduleListComponent> createState() => _ScheduleListComponentState();
}

class _ScheduleListComponentState extends State<ScheduleListComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Horário',
              style: TextStyle(
                  color: Color.fromRGBO(120, 120, 120, 1),
                  fontWeight: FontWeight.w600,
                  fontSize: 12),
            ),
            SizedBox(
              width: 36,
            ),
            Text(
              'Curso',
              style: TextStyle(
                  color: Color.fromRGBO(120, 120, 120, 1),
                  fontWeight: FontWeight.w600,
                  fontSize: 12),
            ),
          ],
        ),
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.schedules.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(top: 24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: [
                            Text(
                                DateFormat(DateFormat.HOUR24_MINUTE, 'pt_BR')
                                    .format(widget.schedules[index].startTime),
                                style: TextStyle(
                                  color: Color.fromRGBO(28, 28, 28, 1),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                )),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              DateFormat(DateFormat.HOUR24_MINUTE, 'pt_BR')
                                  .format(widget.schedules[index].endTime),
                              style: TextStyle(
                                  color: Color.fromRGBO(171, 171, 171, 1),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                              color: Color.fromRGBO(217, 217, 217, .5)),
                          color: index == 0
                              ? Color.fromRGBO(64, 123, 255, 1)
                              : Colors.white,
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 14.0, horizontal: 16),
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                child: Text(
                              widget.schedules[index].title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: index == 0
                                      ? Colors.white
                                      : Color.fromRGBO(25, 25, 25, 1)),
                            )),
                            SizedBox(
                              height: 2,
                            ),
                            Container(
                                child: Text(
                              widget.schedules[index].description,
                              style: TextStyle(
                                  color: index == 0
                                      ? Colors.white
                                      : Color.fromRGBO(171, 171, 171, 1),
                                  fontSize: 12),
                            )),
                            SizedBox(
                              height: 18,
                            ),
                            Container(
                                child: Text(widget.schedules[index].userName,
                                    style: TextStyle(
                                        color: index == 0
                                            ? Colors.white
                                            : Color.fromRGBO(25, 25, 25, 1),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600))),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ],
    );
  }
}

class SectionHeader extends StatefulWidget {
  const SectionHeader({super.key, selectedDay});

  @override
  State<SectionHeader> createState() => _SectionHeaderState();
}

class _SectionHeaderState extends State<SectionHeader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Agendamentos do dia',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: Color.fromRGBO(120, 120, 120, 1), fontSize: 16),
              )),
        ],
      ),
    );
  }
}

class _TitleMain extends StatefulWidget {
  const _TitleMain({
    super.key,
  });

  @override
  State<_TitleMain> createState() => _TitleMainState();
}

class _TitleMainState extends State<_TitleMain> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 28.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Hoje',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(204, 204, 204, 1),
                    fontSize: 18)),
            const SizedBox(height: 4),
            Text(
                DateFormat(DateFormat.MONTH_WEEKDAY_DAY, 'pt_Br')
                    .format(DateTime.now()),
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(64, 123, 255, 1),
                    fontSize: 24)),
          ]),
        ),
      ],
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromRGBO(245, 245, 245, 1),
        unselectedItemColor: Color.fromRGBO(166, 166, 166, 1),
        selectedItemColor: Color.fromRGBO(64, 123, 255, 1),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month), label: 'calendar'),
          BottomNavigationBarItem(
              icon: Icon(Icons.now_widgets_rounded), label: 'add'),
          BottomNavigationBarItem(
              icon: Icon(Icons.manage_accounts), label: 'user')
        ]);
  }
}
