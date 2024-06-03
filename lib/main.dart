import 'package:dostx/palette.dart';
import 'package:dostx/pages/sign_in.dart';
import 'package:dostx/pages/sign_up_first_page.dart';
import 'package:flutter/material.dart';
import 'package:dostx/bloc/bloc_provider.dart';
import 'package:dostx/bloc/mainbloc.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'navigator.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('TokenBox');
  await Hive.openBox('ProfileBox');
  await Hive.openBox('EmotionalWheelBox');
  await Hive.openBox('ZaritBox');
  await Hive.openBox('FamilyBurdenBox');
  await Hive.openBox('ClientProfileBox');
  await Hive.openBox('CostEffBox');
  await Hive.openBox('CopeStrategyStateManagementBox');

  mainBloc bloc = mainBloc();
    runApp(
      MyApp(bloc),
    );
}

class MyApp extends StatelessWidget {

  final mainBloc bloc;
  const MyApp(this.bloc, {Key? key}):super(key: key);
  @override

  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    var tokenBox = Hive.box('TokenBox');
    var accessToken = tokenBox.get('access_token')??'no';
    var profileAvailable = tokenBox.get('profile_available')??false;
    bool loggedIn = accessToken != 'no'?(profileAvailable?true:false):false;
    return BlocProvider(bloc,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: loggedIn? const NavigationController(): const SignIn(),
        theme: ThemeData(
          textSelectionTheme: const TextSelectionThemeData(
            selectionHandleColor: ColorOptions.lightblue,
          ),
        ),
      ),
    );
  }
}
