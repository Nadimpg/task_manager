import 'package:flutter/material.dart';
import 'package:taskmanager/api/network_request/network_request.dart';

import '../../style/style.dart';
import '../profile/profile_update_screen.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  final TextEditingController subController=TextEditingController();
  final TextEditingController desController=TextEditingController();
  final _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Add Task",
                  style: Head1Text(colorDarkBlue)),
              const SizedBox(height: 20),
              TextFormField(
                controller: subController,
                  decoration: AppInputDecoration("subject"),
                validator: (String? value){
                  if(value?.isEmpty ?? true){
                    return 'Enter your subject';
                  }
                  return null;
                },),
              const SizedBox(height: 20),
              TextFormField(
                controller: desController,
                  maxLines: 10,
                  decoration: AppInputDecoration("description"),
                validator: (String? value){
                  if(value?.isEmpty ?? true){
                    return 'Enter your description';
                  }
                  return null;
                },),
              const SizedBox(height: 20),
              Container(child: ElevatedButton(
                style: AppButtonStyle(),
                child: SuccessButtonChild('Update'),
                onPressed: () async {
                  if(_formKey.currentState!.validate()){
                    final result=await NetworkRequest().postRequest(
                    'https://task.teamrabbil.com/api/v1/createTask',
                        {
                          "title":subController.text.trim(),
                          "description":desController.text.trim(),
                          "status":"New"
                        }
                    );
                    print(result);
                    if(result['status']=='success'){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.green, content: Text('New Task has been added')));
                        subController.text='';
                        desController.text='';
                    }
                  }

                },
              ),)

            ],
          ),
        ),
      ),
    ));
  }
}
