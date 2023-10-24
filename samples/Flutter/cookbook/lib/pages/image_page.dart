import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image'),
      ),
      body: ListView(
        children: [
          const Center(child: Text('Local image'),),
          Image.asset('assets/images/apple_black.png', height: 100,),
          const Center(child: Text('Network image'),),
          Image.network('https://picsum.photos/250?image=1', height: 100,),
          const Center(child: Text('Gif image'),),
          Image.network('https://docs.flutter.dev/assets/images/dash/dash-fainting.gif', height: 100,),

          const Center(
            child: Text('Cached network image'),
          ),
          CachedNetworkImage(
            height: 100,
            imageUrl: 'https://picsum.photos/250?image=6',
          ),
          const Center(
            child: Text('^ with indicator'),
          ),
          CachedNetworkImage(
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            height: 100,
            imageUrl: 'https://picsum.photos/250?image=7',
          ),
          const Center(
            child: Text('Fade in image'),
          ),
          FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: 'https://picsum.photos/250?image=8',
            height: 100,
          ),
          const Center(child: Text('^ with indicator'),),
          Stack(
            children: [
              const SizedBox(height: 100, child: Center(child: CircularProgressIndicator(),),),
              Center(child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: 'https://picsum.photos/250?image=9',
                height: 100,
              ),),
            ],
          )
        ],
      ),
    );
  }
}
