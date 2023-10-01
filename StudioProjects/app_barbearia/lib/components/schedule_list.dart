import 'package:app_barbearia/components/schedule_item.dart';
import 'package:app_barbearia/model/shedule.dart';
import 'package:flutter/material.dart';

class ScheduleList extends StatelessWidget {
  final List<Schedule> schedules;
  final void Function(String) onRemove;

  ScheduleList(this.schedules, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return schedules.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: <Widget>[
                  SizedBox(height: 20),
                  Text(
                    'Nenhuma Transação Cadastrada!',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              );
            },
          )
        : ListView.builder(
          scrollDirection: Axis.vertical,
            itemCount: schedules.length,
            itemBuilder: (ctx, index) {
              final tr = schedules[index];
              return ScheduleItem(schedule: tr, onRemove: onRemove);
            },
          );
  }
}