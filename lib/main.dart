import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:yemek_uygulamasi/providers/card_provider.dart';
import 'package:yemek_uygulamasi/root_page.dart';

import 'home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
    designSize: Size(392.72727272727275,826.9090909090909),
  );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(_) => CartProvider())
      ],
      child: MaterialApp(
        title: 'Yemek Uygulamam',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange
        ),
        home: RootPage(),
      ),
    );
  }
}


