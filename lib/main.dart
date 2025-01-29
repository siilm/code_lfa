// import 'package:behavior_api/behavior_api.dart';
import 'package:behavior_api/behavior_api.dart';
import 'package:code_lfa/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:global_repository/global_repository.dart';
import 'package:settings/settings.dart';
import 'package:code_lfa/terminal_page.dart';
//FIXME: import 'behavior.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized(); // 必须的初始化
  
  // Android 全屏配置
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  
  RuntimeEnvir.initEnvirWithPackageName('com.nightmare.code');
  await initSettingStore(RuntimeEnvir.configPath);

  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
  ));
  initApi('Code FA', Config.versionName);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Code FA',
      theme: ThemeData(
        colorSchemeSeed: Colors.primaries[3],
      ),
      home: const SafeArea(
        top: false,    // 禁用顶部安全区
        bottom: false, // 禁用底部安全区
        child: TerminalPage(),
      ),
    );
  }
}
