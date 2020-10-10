import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admob_sample/services/admob.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Admob.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // ①画面上部にバナー広告を配置するパターン
  // @override
  // Widget build(BuildContext context) {
  //   final _pageList = <Widget>[
  //     Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: const [
  //           Text(
  //             'ホーム',
  //           ),
  //         ],
  //       ),
  //     ),
  //     Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: const [
  //           Text(
  //             'リスト',
  //           ),
  //         ],
  //       ),
  //     ),
  //     Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: const [
  //           const Text(
  //             'マイページ',
  //           ),
  //         ],
  //       ),
  //     ),
  //   ];

  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text(widget.title),
  //     ),
  //     body: SafeArea(
  //       child: Column(
  //         children: [
  //           AdmobBanner(
  //             adUnitId: AdMobService().getBannerAdUnitId(),
  //             adSize: AdmobBannerSize(
  //               width: MediaQuery.of(context).size.width.toInt(),
  //               height: AdMobService().getHeight(context).toInt(),
  //               name: 'SMART_BANNER',
  //             ),
  //           ),
  //           Expanded(
  //             child: _pageList[_selectedIndex],
  //           )
  //         ],
  //       ),
  //     ),
  //     bottomNavigationBar: BottomNavigationBar(
  //       items: const <BottomNavigationBarItem>[
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.home),
  //           label: '',
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.list),
  //           label: '',
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.person),
  //           label: '',
  //         ),
  //       ],
  //       currentIndex: _selectedIndex,
  //       onTap: _onItemTapped,
  //     ),
  //   );
  // }

  // ②ボトムナビゲーション上部にバナー広告を表示するパターン
  @override
  Widget build(BuildContext context) {
    final _pageList = <Widget>[
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'ホーム',
            ),
          ],
        ),
      ),
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'リスト',
            ),
          ],
        ),
      ),
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            const Text(
              'マイページ',
            ),
          ],
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _pageList[_selectedIndex],
      bottomNavigationBar: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          AdmobBanner(
            adUnitId: AdMobService().getBannerAdUnitId(),
            adSize: AdmobBannerSize(
              width: MediaQuery.of(context).size.width.toInt(),
              height: AdMobService().getHeight(context).toInt(),
              name: 'SMART_BANNER',
            ),
          ),
          BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: '',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ],
      ),
    );
  }
}
