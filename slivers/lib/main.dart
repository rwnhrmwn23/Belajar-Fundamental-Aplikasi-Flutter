import 'package:flutter/material.dart';
import 'package:slivers/strings.dart';

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
      ),
      home: PixelPage(),
    );
  }
}

class PixelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, isScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'assets/pixel_google.jpg',
                  fit: BoxFit.fitWidth,
                ),
                title: Text('Google Pixel'),
                titlePadding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
              ),
            )
          ];
        },
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        r'$375',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Container(
                        color: Colors.black,
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(
                              Icons.collections,
                              color: Colors.white,
                            ),
                            Text(
                              '6 Photos',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Stok hanya 5 buah',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  const SizedBox(height: 8),
                  const Text(content_text),
                  const SizedBox(height: 8),
                  Text(
                    'Spesifikasi',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  const SizedBox(height: 8),
                  Table(
                    columnWidths: const {1: FractionColumnWidth(0.7)},
                    children: const [
                      TableRow(
                        children: [
                          Text('Display'),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 4),
                            child: Text(content_specs_display),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Text('Size'),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 4),
                            child: Text(content_specs_size),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Text('Battery'),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 4),
                            child: Text(content_specs_battery),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Dijual oleh',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/photo_2.jpg'),
                          radius: 24,
                        ),
                      ),
                      Text('Narendra Wicaksono'),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: const Text('Beli'),
                      style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColor,
                        onPrimary: Colors.white,
                        shape: const BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Added To Cart'),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
