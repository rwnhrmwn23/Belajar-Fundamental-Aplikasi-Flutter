import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const ModulePage(),
    );
  }
}

class ModulePage extends StatefulWidget {
  const ModulePage({Key? key}) : super(key: key);

  @override
  State<ModulePage> createState() => _ModulePageState();
}

class _ModulePageState extends State<ModulePage> {

  final List<String> doneModuleList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Memulai Pemograman Dengan Dart'),
        actions: [
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DoneModuleList(doneModuleList: doneModuleList),
                ),
              );
            },
          ),
        ],
      ),
      body: ModuleList(doneModuleList: doneModuleList),
    );
  }
}

class ModuleList extends StatefulWidget {

  final List<String> doneModuleList;
  ModuleList({required this.doneModuleList});

  @override
  State<ModuleList> createState() => _ModuleListState();
}

class _ModuleListState extends State<ModuleList> {
  final List<String> _moduleList = [
    'Modul 1 - Pengenalan Dart',
    'Modul 2 - Memulai Pemrograman dengan Dart',
    'Modul 3 - Dart Fundamental',
    'Modul 4 - Control Flow',
    'Modul 5 - Collections',
    'Modul 6 - Object Oriented Programming',
    'Modul 7 - Functional Styles',
    'Modul 8 - Dart Type System',
    'Modul 9 - Dart Futures',
    'Modul 10 - Effective Dart',
  ];

  final List<String> doneModuleList = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _moduleList.length,
        itemBuilder: (context, index) {
          return ModuleTile(
            moduleName: _moduleList[index],
            isDone: widget.doneModuleList.contains(_moduleList[index]),
            onClick: () {
              setState(() {
                widget.doneModuleList.add(_moduleList[index]);
              });
            },
          );
        }
    );
  }
}

class ModuleTile extends StatelessWidget {

  final String moduleName;
  final bool isDone;
  final Function() onClick;

  ModuleTile({
    required this.moduleName,
    required this.isDone,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(moduleName),
      trailing: isDone
          ? const Icon(Icons.done)
          : ElevatedButton(
            child: const Text('Button'),
            onPressed: onClick,
      ),
    );
  }
}

class DoneModuleList extends StatelessWidget {

  final List<String> doneModuleList;
  DoneModuleList({required this.doneModuleList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Done Module List'),
      ),
      body: ListView.builder(
        itemCount: doneModuleList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(doneModuleList[index]),
          );
        },
      ),
    );
  }
}