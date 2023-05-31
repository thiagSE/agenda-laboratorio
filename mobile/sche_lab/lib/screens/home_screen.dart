import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:sche_lab/models/schedule_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Schedule> schedules = Schedule.schedules;
    initializeDateFormatting();

    return Container(
        decoration: BoxDecoration(color: Color.fromRGBO(245, 245, 245, 1)),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              toolbarHeight: 24,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            bottomNavigationBar: const _CustomAppBar(),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const _TitleMain(),
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
                          Row(
                            children: [
                              Text(
                                'Horário',
                                style: TextStyle(
                                    color: Color.fromRGBO(120, 120, 120, 1),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                'Curso',
                                style: TextStyle(
                                    color: Color.fromRGBO(120, 120, 120, 1),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                          ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: schedules.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.only(top: 24),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        flex: 1,
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: Column(
                                            children: [
                                              Text(
                                                  DateFormat(
                                                          DateFormat
                                                              .HOUR24_MINUTE,
                                                          'pt_BR')
                                                      .format(schedules[index]
                                                          .endTime),
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          28, 28, 28, 1),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                              SizedBox(
                                                height: 4,
                                              ),
                                              Text(
                                                DateFormat(
                                                        DateFormat
                                                            .HOUR24_MINUTE,
                                                        'pt_BR')
                                                    .format(schedules[index]
                                                        .startTime),
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        171, 171, 171, 1),
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 3,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            border: Border.all(
                                                color: Color.fromRGBO(
                                                    217, 217, 217, .5)),
                                            color: index == 0
                                                ? Color.fromRGBO(
                                                    64, 123, 255, 1)
                                                : Colors.white,
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 14.0, horizontal: 16),
                                          alignment: Alignment.centerLeft,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                  child: Text(
                                                schedules[index].title,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: index == 0
                                                        ? Colors.white
                                                        : Color.fromRGBO(
                                                            25, 25, 25, 1)),
                                              )),
                                              SizedBox(
                                                height: 2,
                                              ),
                                              Container(
                                                  child: Text(
                                                schedules[index].description,
                                                style: TextStyle(
                                                    color: index == 0
                                                        ? Colors.white
                                                        : Color.fromRGBO(
                                                            171, 171, 171, 1),
                                                    fontSize: 14),
                                              )),
                                              SizedBox(
                                                height: 18,
                                              ),
                                              Container(
                                                  child: Text(
                                                      schedules[index].userName,
                                                      style: TextStyle(
                                                          color: index == 0
                                                              ? Colors.white
                                                              : Color.fromRGBO(
                                                                  25,
                                                                  25,
                                                                  25,
                                                                  1),
                                                          fontSize: 14,
                                                          fontWeight: FontWeight
                                                              .w600))),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )));
  }
}

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Agendamentos do mês',
            style: TextStyle(
              color: Color.fromRGBO(120, 120, 120, 1),
              fontSize: 18,
            ),
          ),
          Text(
            'Ver todos',
            style: TextStyle(
              color: Color.fromRGBO(120, 120, 120, 1),
              fontSize: 18,
            ),
          )
        ],
      ),
    );
  }
}

class _TitleMain extends StatelessWidget {
  const _TitleMain({
    super.key,
  });

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
                    fontFamily: 'Poppins',
                    fontSize: 18)),
            const SizedBox(height: 4),
            Text(
                DateFormat(DateFormat.MONTH_WEEKDAY_DAY, 'pt_Br')
                    .format(DateTime.now()),
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(64, 123, 255, 1),
                    fontFamily: 'Poppins',
                    fontSize: 28)),
            const SizedBox(
              height: 24,
            )
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
