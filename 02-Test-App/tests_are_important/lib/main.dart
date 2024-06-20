import 'package:flutter/material.dart';
import 'package:tests_are_important/data/person_remote_data_source.dart';
import 'package:tests_are_important/domain/models/person.dart';
import 'package:tests_are_important/repositories/person_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  final PersonRepository personRepository = PersonRepository(
    remoteDataSource: PersonRemoteDataSource(), // Ensure this is properly instantiated
  );

  List<Person> persons = [];
  bool isLoading = true;

  void _incrementCounter() {
    personRepository.getAuthorModels().then(
      (value) {
        setState(
          () {
            persons = value;
            isLoading = false;
          },
        );
      },
    );

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Get Persons'),
            Expanded(
              child: ListView.builder(
                itemCount: persons.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('${persons[index].firstName} ${persons[index].lastName}'),
                    subtitle: Text('Age: ${persons[index].age}'),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Get Data',
        child: const Icon(Icons.add_to_photos_rounded),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
