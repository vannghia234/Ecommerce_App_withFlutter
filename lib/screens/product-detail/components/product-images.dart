import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../configs/constant.dart';
import '../../../configs/encode_list_images.dart';
import '../../../models/product_list_response.dart';
import 'custom-appbar.dart';

class ProductImages extends StatefulWidget {
  const ProductImages({super.key, required this.product});
  final Product product;

  @override
  State<ProductImages> createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  late List<String> imageLists;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imageLists = encodeListImages(widget.product.descriptionImageLists!);
  }

  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        CustomAppBar(
          rating: '${widget.product.rating}',
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: AspectRatio(
              aspectRatio: 1,
              child: CachedNetworkImage(
                imageUrl: imageLists[selectedImage],
                placeholder: (context, url) =>
                    const CircularProgressIndicator.adaptive(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              )),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                  imageLists.length, (index) => buildSmallPreview(index))
            ],
          ),
        ),
        const Divider()
      ],
    );
  }

  buildSmallPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 15),
        padding: const EdgeInsets.all(8),
        height: 48,
        width: 48,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: selectedImage == index
                    ? kPrimaryColor
                    : kSecondaryColor.withOpacity(0.1),
                width: 2)),
        child: CachedNetworkImage(
          imageUrl: imageLists[index],
          placeholder: (context, url) =>
              const CircularProgressIndicator.adaptive(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
