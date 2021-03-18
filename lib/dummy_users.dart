import 'package:flutter/material.dart';

class User {
  String pID;
  String fullName;
  String phoneNum;

  User({this.pID,this.fullName,this.phoneNum});

  static List<User>getUsers() {
    return <User>[
      User(pID: "P1234",fullName: "Naufal B", phoneNum: "08213214834"),
      User(pID: "P1235",fullName: "Jack Frost", phoneNum: "08217214834"),
      User(pID: "P1236",fullName: "Ali Taher", phoneNum: "08214414834"),
      User(pID: "P1237",fullName: "Jon Snow", phoneNum: "08213214534"),
      User(pID: "P1238",fullName: "Suparman", phoneNum: "08213994834"),
    ];
  }


}