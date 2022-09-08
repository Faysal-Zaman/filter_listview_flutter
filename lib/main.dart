import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView Filters',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Filters The List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title = "Faysal Zaman";
  String subTitle = "Flutter Deceloper";

  TextEditingController textEditingController = TextEditingController();

  String search = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 80,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 10,
                  right: 10,
                ),
                child: TextFormField(
                  onChanged: (String value) {
                    setState(() {
                      search = value.toString();
                    });
                  },
                  controller: textEditingController,
                  decoration: InputDecoration(
                    hintText: "Search anything...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 1000,
                padding: const EdgeInsets.only(
                    bottom: 20, top: 20, left: 10, right: 10),
                itemBuilder: (context, index) {
                  late String position = index.toString();
                  if (position.isEmpty) {
                    return Padding(
                      padding: const EdgeInsets.all(5),
                      child: ListTile(
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        leading: CircleAvatar(
                          child: Image.network(
                              'https://scontent.fpew1-1.fna.fbcdn.net/v/t39.30808-1/275550779_1656801371323108_2203754992879039643_n.jpg?stp=dst-jpg_p160x160&_nc_cat=101&ccb=1-7&_nc_sid=7206a8&_nc_eui2=AeGgwjUjO3VC6W_tvMf8kGUHeKixjM4ke6t4qLGMziR7qzCyNlAXwZW0d7Q5LKxoCkAiMsULbnqKWHczr00K9-wG&_nc_ohc=B-aoASG0do8AX-_2aaO&_nc_ht=scontent.fpew1-1.fna&oh=00_AT-rXzxGn5QaYh42uPcW38LrDVFaNYqLlDJ0iwh0tQS_NA&oe=631DE483'),
                        ),
                        title: Text(
                          "$title $index",
                        ),
                        subtitle: Text(subTitle),
                      ),
                    );
                  } else if (position
                      .toLowerCase()
                      .contains(textEditingController.text.toLowerCase())) {
                    return Padding(
                      padding: const EdgeInsets.all(5),
                      child: ListTile(
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        leading: CircleAvatar(
                          child: Image.network(
                              'https://scontent.fpew1-1.fna.fbcdn.net/v/t39.30808-1/275550779_1656801371323108_2203754992879039643_n.jpg?stp=dst-jpg_p160x160&_nc_cat=101&ccb=1-7&_nc_sid=7206a8&_nc_eui2=AeGgwjUjO3VC6W_tvMf8kGUHeKixjM4ke6t4qLGMziR7qzCyNlAXwZW0d7Q5LKxoCkAiMsULbnqKWHczr00K9-wG&_nc_ohc=B-aoASG0do8AX-_2aaO&_nc_ht=scontent.fpew1-1.fna&oh=00_AT-rXzxGn5QaYh42uPcW38LrDVFaNYqLlDJ0iwh0tQS_NA&oe=631DE483'),
                        ),
                        title: Text(
                          "$title $index",
                        ),
                        subtitle: Text(subTitle),
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
