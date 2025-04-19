import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Trabajadores/providers/dark_mode_provider.dart';
import 'package:Trabajadores/providers/worker_screen_provider.dart';
import 'package:Trabajadores/screens/home_page.dart';

class Pagos extends StatelessWidget {
  const Pagos({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(_)=>WorkerScreenProvider()),
        ChangeNotifierProvider(create: (_)=>darkMode())
      ],
      builder: (context,child){
        return MaterialApp(
        
        debugShowCheckedModeBanner: false,
        theme:(context.watch<darkMode>().is_dark ? ThemeData.dark():ThemeData.light()
        ).copyWith(
          // ignore: deprecated_member_use
          useMaterial3: false,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 111, 9, 121),
          )
        ),
        title: "Pagos",
        home: homepage(),
      );
      },
    );
  }
}