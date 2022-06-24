import 'package:flutter/material.dart';
import 'package:recycle_plus/components/font.dart';

class CardProductBig extends StatelessWidget {
  const CardProductBig({
    Key? key,
    required this.name,
    required this.image,
    required this.token,
    required this.press,
  }) : super(key: key);

  final String name;
  final String image;
  final String token;
  final GestureTapCallback press;

  //TODO : สินค้า 1 ชิ้น
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      //TODO 1. กล่องพื้นที่หลัก
      child: Container(
        width: 150,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: const Color(0x1A000000),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //TODO : Area 1
            Container(
              width: MediaQuery.of(context).size.width,
              height: 170,
              child: Column(
                children: [
                  //TODO 2. Image Product
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 120,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Image.network(
                      'https://picsum.photos/seed/741/600',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),

                  //TODO 3. Name Product
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                    child: Text(
                      'ขวดน้ำเก็บความเย็นได้ดีมากเลยละ...',
                      style: Roboto14_black,
                    ),
                  ),
                ],
              ),
            ),

            //TODO 4. Token
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Price ด้านขวา
                  Row(
                    children: [
                      Image.asset(
                        "assets/image/token.png",
                        width: 22,
                        height: 22,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 5.0),

                      //TODO 5. ราคาสินค้า
                      Text("1000", style: Roboto15_B_green),
                    ],
                  ),

                  //Amount ด้านซ้าย
                  Text("100 ชิ้น", style: Roboto14_blue),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
