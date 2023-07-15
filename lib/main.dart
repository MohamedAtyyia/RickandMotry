import 'package:app_flutter/util/AppRouter.dart';
import 'package:app_flutter/util/Service_locator.dart';
import 'package:flutter/material.dart';

void main() {
  setup();
  runApp(  RickandMotry(appRouter: AppRouter(),));
}
class RickandMotry extends StatelessWidget {
  const RickandMotry({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context){
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute:appRouter.generateRoute ,
    );
  }
}

