class Urls{
  static const String baseurl='https://task.teamrabbil.com/api/v1';
  static const String newTask='$baseurl/listTaskByStatus/Completed';
  static  String upDateTask(String taskId,String status)=>'$baseurl/updateTaskStatus/$taskId/$status';
}