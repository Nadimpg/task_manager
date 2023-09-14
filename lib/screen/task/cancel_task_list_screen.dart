import 'package:flutter/material.dart';

import '../../api/network_request/network_request.dart';
import '../../api/urls/urls.dart';
import '../../models/new_task_model.dart';
import '../../widgets/task_widgets.dart';
import '../profile/profile_update_screen.dart';

class CancelTaskScreen extends StatefulWidget {
  const CancelTaskScreen({super.key});

  @override
  State<CancelTaskScreen> createState() => _CancelTaskScreenState();
}

class _CancelTaskScreenState extends State<CancelTaskScreen> {
  NewTaskModel? _newTaskModel;
  Future<void> getCancelTaskTaskFromApi() async {
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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) { });

    getCancelTaskTaskFromApi();
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
            _newTaskModel==null ?Expanded(child: Center(child: CircularProgressIndicator(),)) : Expanded(
              child: ListView.builder(
                  itemCount: _newTaskModel?.data?.length ?? 0,
                  itemBuilder: (_,index){
                    final task= _newTaskModel!.data![index];
                    return taskwidgets(title: task.title ?? '', description: task.description ?? '', date: task.createdDate ?? '', type: 'Cancel', oneditTap: (){}, ondeleteTap: (){});

                  }),
            ),
          ],
        ),
      ),
    );
  }
}
