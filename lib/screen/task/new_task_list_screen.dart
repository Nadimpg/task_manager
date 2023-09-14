import 'package:flutter/material.dart';
import 'package:taskmanager/api/network_request/network_request.dart';
import 'package:taskmanager/api/urls/urls.dart';
import 'package:taskmanager/models/new_task_model.dart';
import 'package:taskmanager/screen/profile/profile_update_screen.dart';
import 'package:taskmanager/screen/task/add_new_task_screen.dart';

import '../../widgets/task_widgets.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  NewTaskModel? _newTaskModel;
  Future<void> getNewTaskFromApi() async {
    final response = await NetworkRequest().getRequest(Urls.newTask);

    if (response['status'] == 'success') {
      _newTaskModel = NewTaskModel.fromJson(response);
      setState(() {});
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

    });
    getNewTaskFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const AddNewTaskScreen()));
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
        title: ListTile(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const ProfileUpdateScreen()));
          },
          leading: CircleAvatar(
            backgroundColor: Colors.green.shade800,
            child: const Icon(Icons.person),
          ),
          title: const Text('Nadim Hasan'),
          subtitle: const Text('nadimhasan@gmail.com'),
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Card(
                color: Colors.white,
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        '231q',
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      Text('New Task')
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        '231q',
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      Text('New Task')
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        '231q',
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      Text('New Task')
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          _newTaskModel==null ? Expanded(child: Center(child: CircularProgressIndicator(),)) :  Expanded(
            child: ListView.builder(
                itemCount: _newTaskModel?.data?.length ?? 0,
                itemBuilder: (context, index) {
                  final task=_newTaskModel!.data![index];
                  return taskwidgets(
                      title: task.title ?? '',
                      description: task.description ?? '',
                      date: task.createdDate ?? '',
                      type: 'new',
                      oneditTap: () {},
                      ondeleteTap: () {});
                }),
          )
        ],
      ),
    ));
  }
}
