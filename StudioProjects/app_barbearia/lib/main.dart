import 'dart:math';

import 'package:app_barbearia/components/main_drawer.dart';
import 'package:app_barbearia/components/service_form.dart';
import 'package:app_barbearia/model/user.dart';

import 'components/transactional_form.dart';
import 'package:app_barbearia/components/adaptative_date_picker.dart';
import 'package:app_barbearia/components/calendar.dart';
import 'package:app_barbearia/components/schedule_list.dart';
import 'package:app_barbearia/components/services_list.dart';
import 'package:app_barbearia/model/service.dart';
import 'package:app_barbearia/model/shedule.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BarberShopApp());
}

class BarberShopApp extends StatelessWidget {
  BarberShopApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Implementar lógica para serem enviados a lista em ordem de acordo com a data selecionada
  final List<Schedule> _schedules = [
    Schedule(
      '1',
      'Luiz',
      '3238',
      DateTime.now(),
      DateTime.now(),
    ),
    Schedule(
      '2',
      'Pedro',
      '3238',
      DateTime.now(),
      DateTime.now(),
    ),
  ];
  final List<Service> _services = [
    Service(
        id: '1',
        name: "Corte de Cabelo",
        price: 25.50,
        imageProduct: Image.asset(
          'assets/images/waiting.png',
          fit: BoxFit.cover,
        )),
  ];

  int compareToDate(Schedule schedule1, Schedule shedule2) {
    return schedule1.date.compareTo(shedule2.date);
  }

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  _removeTransaction(String id) {
    setState(() {
      _schedules.removeWhere((tr) => tr.id == id);
    });
  }

  _addTransaction(String name, String phone, DateTime date, TimeOfDay time) {
    final newTransaction = Schedule(
      Random().nextDouble().toString(),
      name,
      phone,
      date,
      DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        time.hour,
        time.minute,
      ),
    );

    setState(() {
      _schedules.add(newTransaction);
    });
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionalForm(_addTransaction);
      },
    );
  }

  _openServiceFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return ServiceForm(_addService);
      },
    );
  }

  _addService(String name, double price) {
    final newService = Service(
      id: Random().nextDouble().toString(), 
      name: name, 
      price: price, 
      imageProduct:  Image.asset(
          'assets/images/waiting.png',
      )
    );

    setState(() {
      _services.add(newService);
    });
  }

   _removerService(String id) {
    setState(() {
      _services.removeWhere((tr) => tr.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    bool isLandscape = mediaQuery.orientation == Orientation.landscape;

    final List<Schedule> _schedulesOrderByDate = List.from(_schedules);
    _schedulesOrderByDate.sort(compareToDate);

    User user = User('1', 'Matheus', 'email', 'senha', true);

    final PreferredSizeWidget appBar = AppBar(
      backgroundColor: Colors.orange[400],
      title: Text(
        'Barbearia',
        style: TextStyle(color: Colors.white),
      ),
    );

    DateTime? _selectedDate = DateTime.now();

    final availableHeight = mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top;

    final bodyPage = SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 25, 0, 0),
            child: Row(
              children: [
                Text(
                  "Serviços",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'OpenSans',
                  ),
                ),
                if (user.userLogged)
                  Container(
                    padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                    alignment: Alignment.topRight,
                    child: IconButton(
                      color: Colors.orange,
                      icon: Icon(Icons.edit),
                      onPressed: () {_openServiceFormModal(context);},
                    ),
                  ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(0),
            height: 320, // TAMANHO DO CARD
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(child: ServicesList(_services)),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(13, 0, 0, 5),
            child: Text(
              "Agendamento",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'OpenSans',
              ),
            ),
          ),
          SizedBox(
            height: availableHeight * (isLandscape ? 1 : 0.40),
            child: ScheduleList(_schedulesOrderByDate, _removeTransaction),
          ),
        ],
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: appBar,
      body: bodyPage,
      drawer: MainDrawer(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange[400],
        child: const Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      backgroundColor: Color(0xFF2A2A2A),
      // bottomNavigationBar: FloatingActionButton(
      //   child: const Icon(Icons.edit),
      //   onPressed: () {

      //   },
      // ),
    );
  }
}
