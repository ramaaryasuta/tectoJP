import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../router/app_router.dart';

BuildContext get globalCurrentContext =>
    GetIt.instance<AppRouter>().navigatorKey.currentContext!;
