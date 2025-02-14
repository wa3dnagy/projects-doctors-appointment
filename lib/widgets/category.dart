import 'package:cs_project_2/screen/category_screen.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({super.key, required this.categoryName,required this.categoryIcons});
  final categoryName;
  final categoryIcons;

  @override
  Widget build(BuildContext context) {
     return InkWell(
        
        onTap: () {
          
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return CategoryScreen(); 
              },
            ),
          );
        },
       child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 5, horizontal: 15),
                          height: 60,
                          width: 55,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 231, 243, 252),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(184, 255, 255, 255),
                                blurRadius: 4,
                                spreadRadius: 2,
                              )
                            ],
                          ),
                          child: Center(
                            child: categoryIcons,
                          ),
                        ),
                     
                        Text(
                          categoryName,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
     );
  }
}