import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_fromapi/screens/category_detail_screen.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:image_downloader/image_downloader.dart';
class Fullscreen extends StatefulWidget {
  final String imageurl;
  const Fullscreen({Key? key, required this.imageurl}) : super(key: key);

  @override
  State<Fullscreen> createState() => _FullscreenState();
}

class _FullscreenState extends State<Fullscreen> {

  @override
  Widget build(BuildContext context) {


    Future<void> downloadImage(String url) async {
      try {
        // Saved with this method.
        var imageId = await ImageDownloader.downloadImage(url,destination: AndroidDestinationType.directoryDownloads..subDirectory("flutter_image.png"));
        if (imageId == null) {
          return ;
        }

        // Below is a method of obtaining saved image information.
        var fileName = await ImageDownloader.findName(imageId);
        var path = await ImageDownloader.findPath(imageId);
        var size = await ImageDownloader.findByteSize(imageId);
        var mimeType = await ImageDownloader.findMimeType(imageId);
      } on PlatformException catch (error) {
      print(error);
      }
      print('Image downloaded successfully');
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
        IconButton(onPressed: (){downloadImage(widget.imageurl);}, icon: const Icon(Icons.save))
      ],
        backgroundColor: Colors.purple,
        title: const Text('Type Of Image'),
      ),
      body: Column(
        children: [
          Expanded(child: Image.network(widget.imageurl,fit: BoxFit.fill,),
          ),

        ],
      ),
    );
  }
}
