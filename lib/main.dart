import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/models/zapat_model.dart';

import 'package:shoes_app/pages/index.dart';

void main() {
  return runApp(
    MultiProvider(
      child: const MyApp(),
      providers: [
        ChangeNotifierProvider(
          create: (_) => ZapatoModel(),
        )
      ],
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ZapatoPage(),
      title: 'Material App',
    );
  }
}
