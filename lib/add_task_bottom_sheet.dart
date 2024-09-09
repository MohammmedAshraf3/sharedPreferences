import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddTaskBottomSheet extends StatefulWidget {
  static final formKey = GlobalKey<FormState>();

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  String title = '';

  String description = '';
  var selectDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(12),
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context)!.add_new_task,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Form(
                key: AddTaskBottomSheet.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        style: Theme.of(context).textTheme.bodySmall,
                        decoration:
                            InputDecoration(hintText: 'Enter task title'),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Please enter task title';
                          }
                          return null;
                        },
                        onChanged: (text) {
                          title = text;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        style: Theme.of(context).textTheme.bodySmall,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Please enter task description';
                          }
                          return null;
                        },
                        onChanged: (text) {
                          description = text;
                        },
                        decoration:
                            InputDecoration(hintText: 'Enter task description'),
                        maxLines: 2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'select date',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          showCalendar();
                        },
                        child: Text(
                          '${selectDate.day}/${selectDate.month}/${selectDate.year}',
                          style: Theme.of(context).textTheme.bodySmall,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          addTask();
                        },
                        child: Text(
                          'Add',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ))
                  ],
                ))
          ],
        ),
      ),
    );
  }

  void addTask() {
    if (AddTaskBottomSheet.formKey.currentState?.validate() == true) {}
  }

  void showCalendar() async {
    var chosenDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (chosenDate != null) {
      selectDate = chosenDate;
    }
    selectDate = chosenDate ?? selectDate;
    setState(() {});
  }
}
