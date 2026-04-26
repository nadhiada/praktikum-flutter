import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'temperature_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<TemperatureProvider>(context);
    final TextEditingController controller = TextEditingController();

    Widget hasil(String nama, double nilai) {
      return Card(
        elevation: 4,
        child: ListTile(
          leading: const Icon(Icons.thermostat),
          title: Text(nama),
          trailing: Text(
            nilai.toStringAsFixed(2),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Konversi Suhu"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Masukkan Suhu",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.thermostat),
              ),
            ),

            const SizedBox(height: 20),

            DropdownButtonFormField(
              value: provider.satuanInput,
              decoration: const InputDecoration(
                labelText: "Satuan Input",
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(value: "Celsius", child: Text("Celsius")),
                DropdownMenuItem(value: "Fahrenheit", child: Text("Fahrenheit")),
                DropdownMenuItem(value: "Kelvin", child: Text("Kelvin")),
                DropdownMenuItem(value: "Reamur", child: Text("Reamur")),
              ],
              onChanged: (value) {
                provider.setSatuan(value!);
              },
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  provider.konversi(controller.text);
                },
                child: const Text(
                  "Konversi",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView(
                children: [
                  hasil("Celsius (°C)", provider.c),
                  hasil("Fahrenheit (°F)", provider.f),
                  hasil("Kelvin (K)", provider.k),
                  hasil("Reamur (°R)", provider.r),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}