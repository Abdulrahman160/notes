import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home/controller.dart';

Future<void> showAddNoteDialog(
  BuildContext context,
) async =>
    showDialog(
      context: context,
      builder: (context) => _Dialog(),
    );


class _Dialog extends StatelessWidget {
  _Dialog({
    Key? key,
  }) : super(key: key);
  String? titel;
  String? note;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              onChanged: (value) => titel = value,
              decoration: const InputDecoration(
                hintText: 'Titel',
              ),
            ),
            TextField(
              onChanged: (value) => note = value,
              decoration: const InputDecoration(
                hintText: 'Note',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: ()  async{
                if (titel == null ||
                    titel!.isEmpty ||
                    note == null ||
                    note!.isEmpty) {
                  return;
                }
                final sp =await SharedPreferences.getInstance();
                Navigator.pop(context);
                HomeController.instance.notes.insert(0, {
                  'titel': titel,
                  'note': note,
                  'date': DateTime.now().toString(),
                });
                List<String> data =[];
                for(var i in HomeController.instance.notes){
                  data.add(json.encode(i));
                }
                sp.setStringList('notes', data);
                print(data);
              },
              child: const Text('Add Note'),
            )
          ],
        ),
      ),
    );
  }
}
