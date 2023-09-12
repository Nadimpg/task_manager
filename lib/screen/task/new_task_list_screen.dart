import 'package:flutter/material.dart';
import 'package:taskmanager/screen/profile/profile_update_screen.dart';

import '../../widgets/task_widgets.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
          body: Column(
            children: [
              Row(
                children: [
                  Card(
                    color: Colors.white,
                    elevation: 5,
                    child: Padding(padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text('231q',style: TextStyle(fontSize: 24,),),
                        Text('New Task')
                      ],
                    ),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    elevation: 5,
                    child: Padding(padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text('231q',style: TextStyle(fontSize: 24,),),
                          Text('New Task')
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    elevation: 5,
                    child: Padding(padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text('231q',style: TextStyle(fontSize: 24,),),
                          Text('New Task')
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16,),
              taskwidgets(title: 'New Task', description: 'Lorem Ipsum', date: '29-04-1999', type: 'new', oneditTap: (){}, ondeleteTap: (){}),
              taskwidgets(title: 'New Task', description: 'Lorem Ipsum', date: '29-04-1999', type: 'new', oneditTap: (){}, ondeleteTap: (){}),
              taskwidgets(title: 'New Task', description: 'Lorem Ipsum', date: '29-04-1999', type: 'new', oneditTap: (){}, ondeleteTap: (){}),
            ],
          ),
    ));
  }
}


