import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/cubit.dart';
import 'package:news_app/bloc/states.dart';
import 'package:news_app/shared/components.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: defaultTextFormField(
                    controller: controller,
                    prefix: Icons.search,
                    text: 'Search',
                    textInput: TextInputType.text,
                    onChange: (value) {
                      NewsCubit.get(context).getSearch(value);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        print('search must not be empty');
                      }
                      return null;
                    },
                  ),
                ),
                Expanded(
                  child: ConditionalBuilder(
                    condition: NewsCubit.get(context).search.isNotEmpty,
                    builder: (BuildContext context) => ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => buildArticleItem(
                            NewsCubit.get(context).search[index], context),
                        separatorBuilder: (context, index) => dividerLine(),
                        itemCount: 10),
                    fallback: (BuildContext context) =>
                        const Center(child: CircularProgressIndicator()),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
