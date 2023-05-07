import 'package:flutter/material.dart';

class Product {
  final String description, title;
  final List<String> images;
  final List<Color> color;
  final double rating, price;
  final bool isFavourite, isPopular;

  Product(
      {required this.description,
      required this.title,
      required this.images,
      required this.color,
      this.rating = 0,
      required this.price,
      this.isFavourite = false,
      this.isPopular = false});
}

List<Product> productDemo = [
  Product(
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nunc mi ipsum faucibus vitae aliquet nec ullamcorper. Netus et malesuada fames ac turpis egestas sed tempus. Nunc mattis enim ut tellus elementum sagittis. Tortor id aliquet lectus proin nibh nisl. Dolor sit amet consectetur adipiscing. In nisl nisi scelerisque eu. Imperdiet massa tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada. Sagittis eu volutpat odio facilisis mauris sit amet massa. Sollicitudin tempor id eu nisl nunc mi. Interdum varius sit amet mattis. In vitae turpis massa sed elementum tempus egestas. Proin fermentum leo vel orci porta non pulvinar neque.',
      title: 'Viên uống Vitamin Zn',
      images: [
        'assets/images/img1.jpg',
        'assets/images/img2.jpg',
        'assets/images/img3.jpg',
        'assets/images/img4.jpg',
      ],
      color: [
        const Color(0xfff6625E),
        const Color(0xff836db8),
        const Color(0xffDECB9C),
        Colors.white
      ],
      rating: 4,
      price: 200.000),
  Product(
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nunc mi ipsum faucibus vitae aliquet nec ullamcorper. Netus et malesuada fames ac turpis egestas sed tempus. Nunc mattis enim ut tellus elementum sagittis. Tortor id aliquet lectus proin nibh nisl. Dolor sit amet consectetur adipiscing. In nisl nisi scelerisque eu. Imperdiet massa tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada. Sagittis eu volutpat odio facilisis mauris sit amet massa. Sollicitudin tempor id eu nisl nunc mi. Interdum varius sit amet mattis. In vitae turpis massa sed elementum tempus egestas. Proin fermentum leo vel orci porta non pulvinar neque.',
      title: 'Inmmu bổ thận, bổ gan',
      images: [
        'assets/images/img5.jpg',
        'assets/images/img6.jpg',
        'assets/images/img7.jpg',
        'assets/images/img8.jpg',
      ],
      color: [
        const Color(0xfff6625E),
        const Color(0xff836db8),
        const Color(0xffDECB9C),
        Colors.white
      ],
      isFavourite: true,
      rating: 4.5,
      price: 100.000),
  Product(
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nunc mi ipsum faucibus vitae aliquet nec ullamcorper. Netus et malesuada fames ac turpis egestas sed tempus. Nunc mattis enim ut tellus elementum sagittis. Tortor id aliquet lectus proin nibh nisl. Dolor sit amet consectetur adipiscing. In nisl nisi scelerisque eu. Imperdiet massa tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada. Sagittis eu volutpat odio facilisis mauris sit amet massa. Sollicitudin tempor id eu nisl nunc mi. Interdum varius sit amet mattis. In vitae turpis massa sed elementum tempus egestas. Proin fermentum leo vel orci porta non pulvinar neque.',
      title: 'Thuốc viên uống mật ong',
      images: [
        'assets/images/img1.jpg',
        'assets/images/img2.jpg',
        'assets/images/img3.jpg',
        'assets/images/img4.jpg',
      ],
      color: [
        const Color(0xfff6625E),
        const Color(0xff836db8),
        const Color(0xffDECB9C),
        Colors.white
      ],
      isFavourite: true,
      rating: 4.5,
      price: 55.99),
  Product(
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nunc mi ipsum faucibus vitae aliquet nec ullamcorper. Netus et malesuada fames ac turpis egestas sed tempus. Nunc mattis enim ut tellus elementum sagittis. Tortor id aliquet lectus proin nibh nisl. Dolor sit amet consectetur adipiscing. In nisl nisi scelerisque eu. Imperdiet massa tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada. Sagittis eu volutpat odio facilisis mauris sit amet massa. Sollicitudin tempor id eu nisl nunc mi. Interdum varius sit amet mattis. In vitae turpis massa sed elementum tempus egestas. Proin fermentum leo vel orci porta non pulvinar neque.',
      title: 'Nước cam tang',
      images: [
        'assets/images/img9.jpg',
        'assets/images/img10.jpg',
        'assets/images/img11.jpg',
        'assets/images/img12.jpg',
      ],
      color: [
        const Color(0xfff6625E),
        const Color(0xff836db8),
        const Color(0xffDECB9C),
        Colors.white
      ],
      rating: 4.8,
      price: 999.999),
  Product(
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nunc mi ipsum faucibus vitae aliquet nec ullamcorper. Netus et malesuada fames ac turpis egestas sed tempus. Nunc mattis enim ut tellus elementum sagittis. Tortor id aliquet lectus proin nibh nisl. Dolor sit amet consectetur adipiscing. In nisl nisi scelerisque eu. Imperdiet massa tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada. Sagittis eu volutpat odio facilisis mauris sit amet massa. Sollicitudin tempor id eu nisl nunc mi. Interdum varius sit amet mattis. In vitae turpis massa sed elementum tempus egestas. Proin fermentum leo vel orci porta non pulvinar neque.',
      title: 'Nước cam tang',
      images: [
        'assets/images/img9.jpg',
        'assets/images/img10.jpg',
        'assets/images/img11.jpg',
        'assets/images/img12.jpg',
      ],
      color: [
        const Color(0xfff6625E),
        const Color(0xff836db8),
        const Color(0xffDECB9C),
        Colors.white
      ],
      rating: 4.8,
      price: 999.999),
  Product(
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nunc mi ipsum faucibus vitae aliquet nec ullamcorper. Netus et malesuada fames ac turpis egestas sed tempus. Nunc mattis enim ut tellus elementum sagittis. Tortor id aliquet lectus proin nibh nisl. Dolor sit amet consectetur adipiscing. In nisl nisi scelerisque eu. Imperdiet massa tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada. Sagittis eu volutpat odio facilisis mauris sit amet massa. Sollicitudin tempor id eu nisl nunc mi. Interdum varius sit amet mattis. In vitae turpis massa sed elementum tempus egestas. Proin fermentum leo vel orci porta non pulvinar neque.',
      title: 'Nước cam tang',
      images: [
        'assets/images/img9.jpg',
        'assets/images/img10.jpg',
        'assets/images/img11.jpg',
        'assets/images/img12.jpg',
      ],
      color: [
        const Color(0xfff6625E),
        const Color(0xff836db8),
        const Color(0xffDECB9C),
        Colors.white
      ],
      rating: 4.8,
      price: 999.999),
  Product(
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nunc mi ipsum faucibus vitae aliquet nec ullamcorper. Netus et malesuada fames ac turpis egestas sed tempus. Nunc mattis enim ut tellus elementum sagittis. Tortor id aliquet lectus proin nibh nisl. Dolor sit amet consectetur adipiscing. In nisl nisi scelerisque eu. Imperdiet massa tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada. Sagittis eu volutpat odio facilisis mauris sit amet massa. Sollicitudin tempor id eu nisl nunc mi. Interdum varius sit amet mattis. In vitae turpis massa sed elementum tempus egestas. Proin fermentum leo vel orci porta non pulvinar neque.',
      title: 'Nước cam tang',
      images: [
        'assets/images/img9.jpg',
        'assets/images/img10.jpg',
        'assets/images/img11.jpg',
        'assets/images/img12.jpg',
      ],
      color: [
        const Color(0xfff6625E),
        const Color(0xff836db8),
        const Color(0xffDECB9C),
        Colors.white
      ],
      rating: 4.8,
      price: 999.999),
  Product(
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nunc mi ipsum faucibus vitae aliquet nec ullamcorper. Netus et malesuada fames ac turpis egestas sed tempus. Nunc mattis enim ut tellus elementum sagittis. Tortor id aliquet lectus proin nibh nisl. Dolor sit amet consectetur adipiscing. In nisl nisi scelerisque eu. Imperdiet massa tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada. Sagittis eu volutpat odio facilisis mauris sit amet massa. Sollicitudin tempor id eu nisl nunc mi. Interdum varius sit amet mattis. In vitae turpis massa sed elementum tempus egestas. Proin fermentum leo vel orci porta non pulvinar neque.',
      title: 'Nước cam tang',
      images: [
        'assets/images/img9.jpg',
        'assets/images/img10.jpg',
        'assets/images/img11.jpg',
        'assets/images/img12.jpg',
      ],
      color: [
        const Color(0xfff6625E),
        const Color(0xff836db8),
        const Color(0xffDECB9C),
        Colors.white
      ],
      rating: 4.8,
      price: 999.999),
  Product(
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nunc mi ipsum faucibus vitae aliquet nec ullamcorper. Netus et malesuada fames ac turpis egestas sed tempus. Nunc mattis enim ut tellus elementum sagittis. Tortor id aliquet lectus proin nibh nisl. Dolor sit amet consectetur adipiscing. In nisl nisi scelerisque eu. Imperdiet massa tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada. Sagittis eu volutpat odio facilisis mauris sit amet massa. Sollicitudin tempor id eu nisl nunc mi. Interdum varius sit amet mattis. In vitae turpis massa sed elementum tempus egestas. Proin fermentum leo vel orci porta non pulvinar neque.',
      title: 'Nước cam tang',
      images: [
        'assets/images/img9.jpg',
        'assets/images/img10.jpg',
        'assets/images/img11.jpg',
        'assets/images/img12.jpg',
      ],
      color: [
        const Color(0xfff6625E),
        const Color(0xff836db8),
        const Color(0xffDECB9C),
        Colors.white
      ],
      rating: 4.8,
      price: 999.999),
  Product(
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nunc mi ipsum faucibus vitae aliquet nec ullamcorper. Netus et malesuada fames ac turpis egestas sed tempus. Nunc mattis enim ut tellus elementum sagittis. Tortor id aliquet lectus proin nibh nisl. Dolor sit amet consectetur adipiscing. In nisl nisi scelerisque eu. Imperdiet massa tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada. Sagittis eu volutpat odio facilisis mauris sit amet massa. Sollicitudin tempor id eu nisl nunc mi. Interdum varius sit amet mattis. In vitae turpis massa sed elementum tempus egestas. Proin fermentum leo vel orci porta non pulvinar neque.',
      title: 'Nước cam tang',
      images: [
        'assets/images/img9.jpg',
        'assets/images/img10.jpg',
        'assets/images/img11.jpg',
        'assets/images/img12.jpg',
      ],
      color: [
        const Color(0xfff6625E),
        const Color(0xff836db8),
        const Color(0xffDECB9C),
        Colors.white
      ],
      rating: 4.8,
      price: 999.999)
];
