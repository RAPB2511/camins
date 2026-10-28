import 'package:camins/styles/app_styles.dart';
import 'package:camins/widgets/stat_item.dart';
import 'package:camins/widgets/tag_chip.dart';
import 'package:flutter/material.dart';

class TrailDetailScreen extends StatelessWidget {
  const TrailDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.background,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          // ZONA 2: TÍTOL (Cabecera con imagen y texto superpuesto)
          Stack(
            children: [
              Image.asset(
                'assets/images/header.jpg',
                height: 320,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              // Degradado oscuro para legibilidad del texto
              Container(
                height: 320,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black87],
                  ),
                ),
              ),
              Positioned(
                bottom: 24,
                left: 20,
                right: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppStyles.orange,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        "PIRINEU · VALL D'ARAN",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    AppStyles.smallSeparator,
                    const Text(
                      'Circuit dels Estanys de\nColomers',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    AppStyles.smallSeparator,
                    Row(
                      children: const [
                        Icon(Icons.star, color: Colors.amber, size: 16),
                        SizedBox(width: 4),
                        Text(
                          '4,8 (126 opinions)',
                          style: TextStyle(color: Colors.white70, fontSize: 13),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          // ZONA 3: FITXA DE DADES
          Transform.translate(
            offset: const Offset(0, -20),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                color: Colors.white,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SizedBox(
                  height: 88,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Expanded(
                        child: StatItem(
                          icon: Icons.alt_route,
                          value: '9,4 km',
                          label: 'Distància',
                        ),
                      ),
                      Expanded(
                        child: StatItem(
                          icon: Icons.trending_up,
                          value: '620 m',
                          label: 'Desnivell',
                        ),
                      ),
                      Expanded(
                        child: StatItem(
                          icon: Icons.schedule,
                          value: '3 h 45',
                          label: 'Durada',
                        ),
                      ),
                      Expanded(
                        child: StatItem(
                          icon: Icons.terrain,
                          value: 'Moderada',
                          label: 'Dificultat',
                          iconColor: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // ZONA 4: SOBRE LA RUTA
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sobre la ruta',
                  style: TextStyle(
                    color: AppStyles.darkText,
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AppStyles.smallSeparator,
                Text(
                  'Una volta circular pel cor del circ de Colomers, amb una desena d\'estanys d\'origen glacial. El camí està ben senyalitzat i la pujada és constant però sense trams tècnics. Ideal per a finals de primavera i estiu.',
                  style: TextStyle(
                    color: AppStyles.greyText,
                    fontSize: 15,
                    height: 1.5,
                  ),
                ),
                AppStyles.mediumSeparator,
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: const [
                    TagChip(icon: Icons.loop, label: 'Circular'),
                    TagChip(icon: Icons.water, label: 'Estanys'),
                    TagChip(icon: Icons.pets, label: 'Gossos permesos'),
                    TagChip(icon: Icons.water_drop, label: 'Font d\'aigua'),
                    TagChip(icon: Icons.cabin, label: 'Refugi'),
                  ],
                ),
                AppStyles.bigSeparator,
              ],
            ),
          ),
          // ZONA 5: FOTOS
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Fotos',
                      style: TextStyle(
                        color: AppStyles.darkText,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Veure-les totes',
                        style: TextStyle(
                          color: AppStyles.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
                AppStyles.smallSeparator,
                // Usamos GridView dentro del ListView con shrinkWrap y physics para evitar overflow
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  children:
                      [
                        'assets/images/lake.jpg',
                        'assets/images/peaks.jpg',
                        'assets/images/forest.jpg',
                        'assets/images/meadow.jpg',
                        'assets/images/waterfall.jpg',
                        'assets/images/sunset.jpg',
                      ].map((imagePath) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(imagePath, fit: BoxFit.cover),
                        );
                      }).toList(),
                ),
                AppStyles.bigSeparator,
              ],
            ),
          ),
          // ZONA 6: ETAPES
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Etapes',
                  style: TextStyle(
                    color: AppStyles.darkText,
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AppStyles.smallSeparator,
                _buildStageItem(
                  '1',
                  'Banys de Tredòs',
                  'Sortida · 1.750 m',
                  '0:00',
                ),
                _buildStageItem(
                  '2',
                  'Refugi de Colomers',
                  '3,1 km · 2.135 m',
                  '1:10',
                ),
                _buildStageItem(
                  '3',
                  'Estany Major',
                  '4,6 km · 2.180 m',
                  '1:45',
                ),
                _buildStageItem(
                  '4',
                  'Estany Obago',
                  '6,2 km · 2.240 m',
                  '2:20',
                ),
                _buildStageItem(
                  '5',
                  'Tornada als Banys',
                  '9,4 km · 1.750 m',
                  '3:45',
                ),
                AppStyles.bigSeparator,
              ],
            ),
          ),
        ],
      ),

      // ZONA 7: BARRA INFERIOR FIJA
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Punt de sortida',
                    style: TextStyle(color: AppStyles.greyText, fontSize: 12),
                  ),
                  Text(
                    'Banys de Tredòs',
                    style: TextStyle(
                      color: AppStyles.darkText,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.download),
                color: AppStyles.darkText,
              ),
              AppStyles.smallSeparator,
              FilledButton.icon(
                onPressed: () {},
                style: FilledButton.styleFrom(
                  backgroundColor: AppStyles.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                ),
                icon: const Icon(Icons.navigation, size: 18),
                label: const Text(
                  'Començar',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Función auxiliar para construir cada etapa de la Zona 6
  Widget _buildStageItem(
    String number,
    String title,
    String subtitle,
    String time,
  ) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: 16,
        backgroundColor: AppStyles.lightGreen,
        child: Text(
          number,
          style: TextStyle(
            color: AppStyles.green,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: AppStyles.darkText,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: AppStyles.greyText, fontSize: 13),
      ),
      trailing: Text(
        time,
        style: TextStyle(color: AppStyles.greyText, fontSize: 13),
      ),
    );
  }
}
