import 'package:flutter/material.dart';
import 'package:news_app/screens/web_view.dart';

Widget dividerLine() => Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Divider(
        height: 3,
        thickness: 2,
        color: Colors.grey[300],
      ),
    );

Widget defaultTextFormField({
  required TextEditingController controller,
  required FormFieldValidator<String>? validator,
  required TextInputType textInput,
  required onChange,
  required String text,
  required prefix,
}) =>
    TextFormField(
      validator: validator,
      cursorRadius: const Radius.circular(25),
      cursorColor: Colors.black,
      onChanged: onChange,
      controller: controller,
      keyboardType: textInput,
      decoration: InputDecoration(
        labelText: text,
        labelStyle: const TextStyle(
          color: Colors.black,
          fontSize: 14,
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(
            25,
          )),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(
            25,
          )),
          borderSide: BorderSide(
            style: BorderStyle.solid,
            color: Colors.black,
          ),
        ),
        prefixIcon: Icon(
          prefix,
          color: Colors.grey,
          size: 20,
        ),
      ),
    );

Widget defaultSearchTextFormField({
  required TextEditingController controller,
  required FormFieldValidator<String>? validator,
  required onChange,
}) =>
    TextFormField(
      validator: validator,
      cursorRadius: const Radius.circular(20),
      cursorColor: Colors.black,
      onChanged: onChange,
      controller: controller,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[200],
        hintText: 'search',
        hintStyle: const TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
        // border: InputBorder.none,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(
            10,
          )),
          borderSide: BorderSide(
            style: BorderStyle.solid,
            color: Colors.black12,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(
            10,
          )),
          borderSide: BorderSide(
            style: BorderStyle.solid,
            color: Colors.black12,
          ),
        ),
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.black,
          size: 18,
        ),
      ),
    );
Widget buildArticleItem(articles, context) => InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => WebViewScreen(
                articles['url'],
              ),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage('${articles['urlToImage']}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: SizedBox(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${articles['title']}',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    Text(
                      '${articles['publishedAt']}',
                      style: const TextStyle(
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

void navigateTo(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (BuildContext context) => widget(),
    ));

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => widget(),
      ),
      (Route<dynamic> route) => false,
    );
