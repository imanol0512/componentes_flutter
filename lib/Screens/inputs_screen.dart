import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practica3/Screens/data_screen.dart';
import 'package:practica3/Screens/home_screen.dart';
import 'package:practica3/Screens/images_screen.dart';
import 'package:practica3/Screens/infinite_scroll_screen.dart';
import 'package:practica3/Screens/notifications_screen.dart';
import 'package:practica3/models/data.dart';
import 'package:practica3/theme/app_theme.dart';

class InputsScreen extends StatefulWidget {
  const InputsScreen({super.key});

  @override
  State<InputsScreen> createState() => _InputsScreenState();
}

class _InputsScreenState extends State<InputsScreen> {
  String? nombre;
  bool switchValue = false; //controlar el widget switch
  double sliderValue = 0.0;
  String? radioSelect;
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  int indexNavigation = 0;

  openScreen(int index, BuildContext context) {
    MaterialPageRoute ruta =
        MaterialPageRoute(builder: (context) => const HomeScreen());
    switch (index) {
      case 0:
        ruta = MaterialPageRoute(builder: (context) => const HomeScreen());
        break;
      case 1:
        ruta = MaterialPageRoute(
            builder: (context) => const InfiniteScrollScreen());
        break;
      case 2:
        ruta = MaterialPageRoute(
            builder: (context) => const NotificacionsScreen());
        break;
      case 3:
        ruta = MaterialPageRoute(builder: (context) => const ImagesScreen());
        break;

      case 4: //Comportamiento aplicable solo a moviles
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    }
    setState(() {
      indexNavigation = index;
      Navigator.push(context, ruta);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entradas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            entradaNombre(),
            entradaSwitch(),
            entradaSlider(),
            entradaRadio(),
            Text(
              '¿qué usas para correr tus apps?',
              style: AppTheme.lightTheme.textTheme.headlineLarge,
            ),
            entradasCheck(),
            ElevatedButton(
              onPressed: () {
                Data data = Data(
                    nomb: nombre!,
                    gusto: switchValue,
                    calif: sliderValue.round(),
                    movil: radioSelect!,
                    nav: isChecked1,
                    emul: isChecked2,
                    phone: isChecked3);
                MaterialPageRoute ruta = MaterialPageRoute(
                    builder: (context) => DataScreen(
                          datos: data,
                        ));
                Navigator.push(context, ruta);
              },
              child: const Text(
                'Guardar',
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: indexNavigation,
          backgroundColor: AppTheme.primaryColor,
          unselectedItemColor: AppTheme.backColor,
          selectedItemColor: AppTheme.backColor,
          onTap: (index) => openScreen(index, context),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'lista',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notification_add),
              label: 'Notificaciones',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.image),
              label: 'Imagenes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.exit_to_app),
              label: 'Salida',
            ),
          ]),
    );
  }

  TextField entradaNombre() {
    return TextField(
      style: AppTheme.lightTheme.textTheme.headlineMedium,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        labelText: 'Escribe tu nombre: ',
        labelStyle: AppTheme.lightTheme.textTheme.headlineLarge,
      ),
      onChanged: (text) => nombre = text,
    );
  }

  Row entradaSwitch() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          '¿Te gusta flutter?',
          style: AppTheme.lightTheme.textTheme.headlineLarge,
        ),
        Switch(
            value: switchValue,
            onChanged: (value) {
              setState(() {
                switchValue = value;
              });
            }),
      ],
    );
  }

  Column entradaSlider() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Indica que tanto te gusta flutter: ',
          style: AppTheme.lightTheme.textTheme.headlineLarge,
        ),
        Slider(
            min: 0.0,
            max: 10.0,
            activeColor: AppTheme.secondaryColor,
            thumbColor: AppTheme.primaryColor,
            inactiveColor: AppTheme.backColor,
            value: sliderValue,
            divisions: 10,
            label: '${sliderValue.round()}',
            onChanged: (value) {
              setState(() {
                sliderValue = value;
              });
            }),
      ],
    );
  }

  Column entradaRadio() {
    return Column(
      children: [
        Text(
          '¿Qué prefieres para desarrollo móvil?',
          style: AppTheme.lightTheme.textTheme.headlineLarge,
        ),
        ListTile(
          title: Text(
            'Kotlin',
            style: AppTheme.lightTheme.textTheme.bodySmall,
          ),
          leading: Transform.scale(
            scale: 1.5,
            child: Radio(
              value: 'Kotlin',
              groupValue: radioSelect,
              onChanged: (value) {
                setState(() {
                  radioSelect = value!;
                });
              },
            ),
          ),
        ),
        ListTile(
          title: Text(
            'Flutter',
            style: AppTheme.lightTheme.textTheme.bodySmall,
          ),
          leading: Transform.scale(
            scale: 1.5,
            child: Radio(
              value: 'Flutter',
              groupValue: radioSelect,
              onChanged: (value) {
                setState(() {
                  radioSelect = value!;
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  Row entradasCheck() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Navegador',
          style: AppTheme.lightTheme.textTheme.bodySmall,
        ),
        Transform.scale(
          scale: 1.5,
          child: Checkbox(
            value: isChecked1,
            onChanged: (value) {
              setState(() {
                isChecked1 = value!;
              });
            },
          ),
        ),
        Text(
          'Emulador',
          style: AppTheme.lightTheme.textTheme.bodySmall,
        ),
        Transform.scale(
          scale: 1.5,
          child: Checkbox(
            value: isChecked2,
            onChanged: (value) {
              setState(() {
                isChecked2 = value!;
              });
            },
          ),
        ),
        Text(
          'Smartphone',
          style: AppTheme.lightTheme.textTheme.bodySmall,
        ),
        Transform.scale(
          scale: 1.5,
          child: Checkbox(
            value: isChecked3,
            onChanged: (value) {
              setState(() {
                isChecked3 = value!;
              });
            },
          ),
        ),
      ],
    );
  }
}
