import 'package:flutter/material.dart';
import 'countries.dart';

Map<String, List<countries>> divideCountries(List<countries> list) {
  int half = (list.length / 2).round();
  return {
    "column1": list.sublist(0, half),
    "column2": list.sublist(half),
  };
}

class CountryCard extends StatelessWidget {
  final countries country;

  const CountryCard({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                FadeInImage(
                  placeholder: const AssetImage('assets/placeholder.png'),
                  image: NetworkImage(country.flag),
                  width: 50,
                  height: 30,
                ),
                const SizedBox(width: 10),
                Text(
                  country.Title,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const Text("Square Km: "),
                Text(country.square.toString()),
              ],
            ),
            Row(
              children: [
                const Text("Population: "),
                Text(country.population.toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Country App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Countries'),
        ),
        body: SingleChildScrollView(
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(countriesList.length, (index) {
              return CountryCard(country: countriesList[index]);
            }),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}
