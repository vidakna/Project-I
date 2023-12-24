import 'package:flutter/material.dart';

import '../model/travel.dart';

class MostPopular extends StatelessWidget {

final _list = Travel.generateMostPopular();
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(left: 15,right: 15,bottom: 15),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index){
          var travel = _list[index];
         return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius:BorderRadius.circular(20),
                  child:Image.asset(travel.url,
                  width:410,
                  height: 100,
                
                  fit: BoxFit.cover,) ,
                ),
              ),
              Positioned(
                left: 15,
                bottom: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                  Material(color: Colors.transparent,
                  child: Text(travel.location,
                  style: TextStyle(color: Colors.white,
                  fontSize: 15
                  ),
                  ),
                  
                  ),
                  Material(color: Colors.transparent,
                  child: Text(travel.name,
                  style: TextStyle(color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                  ),
                  ),
                  
                  )
                 ],
              ))
            ],
            
          );
      },
      separatorBuilder:(_,index)=>SizedBox(width: 15),
      itemCount:_list.length
    );
      

  }
}