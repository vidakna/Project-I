import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel/widgets/app_text.dart';


class ResponsiveButton extends StatelessWidget {
  bool isResponsive;
  double? width;
  ResponsiveButton({ Key? key,this.width=200,this.isResponsive=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width:isResponsive==true? double.maxFinite: width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          //color: AppColors.mainColor
          color:Colors.grey
        ),
        child: Row(
          mainAxisAlignment:isResponsive==true?MainAxisAlignment.spaceBetween:MainAxisAlignment.center,
          
          // children: [
          //   isResponsive==true?Container(margin:const EdgeInsets.only(left: 30), child: AppText(text: "Book Trip Now   >>>",color:Colors.white)):Container(),
          //   //Image.asset("img/button.png"),
          // ],
          children: [
            isResponsive == true
                ? Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: AppText(
                      text: "Book Trip Now   >>>",
                      color: Colors.white,
                      size: 20,
                    ),
                  )
                : Container(
                    child: AppText(
                      text: " >>>",
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
            //Image.asset("img/button.png"),
            Container(),
          ],
        ),
      ),
    );
  }
}