import 'package:taks1/taks1.dart' as taks1;
//first task
class Book{
  String? title;
  String? author;
  int? pages;
  Book(this.title,this.author,this.pages);

  String displayBookInfo(){
    return(" Title is $title And  Author is $author and  Pages Number is $pages");
  }
}
//second task
class Novel extends Book{
  String? gene;

  Novel(super.title, super.author, super.pages,this.gene);
  @override
  String displayBookInfo() {
    return super.displayBookInfo();
  }

}
//third task
 abstract class Shape{
  double area();
}

class CIrcle extends Shape{
  CIrcle(this.circleRadius);
  double circleRadius;
  @override
  double area() {
   return 3.14*circleRadius*circleRadius;
  }
}

class Rectangle extends Shape {
  Rectangle(this.width, this.height);
  double width;
  double height;

  @override
  double area() {
    return width * height;
  }
}
 printShapesArea(Shape shape) {
  print('Area is ${shape.area()}');
}
//fourth task
abstract class Serializable {
  String toJson();
}

class User implements Serializable {
  String userName;
  User(this.userName);

  @override
  String toJson() {
    return("User Name is $userName");
  }
}
class Product implements Serializable {
  String productCategory;
  Product(this.productCategory);

  @override
  String toJson() {
    return("Product Category is $productCategory");
  }
}

printInfo(Serializable serializable) {
  print(serializable.toJson());
}

//fifth task
class NotEnoughBalance implements Exception {
  String warningMessage() {
    return 'Your balance is not enough for this';
  }
}

class BankAccount {
  double balance;
  BankAccount(this.balance);

   deposit(double depositAmount) {
      return depositAmount<=0?"please , add an amount greater than 0": balance += depositAmount;
  }

   withdraw(double withdrawAmount) {
      return withdrawAmount<=0?"please , add an amount graeter than 0":withdrawAmount>balance?throw NotEnoughBalance():balance -= withdrawAmount;

  }
}


void main(List<String> arguments) {
  //first
  Book book= Book('Computer science','Davil',500);
  String result=book.displayBookInfo();
  print(result);
  //second
  Novel novel=Novel('Flutter', 'jack', 200, 'gene');
  String novelResult=novel.displayBookInfo();
  print(novelResult);
//third
  CIrcle cIrcle=CIrcle(40);
  Rectangle rectangle =Rectangle(30, 50);
 printShapesArea(cIrcle);
 printShapesArea(rectangle);
//fourth
 User user=User('ahmed');
 Product product=Product('clothes');
  printInfo(user);
  printInfo(product);
//fifth
  try{
    BankAccount account = BankAccount(1000);
    print(account.deposit(500));
    print( account.withdraw(200));
    print( account.withdraw(2000));
  }
  on NotEnoughBalance catch(e){
    print(e.warningMessage());

  }

}
