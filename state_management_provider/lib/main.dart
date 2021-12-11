import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DoneModuleProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ModulePage(),
      ),
    );
  }
}

class ModulePage extends StatelessWidget {
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
                  builder: (context) => DoneModuleList(),
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

class ModuleList extends StatelessWidget {

  final List<String> doneModuleList;

  ModuleList({required this.doneModuleList});

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

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _moduleList.length,
        itemBuilder: (context, index) {
          return Consumer<DoneModuleProvider>(
              builder: (context, DoneModuleProvider data, widget) {
                return ModuleTile(
                  moduleName: _moduleList[index],
                  isDone: data.doneModuleList.contains(_moduleList[index]),
                  onClick: () {
                    data.complete(_moduleList[index]);
                  },
                );
              }
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

  @override
  Widget build(BuildContext context) {

    final doneModuleList = Provider.of<DoneModuleProvider>(context, listen: false).doneModuleList;

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

class DoneModuleProvider extends ChangeNotifier {
  final List<String> _doneModuleList = [];

  List<String> get doneModuleList => _doneModuleList;

  void complete(String moduleName) {
    _doneModuleList.add(moduleName);
    notifyListeners();
  }
}