import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateScheduleScreen extends StatefulWidget {
  const CreateScheduleScreen({super.key});

  @override
  State<CreateScheduleScreen> createState() => _CreateScheduleScreenState();
}

class _CreateScheduleScreenState extends State<CreateScheduleScreen> {
  TextEditingController dateController = TextEditingController();
  TextEditingController startAtController = TextEditingController();
  TextEditingController endsAtController = TextEditingController();

  String displayText = '';
  String displayStartAt = '';
  String displayEndsAt = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color.fromRGBO(28, 28, 28, 1),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
      ),
      bottomNavigationBar: _CustomAppBar(),
      body: SafeArea(
          child: Scaffold(
        body: Container(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 24.0, horizontal: 28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Agende um horário',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(64, 123, 255, 1),
                        fontSize: 28)),
                TextField(
                  controller: dateController,
                  keyboardType: TextInputType.none,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide:
                            BorderSide(width: 0, style: BorderStyle.none)),
                    hintText: 'Data',
                    hintStyle:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    filled: true,
                    fillColor: Colors.amber,
                    prefixIcon: Icon(Icons.date_range),
                  ),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101));

                    if (pickedDate != null) {
                      String formattedDate =
                          DateFormat('dd/MM/yyyy').format(pickedDate);
                      setState(() {
                        dateController.text = formattedDate;
                      });
                    }
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  controller: startAtController,
                  keyboardType: TextInputType.none,
                  decoration: InputDecoration(
                      hintText: 'Início',
                      hintStyle:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      prefixIcon: Icon(Icons.access_time)),
                  readOnly: true,
                  onTap: () async {
                    var time = await showTimePicker(
                        context: context,
                        initialTime: const TimeOfDay(hour: 19, minute: 00));
                    if (time != null) {
                      setState(() {
                        startAtController.text = "${time.hour}:${time.minute}";
                      });
                    }
                  },
                ),
                TextField(
                  controller: endsAtController,
                  keyboardType: TextInputType.none,
                  decoration: InputDecoration(
                    hintText: 'Término',
                    hintStyle:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    prefixIcon: Icon(Icons.access_time_filled),
                  ),
                  readOnly: true,
                  onTap: () async {
                    var time = await showTimePicker(
                        context: context,
                        initialTime: const TimeOfDay(hour: 19, minute: 00));
                    if (time != null) {
                      setState(() {
                        endsAtController.text = "${time.hour}:${time.minute}";
                      });
                    }
                  },
                ),
                ElevatedButton.icon(
                  icon: Icon(Icons.add),
                  label: Text(
                    "Adicionar agendamento",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => CreateScheduleScreen()))),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(40),
                    padding: const EdgeInsets.symmetric(
                        vertical: 18, horizontal: 0.0),
                    backgroundColor: Color.fromRGBO(64, 123, 255, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
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
