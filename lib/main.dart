import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor:const Color.fromRGBO(245, 254, 227, 50),
        useMaterial3: true,
      ),
      home: const SubjectListScreen(),
    );
  }
}

class SubjectListScreen extends StatefulWidget {
  const SubjectListScreen({super.key});

  @override
  State<SubjectListScreen> createState() => _SubjectListScreenState();
}

class _SubjectListScreenState extends State<SubjectListScreen> {
  List<String> subjects=[];

  void addSubject(){
    showDialog(context: context, builder: (BuildContext context){
      String newSubject="";
      return AlertDialog(
        title:const Text("Add new subject"),
        content: TextField(
          onChanged: (value){
            newSubject=value;
          },
        ),
        actions: [
          ElevatedButton(
              onPressed: (){
                setState(() {
                  if(newSubject.isNotEmpty)
                  {
                    subjects.add(newSubject);
                  }
                  Navigator.pop(context);
                });
              },
              child: const Text("Add"))
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title:const Text("201009"),
         backgroundColor: Colors.lightGreen,
      ),
      body: ListView.builder(
        itemCount: subjects.length,
          itemBuilder: (context,index){
          return Card(
            child: ListTile(
              title: Text(subjects[index],
                style:const TextStyle(fontSize: 17),),
              trailing: IconButton(
                  icon:const Icon(Icons.delete_rounded),onPressed: (){
                    setState(() {
                      subjects.removeAt(index);
                    });
              },
              ),
            ),
          );
          }),
      floatingActionButton: FloatingActionButton( onPressed: addSubject,
        backgroundColor: Colors.lightGreenAccent,
        child:const Icon(Icons.add_box_outlined),

      ),
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



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: const Text("201009"),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Text(
              '',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
