import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytodoapp/sherd/components/components.dart';
import 'package:mytodoapp/sherd/cubit/cubit.dart';

import '../sherd/components/constants.dart';


class Tasks extends StatelessWidget {
  const Tasks({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(itemBuilder:(context,index)=>TaskItem(BlocProvider.of<Appcubit>(context).tasks[index]) , 
    separatorBuilder: (context,index)=>Container(
      height:1,
      width:double.infinity,
      color: Colors.amber,
    ),
     itemCount:BlocProvider.of<Appcubit>(context).tasks.length );
  }
}