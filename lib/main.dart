import 'package:doctor_reservation/core/routing/app_router.dart';
import 'package:flutter/material.dart';

import 'core/di/dependency_injection.dart';
import 'doc_app.dart';

void main() {
  setUpGetIt();
  runApp(DocApp(appRouter: AppRouter()));
}
