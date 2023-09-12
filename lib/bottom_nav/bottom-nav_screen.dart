
import 'package:flutter/material.dart';
import 'package:taskmanager/screen/task/cancel_task_list_screen.dart';
import 'package:taskmanager/screen/task/complete_task-list_screen.dart';
import 'package:taskmanager/screen/task/progress_task_list_screen.dart';

import '../screen/task/new_task_list_screen.dart';

class MainBottomNavigationBar extends StatefulWidget {
  const MainBottomNavigationBar({super.key});

  @override
  State<MainBottomNavigationBar> createState() => _MainBottomNavigationBarState();
}

class _MainBottomNavigationBarState extends State<MainBottomNavigationBar> {
  final  Pages = [const NewTaskScreen(),const CompleteTaskScreen(),const CancelTaskScreen(),const ProgressTaskScreen()];
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (int index){

            setState(() {
              currentIndex=index;
            });
          },
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.black12,
          backgroundColor: Colors.red,
          items:  [
            const BottomNavigationBarItem(icon: Icon(Icons.home),label: 'New Task'),
            const BottomNavigationBarItem(icon: Icon(Icons.price_check),label: 'Completed'),
            const BottomNavigationBarItem(icon: Icon(Icons.cancel_outlined),label: 'Cancel'),
            const BottomNavigationBarItem(icon: Icon(Icons.menu),label: 'InProgress'),
          ],
        ),
        body: Pages[currentIndex],
      ),
    );
  }
}