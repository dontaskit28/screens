import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ipfs/src/service/image_picker.dart';
import 'network.dart';
import 'mintNft.service.dart' as nftFactory;
import 'evm.service.dart' as evm;
import 'package:web3dart/credentials.dart';
import 'network.dart';
import 'tokenCreation.service.dart' as tokenFactory;
import 'evm.service.dart' as evm;
import 'package:web3dart/credentials.dart';

class TabPage extends StatefulWidget {
  const TabPage({super.key});

  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.green,
                    ),
                    Row(
                      children: const [
                        Icon(Icons.settings),
                        SizedBox(width: 10),
                        Icon(Icons.qr_code),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  height: 140,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 105, 159, 203),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "\$76.67",
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text("+%7.09"),
                          ],
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          "Account Name",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Row(
                          children: const [
                            Text(
                              "0x376....ad57c",
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                            SizedBox(width: 5),
                            Icon(
                              Icons.copy,
                              size: 10,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: const Center(
                    child: Text("View all Accounts"),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buttonWidget(
                        icon: Icons.wallet,
                        text: "Add Funds",
                      ),
                      buttonWidget(
                        icon: Icons.arrow_outward,
                        text: "Send",
                      ),
                      buttonWidget(
                        icon: Icons.arrow_outward,
                        text: "Recieve",
                        isRotate: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  tabs: const [
                    Tab(text: 'Tokens'),
                    Tab(text: 'NFTs'),
                  ],
                  indicatorPadding: EdgeInsets.zero,
                  labelColor: const Color.fromARGB(255, 105, 159, 203),
                  unselectedLabelColor: Colors.white,
                  indicatorColor: const Color.fromARGB(255, 105, 159, 203),
                ),
                IconButton(
                  onPressed: () {
                    if (_tabController.index == 0) {
                      showBottom(context);
                    } else {
                      showBottomNFT(context);
                    }
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                SingleChildScrollView(
                  child: Container(
                    height: 600,
                    padding: const EdgeInsets.all(16),
                    child: ListView.builder(
                      padding: const EdgeInsets.all(0),
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 15,
                            ),
                            leading: const CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.green,
                            ),
                            title: const Text("Token Name"),
                            subtitle: const Text("1 ETH"),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text("\$1,000"),
                                Text(
                                  "5.5%",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    height: 600,
                    padding: const EdgeInsets.all(16),
                    child: ListView.builder(
                      padding: const EdgeInsets.all(0),
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const ListTile(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 15,
                            ),
                            leading: CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.green,
                            ),
                            title: Text("NFT Name"),
                            subtitle: Text("Description"),
                            trailing: Text("Metadata"),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buttonWidget({
    required IconData icon,
    required String text,
    bool isRotate = false,
  }) {
    return Column(
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 105, 159, 203),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: isRotate
                ? Transform.rotate(
                    angle: 3.14,
                    child: Icon(
                      icon,
                      size: 36,
                    ),
                  )
                : Icon(
                    icon,
                    size: 36,
                  ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  showBottom(BuildContext context) {
    List<String> headers = ["Name", "Symbol", "Chain", "Supply"];
    List<String> values = [
      "Ethereum",
      "Ethereum",
      "Ethereum Mainnet",
      "Max: 100000"
    ];
    List<TextEditingController> controllers = [
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
    ];
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      backgroundColor: Colors.black,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              top: 20,
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Create a Token",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 280,
                    child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 13,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: Text(
                                  headers[index],
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 92, 157, 210),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade800,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                height: 40,
                                width: MediaQuery.of(context).size.width * 0.55,
                                child: TextField(
                                  controller: controllers[index],
                                  decoration: InputDecoration(
                                    hintText: values[index],
                                    border: const UnderlineInputBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      ),
                                      borderSide: BorderSide(
                                        width: 1,
                                        color:
                                            Color.fromARGB(255, 92, 157, 210),
                                      ),
                                    ),
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 1,
                                        color:
                                            Color.fromARGB(255, 92, 157, 210),
                                      ),
                                    ),
                                    contentPadding: const EdgeInsets.all(10),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: controllers[4],
                      minLines: 5,
                      maxLines: 5,
                      decoration: const InputDecoration(
                        hintText: "Description",
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          borderSide: BorderSide(
                            width: 2,
                            color: Color.fromARGB(255, 92, 157, 210),
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: Color.fromARGB(255, 92, 157, 210),
                          ),
                        ),
                        contentPadding: EdgeInsets.all(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                Colors.grey.shade800,
                              ),
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                            onPressed: () {
                              for (var element in controllers) {
                                element.clear();
                              }
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 5,
                                vertical: 15,
                              ),
                              child: Text(
                                "Reset",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 92, 157, 210),
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(255, 92, 157, 210),
                              ),
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                            onPressed: () async {
                              if (controllers[0].text.isEmpty ||
                                  controllers[1].text.isEmpty ||
                                  controllers[2].text.isEmpty ||
                                  controllers[3].text.isEmpty ||
                                  controllers[4].text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.red.shade400,
                                    content: const Text(
                                        "Please fill all the fields"),
                                  ),
                                );
                                return;
                              }
                              var name = controllers[0].text;
                              var symbol = controllers[1].text;
                              var decimals = 18;
                              var totalSupply = 1 * 10 ^ decimals;
                              var network = Network.ethereumGoerli;
                              var client = evm.getEthClient(network);
                              var credentials =
                                  EthPrivateKey.fromHex("kasflkald");
                              try {
                                await tokenFactory.deployErc20Contract(
                                  client,
                                  network,
                                  credentials,
                                  name,
                                  symbol,
                                  totalSupply.toString(),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.green.shade400,
                                    content: const Text("Added Token"),
                                  ),
                                );
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.red.shade400,
                                    content: const Text("Error"),
                                  ),
                                );
                              } finally {
                                for (var element in controllers) {
                                  element.clear();
                                }
                                Navigator.pop(context);
                              }
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 5,
                                vertical: 15,
                              ),
                              child: Text(
                                "Confirm",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  showBottomNFT(BuildContext context) {
    List<String> headers = ["Name", "Link", "Chain", "About"];
    List<String> values = [
      "Ethereum",
      "www.krypthon.com",
      "Ethereum Mainnet",
      "Description"
    ];
    List<TextEditingController> controller =
        List.generate(4, (i) => TextEditingController());
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      backgroundColor: Colors.black,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              top: 20,
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Create a NFT",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 280,
                    child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 13,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: Text(
                                  headers[index],
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 92, 157, 210),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade800,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                height: 40,
                                width: MediaQuery.of(context).size.width * 0.55,
                                child: TextField(
                                  controller: controller[index],
                                  decoration: InputDecoration(
                                    hintText: values[index],
                                    border: const UnderlineInputBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      ),
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    contentPadding: const EdgeInsets.all(10),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await ImagePickerService.pickImage(context).then((value) {
                        print(value!);
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: 130,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          "https://t3.ftcdn.net/jpg/02/70/22/86/360_F_270228625_yujevz1E4E45qE1mJe3DyyLPZDmLv4Uj.jpg",
                          height: 130,
                          width: MediaQuery.of(context).size.width * 0.85,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                Colors.grey.shade800,
                              ),
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                            onPressed: () {
                              for (var element in controller) {
                                element.clear();
                              }
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 5,
                                vertical: 15,
                              ),
                              child: Text(
                                "Reset",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 92, 157, 210),
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(255, 92, 157, 210),
                              ),
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                            onPressed: () async {
                              var uri =
                                  "https://ipfs.io/ipfs/bafkreiacyb535yn2qnqmntihaxybce4ckcvibxufthbxgfn237dkvyfo3e";
                              var network = Network.ethereumGoerli;
                              var client = evm.getEthClient(network);
                              var credentials = EthPrivateKey.fromHex(
                                "fajflkajklajzlkd",
                              );
                              try {
                                await nftFactory.mintNft(
                                    client, network, credentials, uri);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.green.shade400,
                                    content: const Text("NFT Minted"),
                                  ),
                                );
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.red.shade400,
                                    content: const Text("Error Minting NFT"),
                                  ),
                                );
                              } finally {
                                for (var element in controller) {
                                  element.clear();
                                }
                                Navigator.pop(context);
                              }
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 5,
                                vertical: 15,
                              ),
                              child: Text(
                                "Confirm",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
