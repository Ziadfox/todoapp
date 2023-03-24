import 'package:flutter/material.dart';
//Button*************************************************************************************************
Widget defaultbutton({
required Color color,
required Function() onPressed,
required Widget widgetonbutton,
BorderRadiusGeometry?borderRadius,


})

=>Container(
width:double.infinity,
decoration: BoxDecoration(
    color:color,
    borderRadius:borderRadius,
     ),
       child:
                     MaterialButton(
                      onPressed:onPressed,
                      child:widgetonbutton,
                      ),
                      
                      );
//form**************************************************************************************
Widget myTextFormFiled(
  {
    bool obscureText =false,
    required TextEditingController controller,
    required String labelText,
    required IconData prefixIcon,
    Widget? suffixIcon,
    Function? suffixFunction,
   String? Function(String?)?validator,
    required TextInputType keyboardType,
    Function()?onTap,
    Function(String)?onChanged,
    Function(String)?onFieldSubmitted,
   
  }
)
{return TextFormField(
                        keyboardType:keyboardType ,
                        obscureText:obscureText,
                        controller: controller,
                        
                        decoration:InputDecoration(
                          labelText:labelText,
                          border: OutlineInputBorder(),
                          prefixIcon:Icon(prefixIcon),
                          suffixIcon:suffixIcon,
                          
                               
                          //when focus in label
                          focusedBorder: OutlineInputBorder(
                            borderSide:BorderSide(
                              color: Colors.deepPurple,
                              width:5,
                            ),
                            borderRadius:BorderRadius.circular(20),
                          ),
                          //when not focus in label
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color:Colors.deepPurple,
                              width:2,
                              ),
                            borderRadius:BorderRadius.circular(10),
                          ),
                          
                        ),
                        onTap: onTap,
                         onChanged:onChanged,
                        onFieldSubmitted:onFieldSubmitted,
                        validator:validator ,
                      );
}
//==========================================================================
Widget TaskItem(Map model)=>Padding(
           padding: const EdgeInsets.all(20),
           child: Row(
             children: [
               CircleAvatar(radius:40,
               child: Text("${model['time']}"),),
               const SizedBox(width: 20),
               Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  Text(
                    "${model['title']}",
                    style:TextStyle(
                      
                      fontSize:20,
                      fontWeight: FontWeight.bold
                    ),
                  
                  ),
                  Text("${model['date']}"
                  ,style:TextStyle(
                      color:Colors.grey,
                      
                    ),)
                ],
               )
              
                
             ],
           ),
         );