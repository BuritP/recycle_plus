import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recycle_plus/components/font.dart';
import 'package:recycle_plus/screens/_User/exchange/detail/product_detail2.dart';
import 'package:recycle_plus/screens/_User/profile/address/dialog_edit.dart';

class ListTile_ProductAddress extends StatefulWidget {
  const ListTile_ProductAddress({
    Key? key,
    required this.address,
    required this.phone,
  }) : super(key: key);
  final address;
  final phone;

  @override
  State<ListTile_ProductAddress> createState() =>
      _ListTile_ProductAddressState();
}

class _ListTile_ProductAddressState extends State<ListTile_ProductAddress> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        decoration: BoxDecoration(
          color: const Color(0xFFF1F4F8),
          border: Border.all(
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              //TODO 1: Continer 80%
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //TODO 1.1: Tag Address
                    Row(
                      children: [
                        const Icon(
                          Icons.location_pin,
                          color: Color(0xFF288752),
                          size: 25,
                        ),
                        const SizedBox(width: 5.0),
                        Text('ที่อยู่จัดส่ง', style: Roboto16_B_greenB)
                      ],
                    ),
                    const SizedBox(height: 5.0),

                    //TODO 1.2: Address Content
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 100.0,
                        maxWidth: MediaQuery.of(context).size.width,
                      ),
                      child: Text(
                        widget.address,
                        style: Roboto14_black,
                      ),
                    ),

                    //TODO 1.3: Phone number
                    Row(
                      children: [
                        Text('เบอร์โทร: ', style: Roboto14_B_black),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(
                            widget.phone,
                            style: Roboto14_black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              //TODO 2: Continer 10%
              Container(
                width: MediaQuery.of(context).size.width * 0.10,
                height: MediaQuery.of(context).size.height,
                child: const Icon(
                  Icons.arrow_forward_sharp,
                  color: Colors.black,
                  size: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
