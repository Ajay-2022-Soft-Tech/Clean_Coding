import 'package:clean_coding/config/routes/routes.dart';
import 'package:clean_coding/config/routes/routes_name.dart';
import 'package:clean_coding/repository/auth/auth_http_api_repository.dart';
import 'package:clean_coding/repository/auth/auth_mock_api_repository.dart';
import 'package:clean_coding/repository/auth/login_repository.dart';
import 'package:clean_coding/repository/movies_api/movies_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
void main() {

  servicesLocator();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RoutesName.splashScreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}


void servicesLocator() {
  getIt.registerLazySingleton<LoginRepository>(() => LoginMockApiRepository());
  getIt.registerLazySingleton<MoviesApiRepository>(() => MoviesHttpApiRepository());

}