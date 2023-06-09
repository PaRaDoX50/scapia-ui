import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_scapia/blocs/cancellation_detail_bloc/cancellation_detail_bloc.dart';
import 'package:ui_scapia/blocs/journey_detail/journey_detail_bloc.dart';
import 'package:ui_scapia/data/api/api_methods.dart';
import 'package:ui_scapia/data/api/api_methods_impl.dart';
import 'package:ui_scapia/data/repositories/journey_repository.dart';
import 'package:ui_scapia/data/repositories/repository.dart';
import 'package:ui_scapia/ui/screens/cancellation_window/cancellation_window.dart';
import 'package:ui_scapia/ui/screens/home/home_screen.dart';
import 'package:ui_scapia/ui/screens/journey/journey_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final Repository repository;

  @override
  void initState() {
    super.initState();
    final ApiMethods apiMethods = ApiMethodsImpl();
    repository = JourneyRepository(apiMethods: apiMethods);
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => repository,
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
              primarySwatch: Colors.blue,
              fontFamily: 'visby',
              primaryColor: const Color(0xffca3b04).withOpacity(.9)),
          home: const HomeScreen(),
          onGenerateRoute: (settings) {
            if (settings.name == CancellationWindowScreen.routeName) {
              return MaterialPageRoute(builder: (context) {
                return BlocProvider<CancellationDetailBloc>(
                  create: (context) =>
                      CancellationDetailBloc(repository: repository)
                        ..add(CancellationDetailFetchEvent()),
                  child: const CancellationWindowScreen(),
                );
              });
            } else if (settings.name == JourneyScreen.routeName) {
              return MaterialPageRoute(builder: (context) {
                return BlocProvider<JourneyDetailBloc>(
                  create: (context) => JourneyDetailBloc(repository: repository)
                    ..add(JourneyDetailFetchEvent()),
                  child: const JourneyScreen(),
                );
              });
            }

            assert(true, 'Need to implement ${settings.name}');
            return null;
          }),
    );
  }
}
