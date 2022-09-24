import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:notes/home/controller.dart';
import 'package:notes/widget/note_cart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widget/add_note_dialog.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  void initState() {
    SharedPreferences.getInstance().then((sp){
      List<String> notes =sp.getStringList('notes')??[];
      for(var i in notes){
        HomeController.instance.notes.insert(0, json.decode(i));
      }
      setState(() {});
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: HomeController.instance.notes.length,
        itemBuilder: (context, index) => NoteCard(
          date: HomeController.instance.notes[index]['date'],
          note: HomeController.instance.notes[index]['note'],
          titel: HomeController.instance.notes[index]['titel'],
        ),
        padding: EdgeInsets.all(20),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showAddNoteDialog(context);
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
