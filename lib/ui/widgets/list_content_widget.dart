import 'dart:io';

//Menginstall library terlebih dahulu
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_workshop_kawal_desa/constants/const.dart';
import 'package:flutter/material.dart';
import 'package:project_workshop_kawal_desa/ui/shared/ui_helper.dart';

class ListContentWidget extends StatelessWidget {
  const ListContentWidget({
    Key key,
    @required this.date,
    @required this.address,
    @required this.content,
    @required this.imageUrl,
    @required this.name,
    @required this.imageLocal,
    this.detailFunction,
    this.img=false,
    this.send
  }) : super(key: key);
  final String send;
  final String date;
  final String content;
  final String address;
  final String name;
  final String imageUrl;
  final String imageLocal;
  final Function detailFunction;
  final bool img;
  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.all(0),
      margin: EdgeInsets.all(10),
      height: 250,
      child: Row(
        children: <Widget>[
          InkWell(
            child: Container(
              width: 140,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: img==true?FileImage(File(imageLocal)):NetworkImage(imageUrl),
                  fit: BoxFit.cover
                )
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child:Text(
                          "$date",
                          overflow: TextOverflow.fade,
                          softWrap: true,
                          style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15
                          )
                        ),
                        flex: 1
                      ),
                      //Memperbaiki icon null
                      // Container(
                      //   width: 30,
                      //   child: IconButton(
                      //     onPressed:(){
                      //       detailFunction;
                      //     },
                      //     color: Colors.blue,
                      //     icon: Icon(
                      //       Icons.add,
                      //       color: Colors.blue,
                      //     ),
                      //     iconSize: 30
                      //   )
                      // )
                    ]
                  ),
                  Divider(
                    height: 10,
                    thickness: 2,
                  ),
                  Flexible(
                    child: RichText(
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: "Kegiatan: ",
                                  style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)
                              ),
                              TextSpan(
                                  text: "$content",
                                  style: TextStyle(color: Colors.grey)
                              ),
                            ],
                        ),
                    ),
                  ),
                  // SizedBox(height: 7),
                  Divider(
                    height: 10,
                    thickness: 2,
                  ),
                  Flexible(
                    child: RichText(
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: "Alamat: ",
                              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)
                          ),
                          TextSpan(
                              text: "$address",
                              style: TextStyle(color: Colors.grey)
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height:24),
                  Text(
                    "Oleh: " + "$name".toUpperCase(),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.blue)
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    //FAICON diambil dari library FontAwesomeIcons
                    child: (send=='pending')?FaIcon(FontAwesomeIcons.clock, size: 15, color: Colors.red):FaIcon(FontAwesomeIcons.check, size:15, color:Colors.green)
                  )
                ]
              )
            )
          )
        ]
      )
    );
  }
}