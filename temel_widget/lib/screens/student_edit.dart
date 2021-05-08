import 'package:flutter/material.dart';
import 'package:temel_widget/models/student.dart';
import 'package:temel_widget/validation/student_validator.dart';

// ignore: must_be_immutable
class StudentEdit extends StatefulWidget {
  Student selectedStudent;
  StudentEdit(Student selectedStudent) {
    this.selectedStudent = selectedStudent;
  }
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(selectedStudent);
  }
}

//_StudentAddState sinifini State sinifindan extend et, StudentValidationMixin sinifinin ozelliklerini de al. (with ile yazilanlara mixin denir.)
class _StudentAddState extends State with StudentValidationMixin {
  Student selectedStudent;
  //form bilgisini tutan key.Forma diger alanlardan erisebilmek icin kullanilir.
  var formKey = GlobalKey<FormState>();

  _StudentAddState(Student selectedStudent) {
    this.selectedStudent = selectedStudent;
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
      initialValue: selectedStudent.firstName,
      decoration: InputDecoration(
          labelText: "Student Name: ", hintText: "Example: Burak"),
      //Textbox'a girilecek veri tipini, student_validator dosyasindaki, validateFirstName'den aldik.
      validator: validateFirstName,
      onSaved: (String value) {
        selectedStudent.firstName = value;
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      initialValue: selectedStudent.lastName,
      decoration: InputDecoration(
          labelText: "Student LastName: ", hintText: "Example: SAFAK"),
      //Textbox'a girilecek veri tipini, student_validator dosyasindaki, validateFirstName'den aldik.
      validator: validateLastName,
      onSaved: (String value) {
        selectedStudent.lastName = value;
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      initialValue: selectedStudent.grade.toString(),
      decoration:
          InputDecoration(labelText: "Grade: ", hintText: "Example: 70"),
      //Textbox'a girilecek veri tipini, student_validator dosyasindaki, validateFirstName'den aldik.
      validator: validateGrade,
      onSaved: (String value) {
        selectedStudent.grade = int.parse(value);
      },
    );
  }

  Widget buildSubmitButton() {
    return ElevatedButton(
        child: Text("Save"),
        onPressed: () {
          setState(
            () {
              if (formKey.currentState.validate()) {
                formKey.currentState.save();
                saveStudent();
                Navigator.pop(context);
              }
            },
          );
        });
  }

  void saveStudent() {
    print(selectedStudent.firstName);
    print(selectedStudent.lastName);
    print(selectedStudent.grade);
  }
}
