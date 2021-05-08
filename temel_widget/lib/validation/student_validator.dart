class StudentValidationMixin
{
  // ignore: missing_return
  String validateFirstName(String value)
  {
    if(value.length < 2)
      {
        return "First name must be at least 2 characters!";
      }
  }

  // ignore: missing_return
  String validateLastName(String value)
  {
    if(value.length < 2)
    {
      return "Last name must be at least 2 characters!";
    }
  }

  // ignore: missing_return
  String validateGrade(String value)
  {
    var grade = int.parse(value);
    if (grade < 0 || grade > 100)
      {
        return "Grade must be between 0-100 !";
      }
  }
}