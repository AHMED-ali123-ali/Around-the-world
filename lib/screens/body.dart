import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manger/app_cupit.dart';
import '../manger/app_state.dart';
class CountryPage extends StatelessWidget {
  const CountryPage({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CountryCubit>();
    final TextEditingController controller = TextEditingController();
    return Scaffold(
      backgroundColor: const Color(0xFFE0F7FA),
      appBar: AppBar(
        title: const Text("Country Finder",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28,color: Colors.white),),
        backgroundColor: Colors.blue,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               SizedBox(height: 50,),
                Container(
                  width: 350,
                  height: 220,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),

                    image: DecorationImage(
                      image: AssetImage("images/map.jpg"),
                      fit: BoxFit.cover
                    ),
                  ),
                ),
                const SizedBox(height: 70),

                // TextField
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      labelText: "Enter country name",
                      labelStyle: TextStyle(fontSize: 22,color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: const Icon(Icons.search),
                    ),
                  ),
                ),
                const SizedBox(height: 70),

                // Button
                SizedBox(
                  width: 250,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      cubit.getCountries(controller.text);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Search",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<CountryCubit, AppState>(
                builder: (context, state) {
                  if (state is AppLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is AppSuccessState) {
                    return ListView.builder(
                      itemCount: state.countries.length,
                      itemBuilder: (context, index) {
                        final country = state.countries[index];
                        return Card(
                          color: Colors.lightBlue[100],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation:10,
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(country.flagUrl,
                                    width: 70, height: 60, fit: BoxFit.cover),
                              ),
                              title: Center(
                                child: Text(
                                  country.name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 30,color: Colors.red),
                                ),
                              ),
                              subtitle: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 4),
                                    Text("Capital: ${country.capital}",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                                    Text("Population: ${country.population}",style: TextStyle(fontSize: 20,color: Colors.black87,fontWeight: FontWeight.bold)),
                                    Text("Languages: ${country.languages.join(", ")}",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold)),
                                    Text("Currencies: ${country.currencies.join(", ")}",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else if (state is AppErrorState) {
                    return Center(
                        child: Text(
                          "${state.message}",
                          style: const TextStyle(color: Colors.red,fontSize: 26,fontWeight: FontWeight.bold),
                        ));
                  }
                  return const Center(
                      child: Text("Search for a country",
                          style: TextStyle(
                              fontSize: 38, fontWeight: FontWeight.bold,color: Colors.red)));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}