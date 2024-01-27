import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

import '../../models/cart_model.dart';

class DBHelper {
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDatabase();
    return _database;
  }

  initDatabase() async {
    io.Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'cart.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE cart(id INTEGER PRIMARY KEY AUTOINCREMENT, productId VARCHAR, productName TEXT, size TEXT, initialPrice REAL, productPrice REAL, quantity INTEGER, image TEXT)');
  }

  // _onUpgrade(Database db, int oldVersion, int newVersion) async {
  //   if (oldVersion < 5) {
  //     // Xóa bảng cũ nếu có
  //     await db.execute('DROP TABLE IF EXISTS cart');

  //     await db.execute(
  //         'CREATE TABLE cart(id INTEGER PRIMARY KEY AUTOINCREMENT, productId VARCHAR, productName TEXT, size TEXT, initialPrice REAL, productPrice REAL, quantity INTEGER, image TEXT)');
  //     print('Database Created');
  //     // Các phiên bản khác nếu có
  //   }
  // }

  Future<CartItem> insert(CartItem cart) async {
    var dbClient = await database;
    await dbClient!.insert('cart', cart.toMap());
    return cart;
  }

  Future<List<CartItem>> getCartList() async {
    var dbClient = await database;
    final List<Map<String, Object?>> queryResult =
        await dbClient!.query('cart');
    return queryResult.map((result) => CartItem.fromMap(result)).toList();
  }

  Future<int> deleteCartItem(int id) async {
    var dbClient = await database;
    return await dbClient!.delete('cart', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateQuantity(CartItem cart) async {
    var dbClient = await database;
    return await dbClient!.update('cart', cart.quantityMap(),
        where: "productId = ? AND size = ?",
        whereArgs: [cart.productId, cart.size]);
  }

  Future<List<CartItem>> getCartId(String productId, String size) async {
    var dbClient = await database;
    final List<Map<String, Object?>> queryIdResult = await dbClient!.query(
        'cart',
        where: 'productId = ? AND size = ?',
        whereArgs: [productId, size]);
    return queryIdResult.map((e) => CartItem.fromMap(e)).toList();
  }
}
