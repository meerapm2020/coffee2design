import 'package:coffee2design/database.dart';
import 'package:coffee2design/descrption_screen.dart';
import 'package:flutter/material.dart';

class CoffeeDesign extends StatelessWidget {
  const CoffeeDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 45, 44, 44),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("deja", style: TextStyle(color: Colors.grey, fontSize: 35)),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Brew",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                    )),
                Spacer(),
                CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 70, 67, 67),
                  radius: 40,
                  child: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 162, 159, 159),
                    radius: 35,
                    backgroundImage: AssetImage("assets/images/cartoon.jpg"),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    SizedBox(width: 15),
                    Text(
                      "Browse your favourite coffee...",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            Expanded(
              child: GridView.builder(
                  itemCount: DataBase.myList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      childAspectRatio: 0.7),
                  itemBuilder: (context, index) {
                    return Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 52, 48, 48),
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DescrptionScreen(
                                                  imagePath: DataBase
                                                      .myList[index]["image"],
                                                  name: DataBase.myList[index]
                                                      ["name"],
                                                  price: DataBase.myList[index]
                                                      ["price"],
                                                )));
                                  },
                                  child: Container(
                                    height: 150,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(DataBase
                                                .myList[index]["image"]),
                                            fit: BoxFit.cover),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                  ),
                                ),
                              ),
                              Text(
                                DataBase.myList[index]["name"],
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(height: 15),
                              Container(
                                height: 40,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 68, 59, 59),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child:
                                          Text(DataBase.myList[index]["price"]),
                                    ),
                                    Spacer(),
                                    FloatingActionButton(
                                      onPressed: () {},
                                      child: Text("+"),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ));
                  }),
            ),
            BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.black,
                items: [
                  BottomNavigationBarItem(
                    icon: Center(
                      child: Icon(
                        Icons.home,
                        size: 30,
                      ),
                    ),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                      icon: Center(
                        child: Icon(
                          Icons.shopping_cart,
                          color: Colors.grey,
                          size: 30,
                        ),
                      ),
                      label: ""),
                  BottomNavigationBarItem(
                      icon: Center(
                        child: Icon(
                          Icons.favorite,
                          color: Colors.grey,
                          size: 30,
                        ),
                      ),
                      label: ""),
                  BottomNavigationBarItem(
                      icon: Center(
                        child: Icon(
                          Icons.notifications,
                          color: Colors.grey,
                          size: 30,
                        ),
                      ),
                      label: ""),
                ])
          ],
        ),
      ),
    );
  }
}
