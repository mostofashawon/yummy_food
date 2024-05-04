
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:yummy_food/module/utill/app_color.dart';

import '../component/custom_snackbar.dart';

class SQLHelper {

  static Future<void> createTable(sql.Database database)async {

    await database.execute(
        """ CREATE TABLE recipe (
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      recipeId INTEGER,
      title TEXT,
      image TEXT
      createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP)"""
    );
  }


  static Future<sql.Database> db()async {
    return sql.openDatabase(
        "recipe_db",
        version: 1,
        onCreate: (sql.Database database,int version) async
        {
          await createTable(database);
        }
    );

  }

  static Future<int> insertRecipe(Map<String, dynamic> recipe) async {
    final db = await SQLHelper.db();
    final id = await db.insert("recipe", recipe,conflictAlgorithm: sql.ConflictAlgorithm.replace);

    if(id != 0){
      showSnackBar("Success", "Recipe has been Saved", AppColors.colorPaste, SnackPosition.BOTTOM);
    }
    return id;
  }

  static Future<List<Map<String,dynamic>>> getRecipe() async {
    final db=await SQLHelper.db();
    return db.query("recipe",orderBy: "id DESC",distinct: true);
  }


}