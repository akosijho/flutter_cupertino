import 'package:flutter/material.dart';

class User{
  String name;
  Color color; //Represents pofile color

  User(this.name, this.color);
}

List<User> users = <User>[
   User('Jack', Colors.greenAccent),
   User('Lucy', Colors.green),
   User('Luna', Colors.black26),
   User('Oliver', Colors.blue),
   User('Lily', Colors.amberAccent),
   User('Milo', Colors.purple),
   User('Max', Colors.pink),
   User('Kitty', Colors.yellowAccent),
   User('Simba', Colors.red),
   User('Zoe', Colors.blueAccent),
   User('Jasper', Colors.deepOrange),
   User('Stella', Colors.cyan),
   User('Lola', Colors.lightBlue),
   User('Halsey', Colors.deepPurpleAccent),
   User('Taylor', Colors.indigoAccent),
];