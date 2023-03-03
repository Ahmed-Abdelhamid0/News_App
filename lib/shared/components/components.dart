import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/modules/news_app/web_view/web_view_screen.dart';
import 'package:untitled1/shared/cubit/cubit.dart';

// Widget defaultButton({
//    double width=double.infinity,
//    Color background=Colors.red,
//   bool isUpperCase=true,
//   double radius=15.0,
//   required Function function,
//   required String text,
// })=> Container(
//   width: width,
//   height: 40.0,
//   child: MaterialButton(
//     onPressed: ()
//     {
//       function();
//     },
//     child: Text(
//       isUpperCase ? text.toUpperCase(): text,
//       style: TextStyle(
//         color: Colors.white,
//
//       ),
//     ),
//   ),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(radius),
//         color: background,
//       ),
// );
//
//
// //TO-DO
//
// Widget buildTaskItem(Map model,context)=> Dismissible(
//   key: Key(model['id'].toString()),
//   child: Padding(
//
//     padding: const EdgeInsets.all(20.0),
//
//     child: Row(
//
//       children: [
//
//         CircleAvatar(
//
//           radius: 40.0,
//
//           backgroundColor: Colors.purple[800],
//
//           child: Text(
//
//               '${model['time']}',
//
//             style: TextStyle(
//
//             color: Colors.white,
//
//           ),
//
//           ),
//
//         ),
//
//         SizedBox(width:20.0),
//
//         Expanded(
//
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//
//             mainAxisSize: MainAxisSize.min,
//
//             children: [
//
//               Text(
//
//                 '${model['title']}',
//
//                 style: TextStyle(
//
//                   fontWeight: FontWeight.bold,
//
//                   fontSize: 18.0,
//
//                 ),
//
//               ),
//
//               Text(
//
//                 '${model['date']}',
//
//                 style: TextStyle(
//
//                   color: Colors.grey[400],
//
//                 ),
//
//               ),
//
//             ],
//
//           ),
//
//         ),
//
//         SizedBox(width:20.0),
//
//         IconButton(
//
//           onPressed: ()
//
//           {
//
//              AppCupit.get(context).updateData
//
//                (status: 'done', id: model['id']);
//
//           },
//
//           icon: Icon(
//
//               Icons.check_box,
//                size: 35.0,
//             color: Colors.purple[800],
//
//           ),
//
//         ),
//
//         IconButton(
//
//           onPressed: ()
//
//           {
//
//             AppCupit.get(context).updateData
//
//               (status: 'archived', id: model['id']);
//
//           },
//
//           icon: Icon(
//
//               Icons.archive,
//               size: 35.0,
//             color: Colors.purple[800],
//
//           ),
//
//         ),
//
//       ],
//
//     ),
//
//   ),
//   onDismissed: (direction)
//   {
//     AppCupit.get(context).deleteData(id: model['id'],);
//   }
// );
//
// Widget taskBuilder({
//   required List<Map>tasks,
// })=>ConditionalBuilder(
//   condition: tasks.length>0,
//   builder: (context)=>ListView.separated(
//     itemBuilder: (context,index)=>buildTaskItem(tasks[index],context),
//     separatorBuilder: (context,index)=>Padding(
//       padding: const EdgeInsetsDirectional.only(
//         start: 25.0,
//       ),
//       child: Container(
//         width: double.infinity,
//         height: 1.0,
//         color: Colors.grey[300],
//       ),
//     ),
//     itemCount: tasks.length,
//   ),
//   fallback:(context)=> Center(
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Icon(
//           Icons.menu,
//           size: 90.0,
//           color: Colors.grey,
//         ),
//         Text(
//           'No Tasks Here Yet',
//           style: TextStyle(
//             fontSize: 16.0,
//             fontWeight: FontWeight.bold,
//             color: Colors.grey,
//           ),
//         ),
//       ],
//     ),
//   ),
// );


//------------------------------------------------------------------------------

//API News App

Widget buildArticleItem(article,context)=>InkWell(
  onTap: ()
  {
    navigateTo(context, WebViewScreen(url: article['url']));
  },
  child:   Padding(
  
    padding: const EdgeInsets.all(20.0),
  
    child: Row(
  
      children:
  
      [
  
        Container(
  
          width: 120.0,
  
          height: 120.0,
  
          decoration: BoxDecoration(
  
            borderRadius: BorderRadius.circular(10.0,),
  
            image: DecorationImage(
  
              image: NetworkImage('${article['urlToImage']}'),
  
              fit: BoxFit.cover,
  
            ),
  
          ),
  
        ),
  
        SizedBox(width: 20.0,),
  
        Expanded(
  
          child: Container(
  
            height: 120.0,
  
            child: Column(
  
              crossAxisAlignment: CrossAxisAlignment.start,
  
              children: [
  
                Expanded(
  
                  child: Text(
  
                    '${article['title']}',
  
                    style:Theme.of(context).textTheme.bodyText1,
  
                    maxLines: 4,
  
                    overflow: TextOverflow.ellipsis,
  
                  ),
  
                ),
  
                Text(
  
                  '${article['publishedAt']}',
  
                  style: TextStyle(
  
                    color: Colors.grey,
  
                  ),
  
                ),
  
              ],
  
            ),
  
          ),
  
        ),
  
      ],
  
    ),
  
  ),
);

Widget myDivider()=>Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 25.0,
  ),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);

Widget articleBuilder(list,context,{isSearch=false})=>ConditionalBuilder(
  condition: list.length>0,
  builder: (context)=> ListView.separated(
    physics: BouncingScrollPhysics(),
    itemBuilder:(context,index)=> buildArticleItem(list[index],context),
    separatorBuilder: (context,index)=> myDivider(),
    itemCount: 10,),
     fallback: (context)=>isSearch? Container() : Center(child: CircularProgressIndicator()),
);

void navigateTo(context,widget)=>Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context)=> widget,
  ),
);

void navigateAndFinich(context,widget)=>Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
    builder: (context)=> widget,
  ),
    (route)
  {
      return false;
    },

);