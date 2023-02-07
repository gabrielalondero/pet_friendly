import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:pet_friendly/screens/home/home_screen.dart';
import 'package:pet_friendly/screens/widgets/custom_app_bar.dart';
import 'package:pet_friendly/shared/all_colors.dart';
import 'package:pet_friendly/stores/connectivity_store.dart';
import 'package:pet_friendly/stores/home_store.dart';

class OfflineScreen extends StatefulWidget {
  const OfflineScreen({super.key});

  @override
  State<OfflineScreen> createState() => _OfflineScreenState();
}

class _OfflineScreenState extends State<OfflineScreen> {
  final color = AllColors();

  final ConnectivityStore connectivityStore = GetIt.I<ConnectivityStore>();

  @override
  void initState() {
    super.initState();
    when((_) => connectivityStore.connected, () async {
      Navigator.of(context).canPop()
          ? Navigator.of(context).pop()
          : {
            //se não tem nenhuma tela para dar pop, o app iniciou sem conexão. então inicia os dados e vai para a Home
              await GetIt.I<HomeStore>().initData(),
              Navigator.of(context).pushReplacement(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const HomeScreen(),
                ),
              ),
            };
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        backgroundColor: color.backgroundColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CustomAppBar(
            color: color.backgroundColor,
            leadingVisibility: false,
          ),
        ),
        extendBodyBehindAppBar: true,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              child: Text(
                'No connection.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: color.textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Icon(
              Icons.cloud_off,
              color: color.pinkLight,
              size: 150,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              child: Text(
                'Please, check your internet connection.',
                textAlign: TextAlign.center,
                style: TextStyle(color: color.textColor, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
