import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => FirstScreen(),
        '/secondScreen': (context) => SecondScreen(),
        '/secondScreenWithData': (context) => SecondScreenWithData(
            ModalRoute.of(context)?.settings.arguments as String),
        '/returnDataScreen': (context) => ReturnDataScreen(),
        '/replacementScreen': (context) => ReplacementScreen(),
        '/anotherScreen': (context) => AnotherScreen(),
      },
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation & Routing'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Go To Second Screen'),
              onPressed: () {
                Navigator.pushNamed(context, '/secondScreen');
              },
            ),
            ElevatedButton(
              child: Text('Navigation With Data'),
              onPressed: () {
                Navigator.pushNamed(context, '/secondScreenWithData', arguments: 'Hello from first screen');
              },
            ),
            ElevatedButton(
              child: Text('Return Data From Another Screen'),
              onPressed: () async {
                final result = await Navigator.pushNamed(context, '/returnDataScreen');
                SnackBar snackBar = SnackBar(content: Text('$result'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
            ElevatedButton(
              child: Text('Replace Screen'),
              onPressed: () {
                Navigator.pushNamed(context, '/replacementScreen');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Back'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

class SecondScreenWithData extends StatelessWidget {
  final String data;

  const SecondScreenWithData(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(data),
          ElevatedButton(
            child: Text('Back'),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      )),
    );
  }
}

class ReturnDataScreen extends StatefulWidget {
  @override
  _ReturnDataScreenState createState() => _ReturnDataScreenState();
}

class _ReturnDataScreenState extends State<ReturnDataScreen> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(labelText: 'Enter Your Name'),
              ),
            ),
            ElevatedButton(
              child: Text('Send'),
              onPressed: () {
                Navigator.pop(context, _textController.text);
              },
            )
          ],
        ),
      ),
    );

    @override
    void dispose() {
      _textController.dispose();
      super.dispose();
    }
  }
}

class ReplacementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Open Another Screen'),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/anotherScreen');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AnotherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Back to First Screen'),
            ElevatedButton(
              child: Text('Back'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
