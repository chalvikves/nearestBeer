import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nearest_beer/core/constants/constants.dart';
import 'package:nearest_beer/features/bar/presentation/providers/bar_provider.dart';
import 'package:nearest_beer/features/beer/presentation/providers/beer_button_provider.dart';
import 'package:nearest_beer/features/settings/presentation/providers/settings_provider.dart';
import 'package:provider/provider.dart';

import 'features/skeleton/providers/selected_page_provider.dart';
import 'features/skeleton/skeleton.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SelectedPageProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BeerButtonProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SettingsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BarProvider(),
        ),
      ],
      child: MaterialApp(
        home: const Home(),
        debugShowCheckedModeBanner: false,
        title: 'Nearest Beer',
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              color: Colors.black87,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          iconTheme: const IconThemeData(
            color: Colors.black87,
          ),
          primaryColorDark: kPrimaryColorDark,
          primaryColorLight: kPrimaryColorLight,
          scaffoldBackgroundColor: kPrimaryColorLight,
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();

    Provider.of<BarProvider>(context, listen: false)
        .eitherFailureOrBarEntity(id: 1);
  }

  @override
  Widget build(BuildContext context) {
    return const Skeleton();
  }
}
