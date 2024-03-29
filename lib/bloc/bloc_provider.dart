import 'package:dostx/bloc/mainbloc.dart';
import 'package:flutter/material.dart';

class BlocProvider extends InheritedWidget {
  final mainBloc bloc;

  const BlocProvider(this.bloc, {child, key}) : super(child: child, key: key);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }

  static BlocProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<BlocProvider>();
  }
}