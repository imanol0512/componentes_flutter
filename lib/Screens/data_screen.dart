import 'package:flutter/material.dart';
import 'package:practica3/Screens/notifications_screen.dart';
import 'package:practica3/models/data.dart';
import 'package:practica3/screens/home_screen.dart';
import 'package:practica3/screens/images_screen.dart';
import 'package:practica3/screens/infinite_scroll_screen.dart';
import 'package:practica3/theme/app_theme.dart';

class DataScreen extends StatefulWidget {
  final Data datos;
  const DataScreen({super.key, required this.datos});

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  int indexNavigation = 0;
  bool switchValue = false;

  TextEditingController counterTxt = TextEditingController();

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
        title: const Text('Datos'),
      ),
      body: Column(
        children: [
          entradaNombre(),
          entrdaLikedFlutter(),
          preferDev(),
          howmuchlike(),
          runapps(),
          navegador(),
          emulador(),
          smartphone(),
        ],
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
            label: 'Lista',
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
            icon: Icon(Icons.door_back_door_rounded),
            label: 'Salir',
          ),
        ],
      ),
    );
  }

  Row entradaNombre() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          'Tu Nombre es:',
          style: AppTheme.lightTheme.textTheme.headlineLarge,
        ),
        Text(
          widget.datos.nombre!,
          style: AppTheme.lightTheme.textTheme.headlineSmall,
        ),
      ],
    );
  }

  Row entrdaLikedFlutter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          'Te gusta Flutter:',
          style: AppTheme.lightTheme.textTheme.headlineLarge,
        ),
        // Espacio en blanco de 20 puntos
        Text(
          widget.datos.gustoFlutter.toString(),
          style: AppTheme.lightTheme.textTheme.headlineSmall,
        ),
      ],
    );
  }

  Row howmuchlike() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          'Te gusta tanto flutter:',
          style: AppTheme.lightTheme.textTheme.headlineLarge,
        ),
        Text(
          widget.datos.califFlutter.toString(),
          style: AppTheme.lightTheme.textTheme.headlineSmall,
        ),
      ],
    );
  }

  Row preferDev() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          'Prefieres desarrollar en:',
          style: AppTheme.lightTheme.textTheme.headlineLarge,
        ),
        Text(
          widget.datos.movilDev.toString(),
          style: AppTheme.lightTheme.textTheme.headlineSmall,
        ),
      ],
    );
  }

  Column runapps() {
    return Column(
      children: [
        Text(
          'Prefieres correr tus apps en:',
          style: AppTheme.lightTheme.textTheme.headlineLarge,
        ),
      ],
    );
  }

  Row navegador() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          'Navegador:',
          style: AppTheme.lightTheme.textTheme.headlineLarge,
        ),
        Text(
          widget.datos.web.toString(),
          style: AppTheme.lightTheme.textTheme.headlineSmall,
        ),
      ],
    );
  }

  Row emulador() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          'Emulador:',
          style: AppTheme.lightTheme.textTheme.headlineLarge,
        ),
        Text(
          widget.datos.emulador.toString(),
          style: AppTheme.lightTheme.textTheme.headlineSmall,
        ),
      ],
    );
  }

  Row smartphone() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          'Smartphone:',
          style: AppTheme.lightTheme.textTheme.headlineLarge,
        ),
        Text(
          widget.datos.smartphone.toString(),
          style: AppTheme.lightTheme.textTheme.headlineSmall,
        ),
      ],
    );
  }
}
