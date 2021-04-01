import 'dart:async';
import 'package:mysql1/mysql1.dart';

class Mysql {
  static String host = '******',
      user = '******',
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