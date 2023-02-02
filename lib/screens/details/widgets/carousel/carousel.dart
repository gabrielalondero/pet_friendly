import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pet_friendly/shared/all_colors.dart';
import 'package:pet_friendly/shared/images_path.dart' as path;
import 'package:pet_friendly/stores/details_store.dart';

class Carousel extends StatelessWidget {
  Carousel({super.key, required this.images});

  final List<String> images;
  final color = AllColors();
  final DetailsStore detailsStore = GetIt.I<DetailsStore>();

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> listImages = _mapList(images);
    if (images.isEmpty) {
      _addImageDefault();
    }
    detailsStore.listenCarousel();
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
            child: PageView.builder(
              controller: detailsStore.carouselController,
              itemCount: listImages.length,
              itemBuilder: (context, index) {
                return Image.network(
                  listImages[index]['image'],
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
              },
            ),
          ),
        ),
        _buildBullets(listImages),
      ],
    );
  }

  Widget _buildBullets(List<Map<String, dynamic>> listImages) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Observer(builder: (_) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: listImages.map(
            (e) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 2),
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: detailsStore.currentImage == e['id'] ? color.pinkLight : color.greyLight,
                ),
              );
            },
          ).toList(),
        );
      }),
    );
  }

  void _addImageDefault() {
    images.add(path.defaultNetworkImage);
  }

  List<Map<String, dynamic>> _mapList(List<String> list) {
    List<Map<String, dynamic>> mapList = [];
    int index = 0;
    list.forEach((e) {
      mapList.add({
        'id': index,
        'image': e,
      });
      index++;
    });
    return mapList;
  }
}
