import 'dart:math' as math show pi;

import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sidebar ui',
      home: Scaffold(
        body: SidebarPage(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: const Text('Yay! Button Pressed!')));
          },
          backgroundColor: Colors.green,
          child: const Icon(Icons.navigation),
        ),
      ),
    );
  }
}

class SidebarPage extends StatefulWidget {
  @override
  _SidebarPageState createState() => _SidebarPageState();
}

class _SidebarPageState extends State<SidebarPage> {
  late List<CollapsibleItem> _items;
  late String _headline;
  AssetImage _avatarImg = AssetImage('assets/man.png');

  @override
  void initState() {
    super.initState();
    _items = _generateItems;
    _headline = _items.firstWhere((item) => item.isSelected).text;
  }

  List<CollapsibleItem> get _generateItems {
    return [
      CollapsibleItem(
          text: 'Dashboard',
          icon: Icon(Icons.assessment),
          onPressed: () => setState(() => _headline = 'DashBoard'),
          onHold: () => ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: const Text("Dashboard"))),
          isSelected: true,
          subItems: [
            CollapsibleItem(
              text: 'Menu',
              // dot icon with small size
              icon: Icon(
                Icons.fiber_manual_record,
                size: 10,
                color: Colors.blue,
              ),
              onPressed: () => setState(() => _headline = 'Menu'),
              onHold: () => ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: const Text("Menu"))),
              isSelected: true,
            ),
            CollapsibleItem(
              text: 'Shop',
              iconImage: AssetImage("assets/shop_icon.png"),
              icon: Icon(
                Icons.fiber_manual_record,
                size: 10,
                color: Colors.blue,
              ),
              onPressed: () => setState(() => _headline = 'Shop'),
              onHold: () => ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: const Text("Shop"))),
              isSelected: true,
            ),
          ]),
      CollapsibleItem(
        text: 'Search',
        icon: Icon(Icons.search),
        onPressed: () => setState(() => _headline = 'Search'),
        onHold: () => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: const Text("Search"))),
      ),
      CollapsibleItem(
        text: 'Notifications',
        icon: Icon(Icons.notifications),
        onPressed: () => setState(() => _headline = 'Notifications'),
        onHold: () => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: const Text("Notifications"))),
      ),
      CollapsibleItem(
        text: 'Settings',
        icon: Icon(Icons.settings),
        onPressed: () => setState(() => _headline = 'Settings'),
        onHold: () => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: const Text("Settings"))),
      ),
      CollapsibleItem(
        text: 'Alarm',
        icon: Icon(Icons.access_alarm),
        onPressed: () => setState(() => _headline = 'Alarm'),
        onHold: () => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: const Text("Alarm"))),
      ),
      CollapsibleItem(
        text: 'Eco',
        icon: Icon(Icons.eco),
        onPressed: () => setState(() => _headline = 'Eco'),
        onHold: () => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: const Text("Eco"))),
      ),
      CollapsibleItem(
        text: 'Event',
        icon: Icon(Icons.event),
        onPressed: () => setState(() => _headline = 'Event'),
        onHold: () => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: const Text("Event"))),
      ),
      CollapsibleItem(
        text: 'No Icon',
        onPressed: () => setState(() => _headline = 'No Icon'),
        onHold: () => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: const Text("No Icon"))),
      ),
      CollapsibleItem(
        text: 'Email',
        icon: Icon(Icons.email),
        onPressed: () => setState(() => _headline = 'Email'),
        onHold: () => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: const Text("Email"))),
      ),
      CollapsibleItem(
          text: 'News',
          iconImage: NetworkImage(
              "https://cdn-icons-png.flaticon.com/512/330/330703.png"),
          onPressed: () => setState(() => _headline = 'News'),
          onHold: () => ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: const Text("News"))),
          subItems: [
            CollapsibleItem(
              text: 'Old News',
              icon: Icon(
                Icons.fiber_manual_record,
                size: 10,
                color: Colors.blue,
              ),
              onPressed: () => setState(() => _headline = 'Old News'),
              onHold: () => ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: const Text("Old News"))),
            ),
            CollapsibleItem(
              text: 'Current News',
              icon: Icon(
                Icons.fiber_manual_record,
                size: 10,
                color: Colors.blue,
              ),
              onPressed: () => setState(() => _headline = 'Current News'),
              onHold: () => ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: const Text("Current News"))),
            ),
          ]),
      CollapsibleItem(
        text: 'Face',
        icon: Icon(Icons.face),
        onPressed: () => setState(() => _headline = 'Face'),
        onHold: () => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: const Text("Face"))),
      ),
    ];
  }

  bool isCollapsed = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: CollapsibleSidebar(
        onToggleChanged: (value) {
          print('sidebar opened: $value');
        },
        isCollapsed: isCollapsed,
        items: _items,
        collapseOnBodyTap: false,
        avatarImg: _avatarImg,
        title: 'John Smith',
        onTitleTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Yay! Flutter Collapsible Sidebar!')));
        },
        iconSize: 40,

        onTapToggled: () {
          setState(() {
            isCollapsed = !isCollapsed;
          });
          print('trest sidebar is collapse: $isCollapsed');
        },
        body:
        Container(
          color: Colors.black,
          padding: const EdgeInsets.all(20),
          alignment: Alignment.centerRight,
          child:
        AnimatedContainer(
          width: isCollapsed ? size.width : size.width -310,
          height: size.height,
          curve: Curves.fastLinearToSlowEaseIn,

          duration: const Duration(milliseconds: 500),
          color: Colors.green,
          child: Text(
            _headline,
            style: Theme.of(context).textTheme.headline1,
            textAlign: TextAlign.center,
          ),
        ),),
        backgroundColor: Colors.black,
        selectedTextColor: Colors.limeAccent,
        textStyle: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
        titleStyle: TextStyle(
            fontSize: 20,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold),
        toggleTitleStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        sidebarBoxShadow: [
          BoxShadow(
            color: Colors.indigo,
            blurRadius: 20,
            spreadRadius: 0.01,
            offset: Offset(3, 3),
          ),
          BoxShadow(
            color: Colors.green,
            blurRadius: 50,
            spreadRadius: 0.01,
            offset: Offset(3, 3),
          ),
        ],
      ),
    );
  }

  Widget _body(Size size, BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.blueGrey[50],
      child: Center(
        child: Transform.rotate(
          angle: math.pi / 2,
          child: Transform.translate(
            offset: Offset(-size.height * 0.3, -size.width * 0.23),
            child: Text(
              _headline,
              style: Theme.of(context).textTheme.displayLarge,
              overflow: TextOverflow.visible,
              softWrap: false,
            ),
          ),
        ),
      ),
    );
  }
}
