import 'package:flutter/material.dart';

import 'create_schedule_screen.dart';

class EmptyHomeComponent extends StatelessWidget {
  const EmptyHomeComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Image.asset('assets/images/man-schedule.png'),
        SizedBox(
          height: 40,
        ),
        Text(
          'Sem agendametnos no momento',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(28, 28, 28, 1)),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          'Vamos agendar um horário?',
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w300,
              color: Color.fromRGBO(120, 120, 120, 1)),
        ),
        SizedBox(
          height: 24,
        ),
        ElevatedButton.icon(
          icon: Icon(Icons.add),
          label: Text(
            "Criar agendamento",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => CreateScheduleScreen()))),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 68.0),
            backgroundColor: Color.fromRGBO(64, 123, 255, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
            ),
          ),
        ),
      ]),
    );
  }
}
