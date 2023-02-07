import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pet_friendly/shared/all_colors.dart';
import 'package:pet_friendly/stores/details_store.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Carousel extends StatefulWidget {
  const Carousel(
      {super.key,
      required this.images,
      required this.videos,
      required this.imageIndex});

  final List<String> images;
  final List<String> videos;
  final int imageIndex;

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final String video = 'video';
  final String image = 'image';
  final color = AllColors();
  final DetailsStore detailsStore = GetIt.I<DetailsStore>();

  late final PageController _carouselController;
  late YoutubePlayerController _videoController;

  @override
  void initState() {
    _carouselController = PageController();
    _carouselController.addListener(() {
      detailsStore.setCurrentCarouselItem(_carouselController.page!.round());
    });
    _setVideoController('');
    super.initState();
  }

  @override
  void dispose() {
    _carouselController.dispose();
    _videoController.dispose();
    detailsStore.resetDetails();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> listItens =
        detailsStore.mapList(widget.images, widget.videos);
    return Column(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15)),
          child: Container(
            height: 330,
            decoration: BoxDecoration(
              color: color.pinkLight,
            ),
            child: Hero(
              tag: widget.imageIndex,
              child: PageView.builder(
                controller: _carouselController,
                itemCount: listItens.length,
                itemBuilder: (context, index) {
                  return listItens[index]['type'] == 'image' 
                  ? _image(listItens[index])
                  : _video(listItens[index]);
                },
              ),
            ),
          ),
        ),
        _buildBullets(listItens),
      ],
    );
  }

  void _setVideoController(String url) {
    String? videoId = YoutubePlayer.convertUrlToId(url);
    _videoController = YoutubePlayerController(
        initialVideoId: videoId ?? 'h_SO0J68C24',
        flags: const YoutubePlayerFlags(
          autoPlay: true,
        ));
  }

  Widget _image(Map<String, dynamic> item) {
    return Image.network(
      item['url'],
      fit: BoxFit.contain,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress != null) {
          return Center(
            child: CircularProgressIndicator(
              color: color.pink,
            ),
          );
        }
        return child;
      },
    );
  }

  Widget _video(Map<String, dynamic> item) {
    _setVideoController(item['url']);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: YoutubePlayer(
        controller: _videoController,
        showVideoProgressIndicator: true,
        bottomActions: [
          const SizedBox(width: 14.0),
          CurrentPosition(),
          const SizedBox(width: 8.0),
          ProgressBar(
            isExpanded: true,
            colors: ProgressBarColors(backgroundColor: color.pink),
          ),
          RemainingDuration(),
          const PlaybackSpeedButton(),
        ],
      ),
    );
  }

  Widget _buildBullets(List<Map<String, dynamic>> listItens) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Observer(builder: (_) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: listItens.map(
            (e) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 2),
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: detailsStore.currentCarouselItem == e['id']
                      ? color.pinkLight
                      : color.greyLight,
                ),
              );
            },
          ).toList(),
        );
      }),
    );
  }
}
