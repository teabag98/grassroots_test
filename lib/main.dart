import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  bool switchMe = true;
  Color cardColor = Colors.blue;

  Widget card({IconData? icon, String? text, bool isSwitch = false}) {
    return GestureDetector(
      onTap: () => setState(() {}),
      child: Container(
        width: 100,
        height: 90,
        color: Colors.white,
        child: Card(
          elevation: 6,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                isSwitch
                    ? Switch(
                        value: switchMe,
                        onChanged: (val) => setState(() {
                              switchMe = val;
                            }))
                    : Icon(icon),
                Text(
                  text ?? "",
                  style: const TextStyle(fontSize: 12),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.notifications_outlined,
          color: Colors.black,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://images.pexels.com/photos/9897446/pexels-photo-9897446.jpeg?auto=compress&cs=tinysrgb&w=1600&lazy=load")),
          )
        ],
      ),
      body: Container(
        // height: size.height,
        // width: size.width,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: const [
                Text(
                  "Wallet",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.left,
                ),
                Text(
                  "Mobile Team",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  card(icon: Icons.qr_code_rounded, text: "Your address"),
                  card(icon: Icons.person, text: "Aliases"),
                  card(isSwitch: true, text: "Balance"),
                  card(icon: Icons.compare_arrows, text: "Reverse"),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: size.width * 0.5,
              child: TabBar(
                unselectedLabelColor: Colors.black,
                labelColor: Colors.black,
                tabs: const [
                  Tab(
                    child: Text(
                      "Tokens",
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Leasing",
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ),
                ],
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.label,
              ),
            ),
            Expanded(
              child: TabBarView(controller: _tabController, children: [
                SizedBox(
                  width: size.width,
                  child: SingleChildScrollView(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: size.width * 0.8,
                          height: 40,
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Search",
                                filled: true,
                                prefixIcon: const Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                ),
                                fillColor: Colors.grey.withOpacity(0.1)),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            leading: Stack(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Transform.rotate(
                                    angle: 15,
                                    child: Container(
                                      color: Colors.blue,
                                      width: 20,
                                      height: 20,
                                    ),
                                  ),
                                ),
                                const Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Icon(
                                      Icons.check,
                                      size: 12,
                                      color: Colors.blue,
                                    ))
                              ],
                            ),
                            title: Row(
                              children: const [
                                Text(
                                  "Waves",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                                Icon(
                                  Icons.favorite,
                                  color: Colors.blue,
                                  size: 12,
                                )
                              ],
                            ),
                            subtitle: const Text(
                              "5.0054",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            ),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            leading: Stack(
                              children: const [
                                CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  child: Text("P",
                                      style: TextStyle(color: Colors.white)),
                                ),
                                Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 8,
                                      child: Icon(
                                        Icons.code,
                                        size: 12,
                                        color: Colors.black,
                                      ),
                                    ))
                              ],
                            ),
                            title: const Text(
                              "pegion / my token",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                            subtitle: const Text(
                              "144.04556321",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            ),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            leading: Stack(
                              children: const [
                                CircleAvatar(
                                  backgroundColor: Colors.green,
                                  child: Text("\$",
                                      style: TextStyle(color: Colors.white)),
                                ),
                                Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 8,
                                      child: Icon(
                                        Icons.check,
                                        size: 12,
                                        color: Colors.black,
                                      ),
                                    ))
                              ],
                            ),
                            title: const Text(
                              "Us Dollar",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                            subtitle: const Text(
                              "199.24",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Hidden tokens(2)",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                              Icon(Icons.arrow_drop_down)
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Suspicious tokens(4)",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                              Icon(Icons.arrow_drop_down)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Card(
                      child: Container(
                          width: size.width * 0.8,
                          height: size.height * 0.3,
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Available balance",
                                style: TextStyle(color: Colors.grey),
                              ),
                              const Text(
                                "105.0054",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                height: 8,
                                child: const LinearProgressIndicator(
                                  color: Colors.blue,
                                  value: 0.8,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("1455556546375"),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: const [
                                      Text(
                                        "Leased",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      CircleAvatar(
                                        radius: 2,
                                        backgroundColor: Colors.blue,
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("15765463454575"),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: const [
                                      Text(
                                        "Total",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      CircleAvatar(
                                        radius: 2,
                                        backgroundColor: Colors.grey,
                                      )
                                    ],
                                  )
                                ],
                              ),
                              const Divider(),
                              SizedBox(
                                width: size.width * 0.8,
                                child: ElevatedButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.blue.withOpacity(0.2))),
                                    child: const Text(
                                      "Star lease",
                                      style: TextStyle(color: Colors.blue),
                                    )),
                              ),
                            ],
                          )),
                    ),
                    Card(
                      child: Container(
                          width: size.width * 0.8,
                          color: Colors.white,
                          child: const Padding(
                            padding: EdgeInsets.all(14),
                            child: Text("View History"),
                          )),
                    ),
                    SizedBox(
                      width: size.width * 0.8,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Active now(2)",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                            Icon(
                              Icons.arrow_drop_up,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ]),
            )
            // Row(
            //   children: [
            //     Text(
            //       "Tokens",
            //       style: TextStyle(
            //         color: Colors.grey,
            //       ),
            //       textAlign: TextAlign.left,
            //     ),
            //     Text(
            //       "Leasing",
            //       style: TextStyle(
            //         color: Colors.grey,
            //       ),
            //       textAlign: TextAlign.left,
            //     ),
            //   ],
            // )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(
              icon: Icon(Icons.wallet, color: Colors.grey), label: ""),
          const BottomNavigationBarItem(
              icon: Icon(Icons.sync, color: Colors.grey), label: ""),
          BottomNavigationBarItem(
            icon: InkWell(
                onTap: () {
                  showModalBottomSheet<void>(
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (BuildContext context) {
                      return Container(
                        height: size.height * 0.8,
                        decoration: const BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30),
                            )),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 20,
                                height: 20,
                                child: SvgPicture.asset(
                                  "assets/clap.svg",
                                  color: Colors.white,
                                  width: 2,
                                  height: 2,
                                ),
                              ),
                              const Text(
                                "Hello!",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24),
                              ),
                              const Text(
                                "3pjj84n4gh9T943vb4T884nvK384bv8b4v84v",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13),
                              ),
                              SizedBox(
                                width: size.width * 0.8,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 45,
                                      color: Colors.black.withOpacity(0.1),
                                      child: Center(
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: const [
                                              Icon(
                                                Icons.copy,
                                                color: Colors.white,
                                              ),
                                              Text(
                                                "Copy",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )
                                            ]),
                                      ),
                                    ),
                                    Container(
                                      width: 80,
                                      height: 45,
                                      color: Colors.black.withOpacity(0.1),
                                      child: Center(
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: const [
                                              Icon(
                                                Icons.ios_share_outlined,
                                                color: Colors.white,
                                              ),
                                              Text(
                                                "Share",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )
                                            ]),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Card(
                                child: Container(
                                  width: size.width * 0.7,
                                  height: size.height * 0.3,
                                  child: const Icon(
                                    Icons.qr_code,
                                    size: 200,
                                  ),
                                ),
                              ),
                              const Text(
                                "Your Qr code",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Icon(Icons.add, color: Colors.blue)),
            label: "",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.list, color: Colors.grey),
            label: "",
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: Colors.grey,
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}
