import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BotonPersonalizado(texto: 'Click Me', onPressed: null),
              SizedBox(height: 16),
              BotonInvertido(texto: 'Click Me', onPressed: null),

              SizedBox(height: 32),

              // 🔹 Círculos que ahora son botones
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleButton(
                    color: Color.fromARGB(255, 77, 77, 77), // activo
                    onTap: printCircle1,
                  ),
                  CircleButton(onTap: printCircle2),
                  CircleButton(onTap: printCircle3),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 Funciones de ejemplo para los taps
  static void printCircle1() => print("Círculo 1 presionado");
  static void printCircle2() => print("Círculo 2 presionado");
  static void printCircle3() => print("Círculo 3 presionado");
}

class BotonPersonalizado extends StatelessWidget {
  final String texto;
  final VoidCallback? onPressed;

  const BotonPersonalizado({super.key, required this.texto, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFF3333FF),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF000000).withOpacity(0.2),
              offset: const Offset(0, 4),
              blurRadius: 6,
            ),
          ],
        ),
        child: Text(
          texto,
          style: const TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class BotonInvertido extends StatelessWidget {
  final String texto;
  final VoidCallback? onPressed;

  const BotonInvertido({super.key, required this.texto, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF), // Fondo blanco
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFF3333FF), width: 2),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF000000).withOpacity(0.2),
              offset: const Offset(0, 4),
              blurRadius: 6,
            ),
          ],
        ),
        child: Text(
          texto,
          style: const TextStyle(
            color: Color(0xFF3333FF), // Texto azul
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class CircleButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Color color;

  const CircleButton({super.key, this.onTap, this.color = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 14,
        height: 14,
        margin: const EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}
