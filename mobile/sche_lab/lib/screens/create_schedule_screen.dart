import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateScheduleScreen extends StatefulWidget {
  const CreateScheduleScreen({super.key});

  @override
  State<CreateScheduleScreen> createState() => _CreateScheduleScreenState();
}

class Turma {
  final String nome;
  final String turno;
  final int periodo;

  Turma({required this.nome, required this.turno, required this.periodo});
}

List<Turma> list = <Turma>[
  Turma(
      nome: 'Analise e desenvolvimento de sistemas',
      turno: 'Noite',
      periodo: 1),
  Turma(nome: 'Engenharia de Software', turno: 'Manhã', periodo: 2),
  Turma(
      nome: 'Analise e desenvolvimento de sistemas',
      turno: 'Manhã',
      periodo: 3),
  Turma(nome: 'Ciência da Computação', turno: 'Noite', periodo: 3),
];
Turma dropdownValue = list.first;

class _CreateScheduleScreenState extends State<CreateScheduleScreen> {
  TextEditingController dateController = TextEditingController();
  TextEditingController startAtController = TextEditingController();
  TextEditingController endsAtController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  String displayText = '';
  String displayStartAt = '';
  String displayEndsAt = '';
  String displayDescription = '';

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
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 24.0, horizontal: 28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 32,
                ),
                Text('Agende um horário',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(64, 123, 255, 1),
                        fontSize: 28)),
                SizedBox(
                  height: 24,
                ),
                TextField(
                  controller: dateController,
                  keyboardType: TextInputType.none,
                  style: TextStyle(
                      color: Colors.black87, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            BorderSide(width: 0, style: BorderStyle.none)),
                    hintText: 'Data',
                    hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                    filled: true,
                    fillColor: Color.fromRGBO(243, 243, 243, 1),
                    prefixIcon: Icon(
                      Icons.date_range,
                      color: Colors.black87,
                    ),
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
                  height: 24,
                ),
                DropdownButtonFormField<Turma>(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            BorderSide(width: 0, style: BorderStyle.none)),
                    hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                    filled: true,
                    fillColor: Color.fromRGBO(243, 243, 243, 1),
                    prefixIcon: Icon(
                      Icons.school_outlined,
                      color: Colors.black87,
                    ),
                  ),
                  value: dropdownValue,
                  icon: const Icon(Icons.keyboard_arrow_down_outlined),
                  isExpanded: true,
                  borderRadius: BorderRadius.circular(8),
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                  onChanged: (Turma? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  items: list.map<DropdownMenuItem<Turma>>((Turma value) {
                    return DropdownMenuItem<Turma>(
                      value: value,
                      child: Text(
                        "${value.periodo}° Período ${value.nome} / ${value.turno}",
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.visible),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 24,
                ),
                TextField(
                  controller: startAtController,
                  keyboardType: TextInputType.none,
                  style: TextStyle(
                      color: Colors.black87, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            BorderSide(width: 0, style: BorderStyle.none)),
                    hintText: 'Início',
                    hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                    filled: true,
                    fillColor: Color.fromRGBO(243, 243, 243, 1),
                    prefixIcon: Icon(
                      Icons.access_time,
                      color: Colors.black87,
                    ),
                  ),
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
                SizedBox(
                  height: 24,
                ),
                TextField(
                  controller: endsAtController,
                  keyboardType: TextInputType.none,
                  style: TextStyle(
                      color: Colors.black87, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            BorderSide(width: 0, style: BorderStyle.none)),
                    hintText: 'Término',
                    hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                    filled: true,
                    fillColor: Color.fromRGBO(243, 243, 243, 1),
                    prefixIcon: Icon(
                      Icons.access_time_filled,
                      color: Colors.black87,
                    ),
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
                SizedBox(
                  height: 24,
                ),
                TextField(
                  maxLines: 6,
                  controller: descriptionController,
                  style: TextStyle(
                      color: Colors.black87, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            BorderSide(width: 0, style: BorderStyle.none)),
                    hintText: 'Descrição',
                    hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                    filled: true,
                    fillColor: Color.fromRGBO(243, 243, 243, 1),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(bottom: 105),
                      child: Icon(
                        Icons.subject,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
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
