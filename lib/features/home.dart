import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/menudata.dart';
import 'package:flutter_application_1/provider/provider.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2D3250),
        title: Row(
          children: [
            const Icon(
              Icons.pedal_bike,
              color: Color(0xFFF6B17A),
              size: 28,
            ),
            const Text(
              '  Re:Bike',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: 'Neue',
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.home,
              color: Color(0xFF424769),
              size: 28,
            ),
            const Spacer(),
            Text(
              Provider.of<LoginProvider>(context).user,
              style: const TextStyle(
                fontFamily: 'Neue',
                fontSize: 24,
                fontStyle: FontStyle.italic,
                color: Color(0xFFF6B17A),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xFF2D3250),
          padding: const EdgeInsets.all(15),
          child: const Column(
            children: [
              Saldo(),
              MainMenu(),
              Garis(),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    size: 28,
                    color: Color(0xFFF6B17A),
                  ),
                  SizedBox(width: 5),
                  Text(
                    'bikes nearby',
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 5,
                      fontFamily: 'Neue',
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
              BikesNearby(),
              Garis(),
              Row(
                children: [
                  Icon(
                    Icons.info,
                    size: 28,
                    color: Color(0xFFF6B17A),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'About Us',
                    style: TextStyle(
                      letterSpacing: 5,
                      color: Colors.white,
                      fontFamily: 'Neue',
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
              AboutUs(),
            ],
          ),
        ),
      ),
    );
  }
}

class Garis extends StatelessWidget {
  const Garis({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 80,
      endIndent: 80,
      thickness: 2,
      color: Color(0xFFF6B17A),
    );
  }
}

class Saldo extends StatefulWidget {
  const Saldo({super.key});

  @override
  State<Saldo> createState() => _SaldoState();
}

class _SaldoState extends State<Saldo> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: (
      Row(
        children: [
          const Text("Saldo",
            style: TextStyle(
                color: Color(0xFFF6B17A),
                fontSize: 30,
                fontFamily: 'Neue'
            ),
          ),
          const SizedBox(width: 10,),
          Text("Rp${Provider.of<SaldoProvider>(context,listen: false).saldo.toStringAsFixed(0)}",
            style: const TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 30,
                fontFamily: 'Neue'
            ),
          ),
        ],
      )
      ),
    );
  }
}


class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: const Color(0xFF424769),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        ),
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          List<Menus> indexMenu = [p1, p2, p3];
          return InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => indexMenu[index].widget),
              );
            },
            child: Card(
              elevation: 0,
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Hero(
                          tag: indexMenu[index].menu,
                          child: Image.asset(
                            "assets/${indexMenu[index].fileName}",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      indexMenu[index].menu,
                      style: const TextStyle(
                          color: Colors.white, fontFamily: 'Neue'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class BikesNearby extends StatelessWidget {
  const BikesNearby({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> bikesNearby = [
      {'nearbike': 'bike1.webp', 'distance': '88.88 meters'},
      {'nearbike': 'bike2.webp', 'distance': '188.07 meters'},
      {'nearbike': 'bike3.webp', 'distance': '288.86 meters'},
    ];
    return SizedBox(
      height: 320,
      width: 450,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: bikesNearby.length,
        itemBuilder: (context, index) {
          return Container(
            width: MediaQuery.of(context).size.width * 0.8,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: const Color(0xFF424769),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/${bikesNearby[index]['nearbike']}",
                  width: double.infinity,
                  height: 250,
                ),
                const SizedBox(height: 10),
                Text(
                  bikesNearby[index]['distance'],
                  style: const TextStyle(
                    fontFamily: 'Neue',
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.group,
                color: Colors.grey,
                size: 20,
              ),
              SizedBox(width: 5),
              Text(
                'Founded by Team Eden (2024)',
                style: TextStyle(
                  fontFamily: 'Neue',
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Icon(
                Icons.directions_bike,
                color: Colors.grey,
                size: 20,
              ),
              SizedBox(width: 5),
              Text(
                'More than 500 bikes available for rent.',
                style: TextStyle(
                  fontFamily: 'Neue',
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.grey,
                size: 20,
              ),
              SizedBox(width: 5),
              Text(
                'Rated 4.98/5.00 stars based on reviews.',
                style: TextStyle(
                  fontFamily: 'Neue',
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
