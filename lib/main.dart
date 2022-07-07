import 'package:flutter/material.dart';
import 'package:machine/utils/colors.dart';
import 'package:machine/view/home_screen.dart';

import 'package:provider/provider.dart';
import 'package:machine/provider/image_provider.dart';

import 'di_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppImageProvider>(
            create: (context) => di.sl<AppImageProvider>()
        ),
      ],
      child: MaterialApp(
        title: 'Sample App',
        theme: ThemeData(
          primarySwatch: primaryTheme,
        ),
        home: const HomeScreen(title: 'Home Screen'),
      ),
    );
  }
}

