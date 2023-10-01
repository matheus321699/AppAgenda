import 'package:app_barbearia/model/shedule.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class ScheduleItem extends StatelessWidget {
  const ScheduleItem({
    super.key,
    required this.schedule,
    required this.onRemove,
  });

  final Schedule schedule;
  final void Function(String p1) onRemove;

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('pt_BR', null);

    return Card(
      color: Color(0xFF3E3E3E),
      elevation: 5,
      margin: EdgeInsetsDirectional.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.white30,
          radius: 50,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(child: Text(
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
              DateFormat('HH:mm:ss', 'pt_BR').format(schedule.time))),
          ),
        ),
        title: Text(
          schedule.clientName,
//          Theme.of(context).textTheme.titleLarge,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
            fontSize: 18,
            color: Colors.white
          ),
        ),
        subtitle: Text(
          DateFormat('dd/MM/yyyy', 'pt_BR').format(schedule.date),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        trailing: MediaQuery.of(context).size.width > 480
            ? TextButton.icon(
                onPressed: () => onRemove(schedule.id),
                icon: Icon(Icons.delete,
                    color: Theme.of(context).errorColor),
                label: Text(
                  'Excluir',
                  style:
                      TextStyle(color: Theme.of(context).errorColor),
                ),
              )
            : IconButton(
                onPressed: () => onRemove(schedule.id),
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
              ),
      ),
    );
  }
}