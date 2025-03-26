import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class DatabaseInclude extends StatefulWidget {
  const DatabaseInclude({Key? key}) : super(key: key);

  @override
  State<DatabaseInclude> createState() => _DatabaseIncludeState();
}

class _DatabaseIncludeState extends State<DatabaseInclude> {
  TextEditingController? _textEditingController = TextEditingController();
  List decodeApi = [];
  Icon customIcon = const Icon(Icons.search);
  List decodeApiOnSearch = [];

  getData() async {
    final link = Uri.parse('https://626f-2001-44c8-42cc-1404-a164-d464-8b38-ce75.ap.ngrok.io/testcon/api-service.php');
    http.Response response = await http.get(link);

    if (response.statusCode == 200) {
      setState(() {
        decodeApi = jsonDecode(response.body);
      });
      print(response.body);
    } else {
      print('failed');
    }

    print(response);
    print(decodeApi);
    // return decodeApi;
  }

  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Container(
            decoration: BoxDecoration(
                color: Colors.blue.shade200,
                borderRadius: BorderRadius.circular(30)),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  decodeApiOnSearch =
                      decodeApi.where((element) => element == value).toList();
                });
              },
              controller: _textEditingController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  errorBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: EdgeInsets.all(15),
                  hintText: 'Search'),
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  decodeApiOnSearch.clear();
                  _textEditingController!.clear();
                  setState(() {
                    _textEditingController!.text = '';
                  });
                },
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                ))
          ],
        ),
        body: _textEditingController!.text.isNotEmpty &&
                decodeApiOnSearch.isEmpty
            ? Column(
                children: [
                  Icon(
                    Icons.search_off,
                    size: 100,
                  ),
                  Text("No results found",
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
                ],
              )
            : ListView.builder(
                itemCount: _textEditingController!.text.isNotEmpty
                    ? decodeApiOnSearch.length
                    : decodeApi.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: ListTile(
                        leading: Text("${decodeApi[index]['bar_id']}"),
                        title:
                            Text("Product : ${decodeApi[index]['pro_name']}"),
                        subtitle:
                            Text("Amount : ${decodeApi[index]['pro_num']} "
                                "\nPrice : ${decodeApi[index]['pro_priceA']} "
                                "\nCategory : ${decodeApi[index]['pro_type']}"),
                      ),
                    ),
                  );
                })));
  }
}

class Searching extends StatefulWidget {
  const Searching({Key? key}) : super(key: key);

  @override
  State<Searching> createState() => _SearchingState();
}

class _SearchingState extends State<Searching> {
  TextEditingController? _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
