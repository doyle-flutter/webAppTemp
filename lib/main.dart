import 'package:exam/_1pages/detail/material/detailPage.dart';
import 'package:exam/_1pages/main/cupertino/mainPage.dart';
import 'package:exam/providers/mainProvider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';

import '_1pages/main/material/mainPage.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MultiProvider(
    providers: [
      ChangeNotifierProvider<MainProvider>(create: (BuildContext context)=> MainProvider())
    ],
    child: this._appSystem()
  );

  Widget _appSystem(){
    if(kIsWeb){
      return MaterialApp(
        initialRoute: "/",
        onGenerateRoute: (RouteSettings reqPath){
          if(reqPath.name == "/detail") return MaterialPageRoute(
              settings: RouteSettings(name: '/detail'),
              builder: (BuildContext context) => DetailPageMa()
          );
          return MaterialPageRoute(
            settings: RouteSettings(name: '/'),
            builder: (BuildContext context) => MainPageMa()
          );
        },
      );
    }
    else{
      try{
        return Platform.isAndroid
          ? MaterialApp(home: MainPageMa(),)
          : CupertinoApp(home: MainPageCu(),);
      }catch(e){
        return MaterialApp(home: Scaffold(body: Center(child: Text("지원하는 기기가 아닙니다"),),),);
      }
    }
  }
}
