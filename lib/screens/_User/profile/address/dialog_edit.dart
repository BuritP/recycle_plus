import 'package:flutter/material.dart';
import 'package:recycle_plus/components/font.dart';
import 'package:recycle_plus/models/varidator.dart';
import 'package:recycle_plus/screens/_User/exchange/detail/dialog_buy.dart';
import 'package:recycle_plus/screens/_User/profile/address/profile_address.dart';
import 'package:recycle_plus/screens/_User/profile/address/styleTextAddress.dart';
import 'package:recycle_plus/service/auth.dart';

final AuthService _auth = AuthService();

showDialogEditAddress({
  required BuildContext context,
  required data,
  required String user_ID,
}) {
  final _formKey = GlobalKey<FormState>();
  String? value_address;
  String? value_phone;

  TextEditingController TC_phone = TextEditingController();
  TextEditingController TC_address = TextEditingController();

  final addressFB = data!.get('address');
  final phoneFB = data!.get('phone');

  TC_address = (value_address == null)
      ? TextEditingController(text: addressFB)
      : TextEditingController(text: value_address);
  TC_phone = (value_phone == null)
      ? TextEditingController(text: phoneFB)
      : TextEditingController(text: value_phone);
//==================================================================================================================

  //TODO 1: Cancle Button
  Widget cancelButton(BuildContext context) {
    return TextButton(
      child: Text("ยกเลิก", style: Roboto16_B_gray),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  //TODO 2: Continute Button
  Widget continueButton(BuildContext context) {
    return TextButton(
      child: Text("ยืนยัน", style: Roboto16_B_green),
      onPressed: ConfrimEditAddress(
        context: context,
        formKey: _formKey,
        TC_address: TC_address,
        TC_phone: TC_phone,
        address_ID: data.id,
        user_ID: user!.uid,
      ),
    );
  }

  //TODO 3.: Dialog input
  AlertDialog DialogInput = AlertDialog(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("เพิ่มที่อยู่จัดส่ง", style: Roboto18_B_black),
        //TODO 3.1: Delete Address
        IconButton(
          icon: const Icon(
            Icons.remove_circle_sharp,
            color: Colors.redAccent,
            size: 35,
          ),
          onPressed: () async {
            await db
                .deleteAddress(user_ID: user!.uid, address_ID: data.id)
                .then((value) {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(
                  context, Member_ProfileAddress.routeName);
            }).catchError((err) => print('error delete'));
          },
        ),
      ],
    ),
    actions: [continueButton(context), cancelButton(context)],
    //TODO 3.2: Content Dialog
    content: Form(
      key: _formKey,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildPhoneTF(TC_phone),
            const SizedBox(height: 20.0),
            buildAddressTF(TC_address),
          ],
        ),
      ),
    ),
  );

  //TODO 4: ShowDialog
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) => DialogInput,
  );
}

//==================================================================================================================
//TODO : TextField Phone
TextFormField buildPhoneTF(contro_phone) {
  return TextFormField(
    //พิมพ์เฉพาะตัวเลข
    keyboardType: TextInputType.number,
    controller: contro_phone,
    maxLength: 10,
    minLines: 1,
    style: Roboto14_black,
    decoration: styleTextFieldAddress(
      'เบอร์โทร',
      'เพิ่มเบอร์โทรศัพท์ที่ติดต่อได้',
    ),
    validator: ValidatorPhone,
    onSaved: (value) => contro_phone.text = value,
  );
}

//TODO : TextField Address
TextFormField buildAddressTF(contro_address) {
  return TextFormField(
    //พิมพ์หลายบรรทัดได้
    keyboardType: TextInputType.multiline,
    controller: contro_address,
    maxLines: 4,
    minLines: 1,
    style: Roboto14_black,
    decoration: styleTextFieldAddress(
      'ที่อยู่จัดส่ง',
      'เพิ่มที่อยู่จัดส่งสินค้า',
    ),
    validator: ValidatorEmpty,
    onSaved: (value) => contro_address = value,
  );
}

//TODO : OnClick, Create Database on Firebase <<--------------------------------
GestureTapCallback ConfrimEditAddress({
  required BuildContext context,
  required formKey,
  required TC_address,
  required TC_phone,
  required address_ID,
  required user_ID,
}) {
  return () async {
    if (formKey.currentState!.validate()) {
      //สั่งประมวลผลข้อมูลที่กรอก
      formKey.currentState?.save();
      print('EZ');
      print('TC_address: ${TC_address.text}');
      print('TC_phone: ${TC_phone.text}');

      //update firebase
      await db
          .updateAddress(
        user_ID: user!.uid,
        address_ID: address_ID,
        New_address: TC_address.text,
        New_phone: TC_phone.text,
      )
          .then(
        (value) {
          print('update address');
          Navigator.pop(context);
          Navigator.pushReplacementNamed(
              context, Member_ProfileAddress.routeName);
        },
      ).catchError((err) => print('update error'));
    } else {
      print('Form wrong');
    }
  };
}
