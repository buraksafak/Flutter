class Product
{
  int id;
  String name;
  String description;
  double unitPrice;

  // Product(int id) { this.id = id };  yazmanin Dart dilindeki alternatif ve basit yolu.
  Product({this.name, this.description, this.unitPrice});
  Product.withId({this.id, this.name, this.description, this.unitPrice});

  // Objeyi Map tipine cevirdigimiz metot.
  Map<String,dynamic> toMap(){
    //Map tipinde dinamik bir nesne olusturduk.
    var map = Map<String,dynamic>();
    map["name"] = name;
    map["description"] = description;
    map["unitPrice"] = unitPrice;
    if(id != null){
      map["id"] = id;
    }
    return map;
  }
//Map'i obje tipine cevirdigimiz metot.
  Product.fromObject(dynamic o){
    // id ve unitPrice alanlari icin tur donusumu yaptik.
    this.id = int.tryParse(o["id"].toString());
    this.name = o["name"];
    this.description = o["description"];
    this.unitPrice = double.tryParse(o["unitPrice"].toString());
  }

}