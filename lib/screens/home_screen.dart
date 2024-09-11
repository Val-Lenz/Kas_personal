import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kas_personal/providers/kas_provider.dart';
import 'package:kas_personal/widgets/card_kas_info_all.dart';
import 'package:kas_personal/widgets/creator.info.dart';
import 'package:kas_personal/widgets/custom_icon_button.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void onKasMasukTap() => context.goNamed('kas_masuk');
  void onKasKeluarTap() => context.goNamed('kas_keluar');
  void onSemuaTransaksi() => context.goNamed('semua_transaksi');

  void onInfoTap() async {
    await showDialog(
      context: context,
      builder: (context) {
        return const Dialog(
          child: CreatorInfo(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kas Personal Valen'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Consumer<KasProvider>(
              builder: (context, value, child) {
                final items = value.items;
                return CardKasInfoAll(items: items);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Divider(
              color: Colors.grey.shade200,
              height: 0,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: CustomIconButton(
                    backgroundColor: const Color.fromARGB(255, 7, 238, 255),
                    icon: Icons.credit_card,
                    text: 'kas masuk',
                    onTap: onKasMasukTap,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: CustomIconButton(
                    backgroundColor: const Color.fromARGB(255, 7, 238, 255),
                    icon: Icons.receipt,
                    text: 'Kas Keluar',
                    onTap: onKasKeluarTap,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            CustomIconButton(
              backgroundColor: const Color.fromARGB(255, 7, 238, 255),
              icon: Icons.monetization_on,
              text: 'Lihat Semua Transaksi',
              onTap: onSemuaTransaksi,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomIconButton(
              backgroundColor: const Color.fromARGB(255, 7, 238, 255),
              icon: Icons.info,
              text: 'Tentang Pembuat',
              onTap: onInfoTap,
            ),
          ],
        ),
      ),
    );
  }
}
