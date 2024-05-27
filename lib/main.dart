import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unasp_fome_app/model/cart_model.dart';
import 'package:unasp_fome_app/view/home_page.dart';
import 'package:unasp_fome_app/view/initial_page.dart';
import 'package:unasp_fome_app/view/register_page.dart';
import 'app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}