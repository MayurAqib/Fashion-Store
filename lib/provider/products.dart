import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:saba_fashion_store/provider/product_model.dart';

class Products extends ChangeNotifier {
  static List<Product> itemList = [
    Product(
      id: 'p1',
      name: 'Nike Air Force 1 LX',
      descTitle: 'Women\'s Shoes',
      specsTitle: 'Benefits',
      decs:
          'Take your love for the game with you wherever you go. Crossing hardwood comfort with off-court flair, these kicks put a fresh spin on a hoops classic with washed-out neon colours and classic paisley print. Of course, we kept the same era-echoing \'80s construction and hidden Nike Air units you know and love for that legendary AF-1 feel. Go ahead, slip into a slam dunk.',
      benefits:
          'From tough stitching to pristine materials to the cupsole design, these sneakers deliver durable style that\'s\nsmoother than backboard glass.\nOriginally designed for performance hoops, Nike Air cushioning delivers lasting comfort.\nLow-cut, padded collar looks sleek and feels great.\nRubber outsole with heritage hoops pivot circles adds traction and durability.\nColour Shown: White/White/Mint Foam/Phantom\nStyle: FJ7739-101\nCountry/Region of Origin: Vietnam',
      price: 69.99,
      imagePath:
          'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/d61590e3-d59b-4a88-b03b-efed4a250fb7/air-force-1-07-lx-shoes-WHWbwl.png',
    ),
    Product(
      id: 'p2',
      name: 'Air Jordan 1',
      descTitle: 'Women\'s Shoes',
      specsTitle: 'Benefits',
      decs:
          'Rise to the occasion in style that soars. This shoe reworks an icon\'s original magic with a platform sole and low-cut silhouette. Air cushioning keeps you lifted, and sleek leather in contrasting colours adds visual interest.',
      benefits:
          'Leather provides a structured feel and a premium look.\nEncapsulated Air-Sole unit cushions every step.\nThick foam cushioning adds height and extra comfort.\nColour: Atmosphere/White/Guava Ice/Light Steel Grey.\nStyle: DH7004-600.\nCountry/Region of Origin: Vietnam',
      price: 59.99,
      imagePath:
          'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/34b64f8a-60fe-42d5-8724-ab5c303e62f5/air-jordan-1-elevate-low-shoes-XlkVrM.png',
    ),
    Product(
      id: 'p3',
      name: 'Nike Air Force 1',
      specsTitle: 'Benefits',
      descTitle: 'Older Kids\' Shoes',
      decs:
          'The Nike AF-1s are a legend for a reason. From the basketball courts in the \'80s to the streets and schools today, they\'ve been a sneaker icon everywhere for decades—meaning a long time! Soft, durable leather lasts for many days of play. Bright colours are made to pop, and only on this special all-star edition.',
      benefits:
          'This all-star edition is inspired by eye-catching bright colours that look like they\'re in a kaleidoscope.\nReal and synthetic leather is made to be durable with a throwback feel.\nThe hidden Air-Sole unit under the heel provides cushioning—like the original AF-1 released in 1982.\nThe rubber sole provides durable traction. The circular pattern was originally designed to help basketball players pivot on the court.',
      price: 79.99,
      imagePath:
          'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/07e14619-28da-4b52-bb5c-00e21ff546cd/air-force-1-older-shoes-G1tf7h.png',
    ),
    Product(
      id: 'p4',
      specsTitle: 'Benefits',
      name: 'Nike Air Force 1 \'07',
      descTitle: 'Women\'s Shoes',
      decs:
          'You\'ll score major points in this legendary classic. Crossing hardwood comfort with off-court flair, this hoops original pairs crisp leather with playful paisley-print accents for nothing-but-net style. Plus, hidden Nike Air units and durable \'80s construction add the comfort you\'ve come to expect from the AF-1.',
      benefits:
          'Real and synthetic leather add durability and structure.\nOriginally designed for performance hoops, Nike Air cushioning delivers lasting comfort.\nPadded, low-cut collar looks sleek and feels great.\nRubber outsole with classic pivot circle pattern adds traction and durability.\nColour Shown: Pearl Pink/White/Pearl Pink/Coral Chalk\nStyle: FD1448-664\nCountry/Region of Origin: Indonesia',
      price: 69.99,
      imagePath:
          'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/8d752b32-17e8-40bc-ac1a-7a8849957a12/air-force-1-07-shoes-QNnTzL.png',
    ),
    Product(
        name: 'Jordan Nu Retro 1 Low',
        descTitle: 'Women\'s Shoes',
        decs: '',
        price: 95.00,
        specsTitle: 'Benefits',
        benefits:
            'Real and synthetic leather add durability and structure.\nOriginally designed for performance hoops, Nike Air cushioning delivers lasting comfort.\nPadded, low-cut collar looks sleek and feels great.\nRubber outsole with classic pivot circle pattern adds traction and durability.\nColour Shown: Pearl Pink/White/Pearl Pink/Coral Chalk\nStyle: FD1448-664\nCountry/Region of Origin: Indonesia',
        imagePath:
            'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/dc52f2d9-759e-496c-9421-6fa2eb86701a/jordan-nu-retro-1-low-shoes-8294mJ.png',
        id: 'p5'),
    Product(
        name: 'Mustard Yoke Design',
        descTitle: 'Cotton Series',
        specsTitle: 'Benefits',
        benefits:
            'Top Fabric: Pure Cotton\nBottom Fabric: Pure Cotton\nDupatta Fabric: Pure Cotton\nGentle Hand Wash',
        decs:
            'Our 3-piece mustard yellow printed cotton suit set features an Anarkali floral print kurta with a notched neckline, handcrafted dori detailing at the back, three-quarter sleeves, stylish high-slits, and a statement yoke. Complemented with straight palazzo pants with a partially elasticated waistband and roomy pockets, and a dupatta in a matching Leheriya print. Adorned with intricate embroidery, gilded lace detailing with scalloped edges, delicate Gota Patti and sequins accents, this charming style is ideal for daytime festivities.',
        price: 69.00,
        imagePath:
            'https://cdn.shopify.com/s/files/1/0341/4805/7228/products/5_3_1800x1800.jpg?v=1683546476',
        id: 'p6'),
    Product(
        name: 'Printed Cotton Kurta',
        decs: 'Blue Printed Cotton Kurta',
        descTitle: 'Cotton Series',
        specsTitle: 'Specification',
        price: 95.00,
        benefits:
            'Top Fabric: Pure Cotton\nBottom Fabric: Pure Cotton\nDupatta Fabric: Pure Cotton\nGentle Hand Wash',
        imagePath:
            'https://cdn.shopify.com/s/files/1/0341/4805/7228/products/22171F_1_540x.jpg?v=1668674401',
        id: 'p7'),
    Product(
        name: 'Yoke Design Anarkali Suit',
        decs: 'Maroon Yoke Design Cotton Anarkali',
        descTitle: 'Cotton Series',
        specsTitle: 'Specification',
        benefits:
            'Top Fabric: Pure Cotton\nBottom Fabric: Pure Cotton\nDupatta Fabric: Pure Cotton\nGentle Hand Wash',
        price: 65.00,
        imagePath:
            'https://cdn.shopify.com/s/files/1/0341/4805/7228/products/34045O_1_720x.jpg?v=1668679599',
        id: 'p8'),
    Product(
        name: 'Grey Solid Chanderi Silk Suit',
        decs: 'Solid Chanderi Silk Suit',
        specsTitle: 'Specification',
        benefits:
            'Top Fabric: Pure Cotton\nBottom Fabric: Pure Cotton\nDupatta Fabric: Pure Cotton\nGentle Hand Wash',
        descTitle: 'Cotton Series',
        price: 99.00,
        imagePath:
            'https://cdn.shopify.com/s/files/1/0341/4805/7228/products/20203O_1_720x.jpg?v=1668674160',
        id: 'p9'),
    Product(
        name: 'Yellow Printed Silk Blend',
        decs: 'Printed Silk Blend Suit Set',
        descTitle: 'Cotton Series',
        price: 58.00,
        specsTitle: 'Specification',
        benefits:
            'Top Fabric: Pure Cotton\nBottom Fabric: Pure Cotton\nDupatta Fabric: Pure Cotton\nGentle Hand Wash',
        imagePath:
            'https://cdn.shopify.com/s/files/1/0341/4805/7228/products/d514cfd7-1b4c-4179-8a6d-8a910fa3f1341634557786453-Libas-Women-Yellow-Floral-Printed-Regular-Kurta-with-Palazzo-5_540x.jpg?v=1668675333',
        id: 'p10'),
    Product(
        name: 'Women trendy Pakistani Dress',
        descTitle: 'Cotton Series',
        decs: 'Womens Trendy',
        specsTitle: 'Specification',
        price: 64.00,
        benefits:
            'Top Fabric: Pure Cotton\nBottom Fabric: Pure Cotton\nDupatta Fabric: Pure Cotton\nGentle Hand Wash',
        imagePath:
            'https://i.pinimg.com/564x/a6/40/48/a64048b8193e4024cb250fe31ef6b24b.jpg',
        id: 'p11'),
    Product(
        benefits:
            'Top Fabric: Pure Cotton\nBottom Fabric: Pure Cotton\nDupatta Fabric: Pure Cotton\nGentle Hand Wash',
        name: 'Indian Pakistani Suit',
        descTitle: 'Cotton Series',
        decs: 'trendy women',
        price: 59.00,
        specsTitle: 'Specification',
        imagePath:
            'https://i.pinimg.com/564x/3a/35/b7/3a35b744d96f9d010fc177d5814d0ace.jpg',
        id: 'p12'),
    Product(
        benefits:
            'Top Fabric: Pure Cotton\nBottom Fabric: Pure Cotton\nDupatta Fabric: Pure Cotton\nGentle Hand Wash',
        name: 'Cotton Straight Printed Kurta',
        decs: 'Blue Cotton Blend Straight Printed Kurta',
        descTitle: 'Cotton Series',
        price: 74.00,
        specsTitle: 'Specification',
        imagePath:
            'https://storage.sg.content-cdn.io/cdn-cgi/image/width=1000,height=1500,quality=75,format=auto/in-resources/6c57599f-2c43-4c82-806a-e07c3410f5d3/Images/ProductImages/Source/african19086ss23blu_1.jpg',
        id: 'p13'),
    Product(
        benefits:
            'Top Fabric: Pure Cotton\nBottom Fabric: Pure Cotton\nDupatta Fabric: Pure Cotton\nGentle Hand Wash',
        name: 'Dark Green Straight Kurta',
        decs: 'Cotton IKAT Straight Kurta',
        specsTitle: 'Specification',
        descTitle: 'Cotton Series',
        price: 68.00,
        imagePath:
            'https://storage.sg.content-cdn.io/cdn-cgi/image/width=1000,height=1500,quality=75,format=auto/in-resources/6c57599f-2c43-4c82-806a-e07c3410f5d3/Images/ProductImages/Source/ikatwea19478aw22dgrn%20_1.jpg',
        id: 'p14'),
    Product(
        benefits:
            'Top Fabric: Pure Cotton\nBottom Fabric: Pure Cotton\nDupatta Fabric: Pure Cotton\nGentle Hand Wash',
        name: 'Lilac Cotton Tiered',
        decs: 'Cotton Trendy',
        descTitle: 'Cotton Series',
        specsTitle: 'Specification',
        price: 62.00,
        imagePath:
            'https://storage.sg.content-cdn.io/cdn-cgi/image/width=1000,height=1500,quality=75,format=auto/in-resources/6c57599f-2c43-4c82-806a-e07c3410f5d3/Images/ProductImages/Source/csld1935ss23lilac_1.jpg',
        id: 'p15'),
  ];
  //function to get  favouriteListItem
  List<Product> get favoriteProducts {
    return itemList.where((prodItem) => prodItem.isFavourite).toList();
  }

  //function to get list of products
  List<Product> get products {
    return [...itemList];
  }

  Product findById(String id) {
    return products.firstWhere((prod) => prod.id == id);
  }
}
