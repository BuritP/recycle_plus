import 'package:flutter/material.dart';
import 'package:recycle_plus/components/font.dart';
import 'package:recycle_plus/models/user_model.dart';
import 'package:recycle_plus/models/varidator.dart';
import 'package:recycle_plus/screens/success/success_register.dart';
import 'package:recycle_plus/screens/success/verify_email.dart';
import 'package:recycle_plus/service/auth.dart';

import '../../components/textfield.dart';

class SponserRegisterForm extends StatefulWidget {
  const SponserRegisterForm({Key? key}) : super(key: key);

  @override
  State<SponserRegisterForm> createState() => _SponserRegisterFormState();
}

class _SponserRegisterFormState extends State<SponserRegisterForm> {
  //formkey = ตัวแสดงตัวแบบยูนืคของฟอร์มนี้
  //AuthService = ตัวเรียกฟังก์ชันที่เกี่ยวกับ user
  //EmailModel = ภายในประกอบด้วย ตัวแปร email, pass, name
  //isLoading = ใช้ในตอนกดปุ่มแล้วรอโหลด
  final _formKey = GlobalKey<FormState>();
  final AuthService auth = AuthService();
  SponserEmailModel inputSponserEmail = SponserEmailModel();
  bool isLoading = false;

//==================================================================================================================
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          //TODO 2. Form Email
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 15, 25, 0),
            child: buildEmailFormField(inputSponserEmail),
          ),

          //TODO 3. Form Password
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 15, 25, 0),
            child: buildPasswordFormField(inputSponserEmail),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(25, 15, 25, 0),
            child: buildOTPFormField(inputSponserEmail),
          ),
          const SizedBox(height: 30),

          //TODO 5. Button Register
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              fixedSize: const Size(350, 50),
              side: const BorderSide(width: 2.0, color: Colors.white), //ขอบ
              elevation: 2.0, //เงา
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            // Loading ?
            child: isLoading
                ? const CircularProgressIndicator(color: Colors.white)
                : Text("REGISTER", style: Roboto20_B_white),

            //TODO 6. เมื่อกดปุ่มให้ทำการส่งข้อมูล TextField
            onPressed: () async {
              //เมื่อกรอกข้อมูลถูกต้อง
              if (_formKey.currentState!.validate()) {
                _formKey.currentState?.save(); //สั่งประมวลผลข้อมูลที่กรอก

                if (isLoading) return;
                setState(() => isLoading = true); //Loading

                await auth.SponserregisterEmail(inputSponserEmail.email,
                        inputSponserEmail.password, inputSponserEmail.otp)
                    .then((value) {
                  //Check error register
                  if (value != "not_work") {
                    _formKey.currentState?.reset();

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) =>
                    //         VerifyEmail(name: inputSponserEmail.name),
                    //   ),
                    // );
                  } else {
                    setState(() => isLoading = false);
                  }
                });
              }
            },
          ),
        ],
      ),
    );
  }
}

//========================================================================================================================
//TODO : Form Email
TextFormField buildEmailFormField(inputModel) {
  return TextFormField(
    keyboardType: TextInputType.emailAddress,
    obscureText: false, //ปิดตา
    decoration: styleTextField("Enter Email", Icons.mail_outline_sharp),
    validator: ValidatorEmail,
    onSaved: (SponseremailEZ) {
      inputModel.email = SponseremailEZ!;
    },
  );
}

//TODO : Password Form
TextFormField buildPasswordFormField(inputModel) {
  return TextFormField(
    keyboardType: TextInputType.visiblePassword,
    obscureText: true,
    decoration: styleTextField("Enter Password", Icons.lock),
    validator: ValidatorPassword,
    onSaved: (SponserpasswordEZ) {
      inputModel.password = SponserpasswordEZ!;
    },
  );
}

TextFormField buildOTPFormField(inputModel) {
  return TextFormField(
    keyboardType: TextInputType.text,
    obscureText: false,
    decoration: styleTextField("Enter OTP", Icons.key),
    validator: ValidatorEmpty,
    onSaved: (SponserOTPEZ) {
      inputModel.otp = SponserOTPEZ!;
    },
  );
}
