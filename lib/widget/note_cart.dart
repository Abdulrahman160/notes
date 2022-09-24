import 'package:flutter/material.dart';
import 'package:notes/home/controller.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    Key? key,
    required this.titel,
    required this.note,
    required this.date,
  }) : super(key: key);
  final String titel;
  final String note;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                titel,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              InkWell(
                child: Icon(Icons.close,color:Colors.grey.withGreen(100),),
                onTapCancel: (){},
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(note),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(date),
          ),
        ],
      ),
    );
  }
}
