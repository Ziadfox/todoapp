
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytodoapp/sherd/cubit/cubit.dart';
import 'package:mytodoapp/sherd/cubit/status.dart';
import 'package:sqflite/sqflite.dart';

import 'package:intl/intl.dart';


import '../moduls/archived.dart';
import '../moduls/done.dart';
import '../moduls/tasks.dart';
import '../sherd/components/components.dart';
import '../sherd/components/constants.dart';


class home extends StatelessWidget{
//varibels*********************************************************************************************************************************************


var ScaffoldKey=GlobalKey<ScaffoldState>();
var formKey=GlobalKey<FormState>();

var titlecontroller=TextEditingController();
var timecontroller=TextEditingController();
var datecontroller=TextEditingController();


//End varibels*********************************************************************************************************************************************

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>Appcubit()..createDataBase(),
      child:BlocConsumer<Appcubit,AppStatus>(
        listener:(BuildContext context,AppStatus state){
          if(state is AppInsertDatabaseState){
            Navigator.pop(context);
          }
        },
        builder:(BuildContext context,AppStatus state){
          Appcubit cubit=Appcubit.get(context);
        return Scaffold(
        key: ScaffoldKey,
        appBar: AppBar(
          title:Text(cubit.titles[cubit.currentIndex]),
        ),
        body:cubit.padage[cubit.currentIndex],
    //floating button****************************************************************************************************************************  
        floatingActionButton:
        FloatingActionButton
        (
          onPressed:(){
            if (cubit.isBottomsheet) {
              if (formKey.currentState!.validate()){
                cubit.insertDatabase(
                  title:titlecontroller.text ,
                   time: timecontroller.text,
                    date: datecontroller.text);
       
              }
           
            }else{
              ScaffoldKey.currentState?.showBottomSheet((context) =>
              Container(
                padding:EdgeInsets.all(20),
                color: Colors.grey[100],
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize:MainAxisSize.min ,
                    children: [
    //Title form***************************************************************************************************************************                    
                      myTextFormFiled(
                        controller:titlecontroller,
                        keyboardType: TextInputType.text,
                        prefixIcon:Icons.title_rounded,
                        labelText: "Title",
                        validator: (String? value){
                          if(value!.isEmpty){
                            return('Title must not be empty');
                          }
                        }
                         ),
    //End Title form***************************************************************************************************************************                                       
                         SizedBox(height: 20,),
    //Time form***************************************************************************************************************************                    
                         myTextFormFiled(
                        controller:timecontroller,
                        keyboardType: TextInputType.datetime,
                        prefixIcon:Icons.watch_later,
                        labelText: "Time",
                        validator: (String? value){
                          if(value!.isEmpty){
                            return('Time must not be empty');
                          }
                        },
                        onTap: (){
                         
                            
                            showTimePicker(context: context,
                            
                           initialTime:TimeOfDay.now(),).then((value) {
                            timecontroller.text=value!.format(context);
                            print(value.format(context));
                           });
                        
                        }
                         ),
    //End Timeform***************************************************************************************************************************                    
      SizedBox(height: 20,),
     //Date form***************************************************************************************************************************                    
                         myTextFormFiled(
                        controller:datecontroller,
                        keyboardType: TextInputType.datetime,
                        prefixIcon:Icons.calendar_month_rounded,
                        labelText: "Date",
                        validator: (String? value){
                          if(value!.isEmpty){
                            return('Date must not be empty');
                          }
                        },
                        onTap: (){
                          
                           
                            showDatePicker(context: context,
                           initialDate:DateTime.now(),
                            firstDate:DateTime.now() , lastDate:DateTime.parse('2050-12-12'))
                            .then((value) {
                              datecontroller.text=DateFormat.yMMMd().format(value!);
                              
                            });
                      
                        }
                         ),
    //End Date form***************************************************************************************************************************                    
                                                     
                    ],
                  ),
                ),
              )
              ).closed.then((value) {
          cubit.changeBottomSheetShow(isShow: false, icon:Icons.edit);
              });
          cubit.changeBottomSheetShow(isShow: true, icon:Icons.add);
            }
             
          },
          child:Icon(cubit.bottomIcon),
    
        ),
        bottomNavigationBar:BottomNavigationBar(
          type:BottomNavigationBarType.fixed,
          onTap: (index){
           cubit.changeIndex(index);
           
          },
          currentIndex:cubit.currentIndex,
          items:[
            BottomNavigationBarItem(
              icon:Icon(Icons.task),
              label:"Tasks",
              ),
              BottomNavigationBarItem(
                icon:Icon(Icons.check_circle),
                label: "Done"
                ),
              BottomNavigationBarItem(
                icon:Icon(Icons.archive_rounded),
                label: "Archived"
                )
          ]
          ),
        
      );
    
        },
        )
       
    );
  }


}