import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Parisina - Tienda de Telas', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.redAccent,
          centerTitle: true,
        ),
        body: const Center(child: TarjetasColumn()),
      ),
    );
  }
}

class TarjetasColumn extends StatelessWidget {
  const TarjetasColumn({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> productos = [
      {
        'titulo': 'Telas',
        'desc': 'Gran variedad de texturas y colores para cortinas y manteles.',
        'url': 'https://raw.githubusercontent.com/DeLaRosaRojas/Imagenes-Parisina_De-La-Rosa-6I/refs/heads/main/ProdTela.png',
      },
      {
        'titulo': 'Hilos',
        'desc': 'Resistencia y calidad en hilos de seda, algodón y poliéster.',
        'url': 'https://raw.githubusercontent.com/DeLaRosaRojas/Imagenes-Parisina_De-La-Rosa-6I/refs/heads/main/ProdHilo.png',
      },
      {
        'titulo': 'Botones',
        'desc': 'Acabados perfectos con botones decorativos y funcionales.',
        'url': 'https://raw.githubusercontent.com/DeLaRosaRojas/Imagenes-Parisina_De-La-Rosa-6I/refs/heads/main/ProdBoton.png',
      },
      {
        'titulo': 'Vestir',
        'desc': 'Telas exclusivas para confección de alta costura y moda.',
        'url': 'https://raw.githubusercontent.com/DeLaRosaRojas/Imagenes-Parisina_De-La-Rosa-6I/refs/heads/main/ProdVestir.png',
      },
      {
        'titulo': 'Maquinaria',
        'desc': 'Máquinas de coser industriales y caseras de última generación.',
        'url': 'https://raw.githubusercontent.com/DeLaRosaRojas/Imagenes-Parisina_De-La-Rosa-6I/refs/heads/main/ProdMaq.png',
      },
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        // Centra las tarjetas verticalmente si hay espacio sobrante
        mainAxisAlignment: MainAxisAlignment.center,
        children: productos.map((p) {
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  // --- ESTA ES LA PARTE CORREGIDA ---
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      p['url']!,
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                      // Muestra un indicador de carga mientras baja la imagen
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                          width: 70,
                          height: 70,
                          color: Colors.grey[200],
                          child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
                        );
                      },
                      // Si la URL falla, muestra un icono de error
                      errorBuilder: (context, error, stackTrace) => Container(
                        width: 70,
                        height: 70,
                        color: Colors.grey[300],
                        child: const Icon(Icons.image_not_supported, color: Colors.grey),
                      ),
                    ),
                  ),
                  // ----------------------------------
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          p['titulo']!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          p['desc']!,
                          style: TextStyle(color: Colors.grey[700], fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}