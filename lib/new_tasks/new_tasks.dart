import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/shared/components/components.dart';
import 'package:untitled1/shared/cubit/cubit.dart';
import 'package:untitled1/shared/cubit/states.dart';

import '../shared/components/constants.dart';

class newTasks extends StatelessWidget
{

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<AppCupit,AppStates>(
      listener: (context , state){},
      builder: (context , state){

        var tasks = AppCupit.get(context).newtasks;
        return taskBuilder(
          tasks: tasks,
        );
      },
    );
  }
}
