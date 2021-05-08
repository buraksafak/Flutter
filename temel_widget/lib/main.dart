import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:temel_widget/models/student.dart';
import 'package:temel_widget/screens/student_add.dart';
import 'package:temel_widget/screens/student_edit.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String message = " flutter app!";

  //secilen ogrenciyi Student nesnesi tipinde tutuyoruz.
  Student selectedStudent = Student.withId(0, "", "", 0);

  List<Student> students = [
    Student.withId(1, "Burak", "SAFAK", 100),
    Student.withId(2, "Burhan", "KOCAK", 10),
    Student.withId(3, "Faruk", "ATASOY", 45),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(message),
        ),
        body: buildBody(context));
  }

  void showMessage(BuildContext context, String message) {
    var alert = AlertDialog(
      title: Text("Transaction Result!"),
      content: Text(message),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  //ListTile hangi elemani nereye yerlestirecegimizi kontrol edecegimiz yapi.
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://pbs.twimg.com/profile_images/1359150871641210885/v1tO4v3a_400x400.jpg"),
                    ),
                    title: Text(students[index].firstName +
                        " " +
                        students[index].lastName),
                    subtitle: Text("Exam grade: " +
                        students[index].grade.toString() +
                        " [" +
                        students[index].getStatus +
                        "]"),
                    trailing: buildStatusIcon(students[index].grade),

                    //Dokunuldugunda;
                    onTap: () {
                      /*setState, onTap(tiklanma) olayi gerceklestiginde icine yazilan komutlari ekrana tekrar cizer.
                      * buna ihtiyac duyulmasinin sebebi ise, Flutter'in performansli calismak amaciyla, StatefullWidget
                      * yapisi geregi, program calisir calismaz yalnizca bir kere ekrana basmasidir. Tiklandiginda ekranda
                      * degismesini istedigimiz seyler oldugunda setState() kullaniriz. */
                      setState(() {
                        selectedStudent = students[index];
                      });
                      print(selectedStudent.firstName);

                      print(students[index].firstName +
                          " " +
                          students[index].lastName);
                    },
                  );
                })),
        Text("Selected Student: " + selectedStudent.firstName),
        Row(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.lightBlue),
                ),
                child: Row(
                  children: [
                    Icon(Icons.add),
                    SizedBox(
                      width: 0.1,
                    ),
                    Text("New Student"),
                  ],
                ),
                onPressed: () {
                  //bu satır ile butona basildiginda  StudentAdd isimli sayfaya gidiyoruz.
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StudentAdd(students)));
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.grey),
                ),
                child: Row(
                  children: [
                    Icon(Icons.update),
                    SizedBox(
                      width: 0.1,
                    ),
                    Text("Update"),
                  ],
                ),
                onPressed: () {
                  //bu satır ile butona basildiginda  StudentAdd isimli sayfaya gidiyoruz.
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StudentEdit(selectedStudent))
                  );
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.redAccent),
                ),
                child: Row(
                  children: [
                    Icon(Icons.delete),
                    SizedBox(
                      width: 0.1,
                    ),
                    Text("Delete"),
                  ],
                ),
                onPressed: () {
                  setState(() {
                    students.remove(selectedStudent);
                  });
                  var message = "Deleted: " + selectedStudent.firstName;
                  showMessage(context, message);
                },
              ),
            )
          ],
        )
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 50) {
      return Icon(Icons.done);
    } else if (grade > 40) {
      return Icon(Icons.alarm);
    } else {
      return Icon(Icons.clear);
    }
  }
}
