import 'package:flutter/material.dart';
import 'package:kabow/Colors/ProjectColor.dart';
import 'package:kabow/Models/LocationServices.dart';
import 'package:kabow/Service_Page/ServiceItem.dart';
import 'package:kabow/providers/ServiceProvider.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

class ServicePage extends StatefulWidget {
  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (context) => ServiceProvider(),
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: BackgroundColor,
                //expandedHeight: 300,
                floating: true,
                pinned: true,
                toolbarHeight: size.height * 0.11,
                title: Image.asset(
                  'assets/Images/logo.png',
                  height: size.height * 0.09,
                ),
                centerTitle: true,
                automaticallyImplyLeading: false,
              ),
              SliverPadding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  sliver: ServiceList())
            ],
          ),
        ),
      ),
    );
  }
}

class ServiceList extends StatefulWidget {
  ServiceList({Key key}) : super(key: key);

  @override
  _ServiceListState createState() => _ServiceListState();
}

class _ServiceListState extends State<ServiceList> {
  @override
  Widget build(BuildContext context) {
    final serviceProvider = Provider.of<ServiceProvider>(context);
    return StreamBuilder(
        stream: CombineLatestStream.list([
          serviceProvider.gethcmServices,
          serviceProvider.getdnServices,
          serviceProvider.gethnServices
        ]),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<LocationService> locationServices =
                snapshot.data[0] + snapshot.data[1] + snapshot.data[2];
            return SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                child: ServiceItem(
                  locationService: locationServices[index],
                ),
              );
            }, childCount: locationServices.length));
          } else {
            //print("object");
            return SliverToBoxAdapter(
              child: Container(
                child: Text("${snapshot.error}"),
              ),
            );
          }
        });
  }
}
