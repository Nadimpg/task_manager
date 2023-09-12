import 'package:flutter/material.dart';

import '../../widgets/task_widgets.dart';
import '../profile/profile_update_screen.dart';

class CompleteTaskScreen extends StatefulWidget {
  const CompleteTaskScreen({super.key});

  @override
  State<CompleteTaskScreen> createState() => _CompleteTaskScreenState();
}

class _CompleteTaskScreenState extends State<CompleteTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          backgroundColor: Colors.green,
          automaticallyImplyLeading: false,
          title: ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => ProfileUpdateScreen()));
            },
            leading: CircleAvatar(
              backgroundColor: Colors.green.shade800,
              child: Icon(Icons.person),
            ),
            title: Text('Nadim Hasan'),
            subtitle: Text('nadimhasan@gmail.com'),
          ),
        ),
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (_,index){
              return taskwidgets(title: 'New Task', description: 'Lorem Ipsum', date: '29-04-1999', type: 'Completed', oneditTap: (){}, ondeleteTap: (){});

            }),
      ),
    );
  }
}
