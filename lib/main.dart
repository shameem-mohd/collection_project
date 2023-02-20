import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/repositary/api/CreateCustomer/CreateCustomerApi.dart';
import 'package:project/repositary/bloc/CreateCustomer/create_customer_bloc.dart';
import 'package:project/repositary/bloc/Id/id_bloc.dart';
import 'package:project/ui/home/HomePage.dart';

CreateCustomerApi createCustomerApi = CreateCustomerApi();
void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => CreateCustomerBloc(createCustomerApi)),
    BlocProvider(create: (context) => IdBloc()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
