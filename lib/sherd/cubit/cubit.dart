import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytodoapp/sherd/cubit/status.dart';
import 'package:sqflite/sqflite.dart';

import '../../moduls/archived.dart';
import '../../moduls/done.dart';
import '../../moduls/tasks.dart';

class Appcubit extends Cubit<AppStatus>{
Appcubit() :super (AppInitialState());
static Appcubit get(context)=>BlocProvider.of(context);
int currentIndex=0;
bool isBottomsheet=false;
IconData bottomIcon=Icons.edit;
List<Map>tasks=[];
List <Widget>padage=[
Tasks(),
Done(),
Archived(),
];

List <String>titles=[
  'Tasks',
  'Done',
 'Archived',
];
////////////////////////////////////////////////////////////////////////
void changeBottomSheetShow(
  {@required bool? isShow,
  @required IconData? icon,
  })
{
  isBottomsheet=isShow!;
   bottomIcon=icon!;
   emit(AppChangeBottomShetShowState());
}
void changeIndex(int index){
  currentIndex=index;
  emit(AppChangeBottomNavBarState()) ;
}
Database? database;

void createDataBase ()
{
openDatabase(
  'todo.db',
   version:1,
  onCreate:(database,version){
    print("data created");
    database.execute(
      'create table tasks(id INTEGER PRIMRY KEY,title TEXT ,date TEXT,time TEXT,status TEXT  )'
    ).then(
      (value) {
        print("table created");
      }
      ).catchError((error){
        print('we found Error ${error.toString()}');
      });
      
  },
  onOpen: (database){
    getDataFromDatabase(database).then((value) {
     
        tasks=value;
      print(tasks);
      emit(AppGetDatabaseState());
      
    });
    print("data Opened");
  } 
 ).then((value)  {
  database=value;
  emit(AppCreateDatabaseState()) ; 
 });

}
 insertDatabase({
  @required String? title,
  @required String? time,
  @required String? date,
})async{
   await database!.transaction((txn)
    async {
    txn.rawInsert('INSERT INTO tasks(title,time,date,status) VALUES("$title","$time","$date","new") ')

      .then((value) {
        print("$value is inserted successfully");
        emit(AppInsertDatabaseState());
         getDataFromDatabase(database).then((value) {
     
        tasks=value;
      print(tasks);
      emit(AppGetDatabaseState());
      
    });

      })
      .catchError((Error){
        print("hay bro its Error here ${Error.toString()}");
        });

    
  });
}
Future <List<Map>>getDataFromDatabase(database)async{
 return await database!.rawQuery('SELECT * FROM tasks');
 
}

}