import 'package:flutter/material.dart';
import 'package:yandex_maps_mapkit_lite/mapkit.dart';
import 'package:yandex_maps_mapkit_lite/mapkit_factory.dart';
import 'package:yandex_maps_mapkit_lite/yandex_map.dart';
import 'package:yandex_maps_mapkit_lite/init.dart' as init;

// class MapScreen extends StatefulWidget {
//   const MapScreen({super.key});

//   @override
//   State<MapScreen> createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   MapWindow? _mapWindow;

//   @override
//   void initState() {
//     print('1');
//     init.initMapkit(apiKey: 'c4c70768-7c13-4918-aeab-5e6b65413e08');
//     print('2');
//     // mapkit.onStart();
//     print('3');
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: YandexMap(onMapCreated: (mapWindow) => _mapWindow = mapWindow),
//     );
//   }
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    
  await init.initMapkit(
    apiKey: 'c4c70768-7c13-4918-aeab-5e6b65413e08'
  );
            
  runApp(const MyApp());
}
  
class MyApp extends StatefulWidget {
  const MyApp({super.key});
  
  @override
  State<MyApp> createState() => _MyAppState();
}
  
class _MyAppState extends State<MyApp> {
  
  MapWindow? _mapWindow;
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: YandexMap(onMapCreated: (mapWindow) => _mapWindow = mapWindow)
      )
    );
  }
}