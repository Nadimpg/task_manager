import 'package:flutter/material.dart';

class taskwidgets extends StatelessWidget {
  const taskwidgets({
    super.key, required this.title, required this.description, required this.date, required this.type,required this.oneditTap,required this.ondeleteTap,
  });
  final String title,description,date,type;
  final VoidCallback oneditTap,ondeleteTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: ListTile(
        tileColor: Colors.green.withOpacity(.4),
        title: Text(title),

        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12,),
            Text(description),
            SizedBox(height: 12,),

            Text(date),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(label: Text(type),backgroundColor: Colors.green,),
                ButtonBar(
                  children: [
                    IconButton(onPressed: oneditTap, icon: Icon(Icons.edit_note_sharp,color: Colors.blueAccent,)),
                    IconButton(onPressed: ondeleteTap, icon: Icon(Icons.delete,color: Colors.red,)),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}