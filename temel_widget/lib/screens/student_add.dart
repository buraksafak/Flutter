import 'package:flutter/material.dart';
import 'package:temel_widget/models/student.dart';
import 'package:temel_widget/validation/student_validator.dart';

// ignore: must_be_immutable
class StudentAdd extends StatefulWidget {
  List<Student> students;
  StudentAdd(List<Student> students) {

    this.students = students;
  }
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(students);
  }
}

//_StudentAddState sinifini State sinifindan extend et, StudentValidationMixin sinifinin ozelliklerini de al. (with ile yazilanlara mixin denir.)
class _StudentAddState extends State with StudentValidationMixin {
  List<Student> students;
  var student = Student.withoutInfo();
  //form bilgisini tutan key.Forma diger alanlardan erisebilmek icin kullanilir.
  var formKey = GlobalKey<FormState>();

  _StudentAddState(List<Student> students) {
      this.students = students;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("New student add"),
        ),
        body: Container(
          //ilgili container'in, her yerinden 20.0'lik bosluk birak.
          margin: EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                buildFirstNameField(),
                buildLastNameField(),
                buildGradeField(),
                buildSubmitButton(),
              ],
            ),
          ),
        ));
  }

  Widget buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Student Name: ", hintText: "Example: Burak"),
      //Textbox'a girilecek veri tipini, student_validator dosyasindaki, validateFirstName'den aldik.
      validator: validateFirstName,
      onSaved: (String value) {
        student.firstName = value;
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Student LastName: ", hintText: "Example: SAFAK"),
      //Textbox'a girilecek veri tipini, student_validator dosyasindaki, validateFirstName'den aldik.
      validator: validateLastName,
      onSaved: (String value) {
        student.lastName = value;
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: "Grade: ", hintText: "Example: 70"),
      //Textbox'a girilecek veri tipini, student_validator dosyasindaki, validateFirstName'den aldik.
      validator: validateGrade,
      onSaved: (String value) {
        student.grade = int.parse(value);
      },
    );
  }

  Widget buildSubmitButton() {
    return ElevatedButton(
        child: Text("Save"),
        onPressed: () {

              if (formKey.currentState.validate()) {
                formKey.currentState.save();
                students.add(student);
                saveStudent();
                Navigator.pop(context);
              }
        });
  }

  void saveStudent() {
    print(student.firstName);
    print(student.lastName);
    print(student.grade);
  }
}
