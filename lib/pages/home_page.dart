import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipee_application/utils/tabs.dart';

import '../models/food_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final data = await rootBundle.loadString(
        "/Users/shahiyankhan/flutterVScode/recipee_application/assets/files/food.json");
    final decodedData = jsonDecode(data);
    var productsData = decodedData["foods"];
    FoodModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    print(productsData);
    print(data);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    TabController _tabController =
        TabController(length: Mytabs.tabs.length, vsync: this);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.menu,
                        size: 30,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications,
                        size: 30,
                      )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Delicious",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Easy To Cook Menu",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(
                    fontSize: 20,
                  ),
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Category",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TabBar(
                controller: _tabController,
                indicatorColor: Colors.red,
                labelColor: Colors.red,
                unselectedLabelColor: Colors.black,
                isScrollable: true,
                tabs: Mytabs.tabs,
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  child: TabBarView(controller: _tabController, children: [
                    GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                        ),
                        itemCount: FoodModel.items.length,
                        itemBuilder: (context, index) {
                          final item = FoodModel.items[index];
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: NetworkImage(item.image!),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                  begin: Alignment.bottomRight,
                                  stops: [
                                    0.3,
                                    0.9,
                                  ],
                                  colors: [
                                    Colors.black.withOpacity(.8),
                                    Colors.black.withOpacity(.1),
                                  ],
                                ),
                              ),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Text(
                                    item.name!,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        ),
                    Text("Italian"),
                    Text("Asian"),
                    Text("Chinese"),
                    Text("Indian"),
                    Text("Mexican"),
                    Text("French"),
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
