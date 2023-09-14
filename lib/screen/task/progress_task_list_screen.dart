import 'package:flutter/material.dart';

import '../../api/network_request/network_request.dart';
import '../../api/urls/urls.dart';
import '../../models/new_task_model.dart';
import '../../widgets/task_widgets.dart';
import '../profile/profile_update_screen.dart';

class ProgressTaskScreen extends StatefulWidget {
  const ProgressTaskScreen({super.key});

  @override
  State<ProgressTaskScreen> createState() => _ProgressTaskScreenState();
}

class _ProgressTaskScreenState extends State<ProgressTaskScreen> {
  NewTaskModel? _newTaskModel;
  Future<void> getInProgressTaskTaskFromApi() async {
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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});

    getInProgressTaskTaskFromApi();
  }

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
              _newTaskModel == null
                  ? const Expanded(
                      child: Center(
                      child: CircularProgressIndicator(),
                    ))
                  : Expanded(
                      child: RefreshIndicator(
                        onRefresh: ()async{
                          getInProgressTaskTaskFromApi();
                        },
                        child: ListView.builder(
                            itemCount: _newTaskModel?.data?.length ?? 0,
                            itemBuilder: (_, index) {
                              final task = _newTaskModel!.data![index];
                              return taskwidgets(
                                  title: task.title ?? '',
                                  description: task.description ?? '',
                                  date: task.createdDate ?? '',
                                  type: 'InProgress',
                                  oneditTap: () {
                                    showModalBottomShetForChangeState(
                                        task.sId ?? '');
                                  },
                                  ondeleteTap: () {});
                            }),
                      ),
                    ),
            ],
          )),
    );
  }

  void showModalBottomShetForChangeState(String taskId) {
    String taskStatus = 'Complete';
    bool taskStatusProgress=false;
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, changeState) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text('Change State'),
                  const SizedBox(
                    height: 10,
                  ),
                  RadioListTile(
                      title: const Text('In Progress'),
                      value: 'Complete',
                      groupValue: taskStatus,
                      onChanged: (value) {
                        taskStatus = value!;
                        changeState(() {});
                      }),
                  RadioListTile(
                      title: const Text('Cancelled'),
                      value: 'Cancelled',
                      groupValue: taskStatus,
                      onChanged: (value) {
                        taskStatus = value!;
                        changeState(() {});
                      }),
                  RadioListTile(
                      title: const Text('completed'),
                      value: 'completed',
                      groupValue: taskStatus,
                      onChanged: (value) {
                        taskStatus = value!;
                        changeState(() {});
                      }),
                  const SizedBox(
                    height: 18,
                  ),
                  if(taskStatusProgress)
                    Center(child: CircularProgressIndicator(),)
                  else
                  Container(
                      width: 300,
                      child: ElevatedButton(
                          onPressed: () async {
                            taskStatusProgress=true;
                            changeState((){});
                            final response = await NetworkRequest().getRequest(
                                Urls.upDateTask(taskId, taskStatus));
                            taskStatusProgress=false;
                            changeState((){});
                            if (response['status'] == 'success') {
                              getInProgressTaskTaskFromApi();
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Successfull')));
                              Navigator.pop(context);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('try again')));
                            }
                          },
                          child: const Text('submit')))
                ],
              ),
            );
          });
        });
  }
}
