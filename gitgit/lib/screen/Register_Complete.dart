import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ronfic_ver2/controller/auth_page.dart';
import 'package:ronfic_ver2/controller/loginchk_info.dart';
import 'package:ronfic_ver2/model/style.dart';
import 'package:ronfic_ver2/screen/RegisterPage.dart';
import 'package:ronfic_ver2/screen/ScreenFirst.dart';


ExistingMebers em;

class RegisterComplete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     em = Provider.of<ExistingMebers>(context);
    final width = MediaQuery.of(context).size.width / 1.1;
    return Scaffold(
      appBar: RegAppBar(context,'회원가입완료'),
    body: Center(
      child: Container(
        // color: Colors.grey,
        width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget> [
              Text('회원가입이 완료 되었습니다!',style: TextStyle(color: Colors.lightBlue,fontWeight: FontWeight.bold,fontSize: 25),),
              SizedBox(height: 12,),
              Text('론픽존과 함께 운동해볼까요?',style: TextStyle(color: Colors.grey,fontSize: 16),),
              SizedBox(height: 12,),
              Text('KeyPad: '+keypad1,style: TextStyle(color: Colors.grey,fontSize: 16),),
              Text('(*장비를 이용하시려면 키패드가 필요해요!)',style: TextStyle(color: Colors.grey,fontSize: 16),),

              SizedBox(height: 40,),
              Container(
                width: width/1.5,
                height: 50,
                child: FlatButton(
                  textColor: Colors.white,
                  disabledColor: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),

                  color: Colors.lightBlue,

                  child: Text('홈으로',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                  onPressed:  (){
                          keypad1 = null;
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                        builder: (BuildContext context) =>
                            AuthPage()), (route) => false);
                    // Navigator.push(
                    //     context, CupertinoPageRoute(builder: (context) => ()));
                    // if(_formKey.currentState.validate()){
                    //   _formKey.currentState.save();
                    //   _signUp();
                    // }
                  },
                ),
              )
            ],
          ),

      ),
    ),
    );
  }
}
