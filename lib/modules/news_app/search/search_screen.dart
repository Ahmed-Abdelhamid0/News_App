import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/layout/news_app/cubit/cubit.dart';
import 'package:untitled1/layout/news_app/cubit/states.dart';
import 'package:untitled1/shared/components/components.dart';
import 'package:untitled1/shared/cubit/cubit.dart';
import 'package:untitled1/shared/cubit/states.dart';

class SearchScreen extends StatelessWidget {

var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
       listener: (context, state) {},
      builder: (context, state)
      {
        var list =NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children:
            [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: searchController,
                  keyboardType: TextInputType.text,
                  onChanged: (value)
                  {
                     NewsCubit.get(context).getSearch(value);
                  },
                  validator: (value)
                  {
                    if(value!.isEmpty)
                    {
                      return 'search must me not empty';

                    }else
                    {
                      return null;

                    }
                  },

                  decoration: InputDecoration(
                    labelText:'Search',
                    border: OutlineInputBorder(),
                    prefixIcon:Icon(
                      Icons.search,
                      color: Colors.black,

                    ),

                  ),
                ),
              ),
              Expanded(child: articleBuilder(list, context,isSearch:true)),
            ],
          ),
        );
      },
    );
  }
}
