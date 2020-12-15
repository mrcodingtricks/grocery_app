import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/details.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFECF0F1),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.short_text_outlined),
          color: Colors.black,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Row(
              children: [
                Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  padding: EdgeInsets.all(6),
                    child: Icon(
                  Icons.shop_outlined,
                  color: Colors.green,
                  size: 22,
                )),
                SizedBox(width: 16),

                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    width: 34,
                    height: 34,
                    child: Image.asset('assets/images/profile.jpg')
                  ),
                )
                
              ],
            ),
          )
        ],
      ),
      backgroundColor: Color(0xFFECF0F1),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 70),
        child: Column(
          children: [
            buildSearchWidget(),
            buildCategoryWidget(),
            Container(
              margin: EdgeInsets.only(left: 24, right: 24, top: 26),
                child: Row(
                  children: [
                    Text('Fruits', style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800
                    )),
                    Spacer(),
                    Icon(Icons.filter_list_outlined)

                  ],
                ),
            ),
            buildProductList(),
          ],
        ),
      ),
    );
  }

  Widget  buildSearchWidget(){
      return Container(
        margin: EdgeInsets.all(24),
         height: 50,
         decoration: BoxDecoration(
           color: Colors.white,
           borderRadius: BorderRadius.circular(12),
           boxShadow: [
             BoxShadow(
               color: Colors.black.withOpacity(0.1),
               blurRadius: 16,
               spreadRadius: 1,
               offset: Offset(0,4)
             )
           ]
         ),
         child: Row(
           children: [
             SizedBox(
               width: 16,
             ),
             Expanded(
               child: Text('Search', style: TextStyle(
                 color: Colors.green
               ),),
             ),
             Icon(Icons.search_outlined),
             SizedBox(width: 16)
           ],
         ),
      );
    }
    List category =[
        {'icon': "assets/images/broccoli.png", 'name': 'Veg', 'color': Colors.teal[200]},
         {'icon':  "assets/images/grapes.png" , 'name': 'Fruits', 'color': Colors.green},
          {'icon': "assets/images/cupcake.png", 'name': 'Bakery' , 'color': Colors.red[300]},
          {'icon': "assets/images/Milk.png" , 'name': 'Milk', 'color': Colors.orange[200]},
          {'icon': "assets/images/cake.png" , 'name': 'Cake', 'color': Colors.teal[600]},
    ];

    Widget buildCategoryWidget()
    {
      return Container(
        height: 120,
        margin: EdgeInsets.only(top: 8),
        padding: EdgeInsets.only(top: 8),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(left: 24),
          itemCount: category.length,
          itemBuilder: (context, i) {
            var item = category.elementAt(i);
            return Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Column(
                children: [
                  Container(
                    height: 75,
                    width: 75,
                    decoration: BoxDecoration(
                      color: item['color'],
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Image.asset(item['icon'], color: Colors.white,)
                  ),
                  Text(item['name'])
                ],
              ),
            );
        }),
      );
    }

  List items = [
      {'image': "assets/images/banana.jpg", 'name': 'Banana', 'size': '12 pcs - 500 to 900 gm', 'price': '1.49'},
      {'image': "assets/images/apple.jpg", 'name': 'Apple', 'size': '12 pcs - 500 to 900 gm', 'price': '1.49'},
      {'image': "assets/images/grapes_pic.jpg", 'name': 'Grapes', 'size': '12 pcs - 500 to 900 gm', 'price': '1.49'},
      {'image': "assets/images/oranges.png", 'name': 'Oranges', 'size': '12 pcs - 500 to 900 gm', 'price': '1.49'},
    ];


  Widget buildProductList()
  {
    return GridView.count(
      crossAxisCount: 2,
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.all(24),
      shrinkWrap: true,
      primary: false,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 0.75,
      children: List.generate(items.length, (index) {
        var item = items[index];
        return InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailScreen()));
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 12.0
                )
              ]
            ),
            child: Column(
              children: [
                SizedBox(
                  width: 125,
                  height: 125,
                  child: Image.asset(item['image']),

                ),
                Text(item['name'], style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600
                ),),
                SizedBox(height: 8),
                Text(item['size'], style: TextStyle(fontSize: 12),),
                Spacer(),
                Divider(
                  height: 0,
                  thickness: 0.3,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text('\$ ${item["price"]}', style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700
                      ),),
                      Spacer(),
                      Icon(Icons.add_circle_outline, size: 24, color: Colors.green,),
                      Container(
                        height: 24,
                        width: 0.2,
                        color: Colors.grey,
                      ),
                      Icon(Icons.favorite_outline, color: Colors.grey, size: 24,)

                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }),

    );
  }
    
}
