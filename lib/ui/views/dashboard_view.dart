import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_workshop_kawal_desa/constants/const.dart';
import 'package:project_workshop_kawal_desa/constants/route_name.dart';
import 'package:project_workshop_kawal_desa/models/login_model_data.dart';
import 'package:project_workshop_kawal_desa/ui/shared/ui_helper.dart';
import 'package:project_workshop_kawal_desa/ui/widgets/button_widget.dart';
import 'package:project_workshop_kawal_desa/viewmodels/dashboard_view_model.dart';
import 'package:stacked/stacked.dart';

class DashboardView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.reactive(
      viewModelBuilder: () => DashboardViewModel(),
      onModelReady: (model) => model.initData(context),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Dashboard'
          ),
        ),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Material(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          elevation: 10,
                          child: Image.asset("assets/icon.png", width: 100.0, height: 100.0,),
                        ),
                        Padding(padding: EdgeInsets.all(3.0)),
                        Text(
                          "${model.name}".toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),
              ),

              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(Icons.add),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text("Pelaporan"),
                    ),
                  ],
                ),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  model.goAnotherView(ReportViewRoute);
                },
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(Icons.share_location),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text("Trajectory"),
                    ),
                  ],
                ),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  model.goAnotherView(TrajectoryViewRoute);
                },
              ),
              Divider(
                height: 1,
                thickness: 1,
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(Icons.logout_sharp),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text("Log Out"),
                    ),
                  ],
                ),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  model.signOut(context);
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 20.0,),
            child: Center(
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    verticalSpaceSmall,
                    ListTile(
                      title: Icon(
                        Icons.hail_rounded,
                        color: Colors.blue,
                        size: 70.0,
                      ),
                    ),
                    ListTile(
                      title: Center(
                        child: Text("Hallo ${model.name}!\n".toUpperCase()),
                      ),
                      subtitle: Text(
                          '\t\t\t\t\tSelamat datang di aplikasi RT/RW. Aplikasi ini memiliki dua fitur utama, yaitu fitur pelaporan dan fitur trajectory.'
                              'Kedua fitur tersebut tersedia di menu sebelah kiri. Sebelum menggunakan fitur-fitur tersebut, '
                              'silakan simak penjelasan mengenai fitur tersebut di bawah ini.',
                          textAlign: TextAlign.justify,),
                    ),
                    // Divider(
                    //   height: 1,
                    //   thickness: 1,
                    // ),
                    verticalSpaceMedium,
                    ListTile(
                      title: Text("Fitur Pelaporan"),
                      subtitle: Text(
                          '\t\t\t\t\tFitur pelaporan adalah fitur untuk anda melaporkan masalah atau pun sekadar melaporkan kegiatan harian'
                              'baik yang dilakukan secara individu maupun berkelompok',
                          textAlign: TextAlign.justify,),
                    ),
                    verticalSpaceMedium,
                    ListTile(
                      title: Text("Fitur Trajectory"),
                      subtitle: Text(
                        '\t\t\t\t\tFitur Trajectory adalah fitur yang digunakan untuk memberikan tanda batas wilayah serta lahan milik warga',
                        textAlign: TextAlign.justify,),
                    ),
                    verticalSpaceSmall,
                  ],
                ),
              ),
            ),
          ),
        )
      ),
    );
  }
}
