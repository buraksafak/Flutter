class Student {
  int id;
  String firstName;
  String lastName;
  int grade;
  String _status;

  //ornegin, guncelleme yaparken kullanilir.
  Student.withId(int id, String firstName, String lastName, int grade) {
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }

  //ornegin, ekleme yaparken kullanilir
  Student(String firstName, String lastName, int grade) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }
  //herhangi bir bilgi girisi yapilmadan kullanilmasini saglayan constructor olusturduk.
  Student.withoutInfo() {}

  String get getFirstName {
    return "OGR - " + this.getFirstName;
  }

  //set metoduna ornek.
  void set setFirstName(String value) {
    this.firstName = value;
  }

  // Ogrencinin gecme, butunleme, kalma durumunu hesaplatan get metodu.
  String get getStatus {
    String message = "";
    if (grade >= 50) {
      message = "Passed";
    } else if (grade >= 40) {
      message = "Rescue Exam";
    } else {
      message = "Failed";
    }
    return message;
  }
}
