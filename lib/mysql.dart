import 'dart:async';
import 'package:mysql1/mysql1.dart';

class Mysql {
  static String host = '20.188.112.22',
      user = 'student',
      password = '******',
      db = 'demo_demo';
  static int port = 3306;

  Mysql();

  Future<MySqlConnection> getConnection() async {
    var settings = new ConnectionSettings(
        host: host,
        port: port,
        user: user,
        password: password,
        db: db
    );
    return await MySqlConnection.connect(settings);
  }
}