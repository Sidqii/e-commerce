import 'package:flutter/material.dart';

class SectionProduct extends StatelessWidget {
  const SectionProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> daftarProduk = [
      {
        'gambar': 'assets/card/card_0.png',
        'name': 'Tas Anyam \'Asa\' | Karya Warga Binaan',
        'harga': 100000.0,
        'deskripsi':
            '''Bukan sekadar tas, ini adalah simbol ketekunan. Setiap helai anyaman pada tas ini dirangkai dengan presisi dan kesabaran oleh tangan-tangan terampil Warga Binaan di dalam Lapas.

\tDibuat dari material daun pandan pilihan yang telah dikeringkan dan diwarnai, tas ini dirancang kuat untuk menemani aktivitas harian Anda, sekaligus memberi sentuhan etnik yang elegan.

\tDengan membeli tas ini, Anda tidak hanya mendapatkan sebuah karya fungsional yang unik, tetapi juga turut mendukung program pembinaan kemandirian dan memberi harapan baru bagi mereka untuk berkarya.''',
      },
      {
        'gambar': 'assets/card/card_1.png',
        'name': 'Batik Tulis \'Nusa\' | Karya Warga Binaan',
        'harga': 200000.0,
        'deskripsi':
            '''Setiap goresan malam di atas kain ini adalah cerita tentang transformasi. Dibuat 100% secara handmade oleh Warga Binaan, batik ini adalah bukti bahwa kreativitas tak bisa dibatasi oleh dinding.

\tMenggunakan kain katun primisima yang halus dan pewarna alami yang ramah lingkungan, motif Sido Asih ini melambangkan harapan akan kehidupan baru yang penuh kasih dan luhur.

\tMiliki sebuah karya seni yang otentik. Pembelian Anda adalah apresiasi langsung terhadap keterampilan mereka dan menjadi bahan bakar semangat bagi mereka untuk memulai lembar baru yang lebih baik.''',
      },
      {
        'gambar': 'assets/card/card_2.png',
        'name': 'Kopi \'Mandiri\' Gayo | Biji Pilihan Warga Binaan',
        'harga': 50000.0,
        'deskripsi':
            '''Secangkir kopi yang memberdayakan. Biji kopi Arabika terbaik dari dataran tinggi Tanah Gayo ini dipilih, disortir, dan di-roasting dengan standar tinggi oleh Warga Binaan yang telah terlatih.

\tKami memastikan setiap biji kopi diproses untuk menghasilkan cita rasa yang kaya dengan notes cokelat, sedikit fruity, dan body yang tebal (medium-to-dark roast).

\tNikmati kopi berkualitas ini sambil mengetahui bahwa tegukan Anda turut berkontribusi dalam program reintegrasi sosial, memberikan mereka bekal keterampilan untuk kembali ke masyarakat.''',
      },
      {
        'gambar': 'assets/card/card_3.png',
        'name': 'Nampan Kayu Jati \'Juang\' | Karya Ukir Warga Binaan',
        'harga': 110000.0,
        'deskripsi':
            '''Dibuat dari kayu Jati solid pilihan, karya ini adalah wujud nyata dari sebuah perubahan. Dikerjakan dengan teliti di bengkel kerja Lapas, setiap detail dan finishing halusnya menunjukkan fokus dan dedikasi.

\tFungsional sebagai nampan saji yang elegan atau dekorasi minimalis yang hangat, produk ini membawa cerita tentang perjuangan dan pembelajaran untuk menjadi lebih baik.

\tMiliki produk ini dan jadilah bagian dari perubahan positif. Anda membantu mengasah keterampilan Warga Binaan, mempersiapkan mereka untuk masa depan yang lebih produktif.''',
      },
      {
        'gambar': 'assets/card/card_4.png',
        'name': 'Lukisan Kanvas \'Ruang\' | Karya Seniman Warga Binaan',
        'harga': 30000.0,
        'deskripsi':
            '''Kanvas ini adalah jendela hati mereka. Sebuah ekspresi jujur yang tertuang melalui sapuan kuas para Warga Binaan di sanggar seni Lapas.

\tMenggunakan cat akrilik di atas kanvas berkualitas, lukisan beraliran Abstrak Kontemporer ini menangkap interpretasi unik sang seniman akan harapan dan kehidupan di balik keterbatasan.

\tDengan mengadopsi karya ini, Anda memberi apresiasi tertinggi pada bakat yang terasah. Setiap pembelian adalah dukungan nyata bagi rehabilitasi melalui seni dan kreativitas.''',
      },
    ];

    int getCrossCount(BuildContext context) {
      final width = MediaQuery.of(context).size.width;

      if (width >= 1000) return 4;

      if (width >= 600) return 3;

      return 2;
    }

    return GridView.builder(
      itemCount: daftarProduk.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: getCrossCount(context),
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 0.80,
      ),
      itemBuilder: (context, index) {
        final item = daftarProduk[index];

        return _CardProduct(
          gambar: item['gambar'] as String,
          produk: item['name'] as String,
          harga: item['harga'] as double,
          deskripsi: item['deskripsi'] as String,
        );
      },
    );
  }
}

class _CardProduct extends StatelessWidget {
  final String gambar;
  final String produk;
  final double harga;
  final String deskripsi;

  const _CardProduct({
    required this.gambar,
    required this.produk,
    required this.harga,
    required this.deskripsi,
  });

  @override
  Widget build(BuildContext context) {
    final heroTag = 'product-$produk-$gambar';

    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return _CardProductDetail(
              heroTag: heroTag,
              gambar: gambar,
              produk: produk,
              harga: harga,
              deskripsi: deskripsi,
            );
          },
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Hero(
            tag: heroTag,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.asset(
                gambar,
                height: 165,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 165,
                    color: Colors.grey.shade300,
                    alignment: Alignment.center,
                    child: const Icon(Icons.broken_image, size: 50),
                  );
                },
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.grey.shade900,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  produk,
                  maxLines: 1,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                ),

                const SizedBox(height: 4),

                Text(
                  'IDR ${harga.toStringAsFixed(0)}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade900,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CardProductDetail extends StatelessWidget {
  final String heroTag;
  final String gambar;
  final String produk;
  final double harga;
  final String deskripsi;

  const _CardProductDetail({
    required this.heroTag,
    required this.gambar,
    required this.produk,
    required this.harga,
    required this.deskripsi,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Hero(
              tag: heroTag,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.asset(
                  gambar,
                  height: 250,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 250,
                      color: Colors.grey.shade300,
                      alignment: Alignment.center,
                      child: const Icon(Icons.broken_image, size: 50),
                    );
                  },
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    produk,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    'IDR ${harga.toStringAsFixed(0)}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade600,
                    ),
                  ),

                  const SizedBox(height: 16),

                  const Divider(),

                  const SizedBox(height: 16),

                  Text(
                    deskripsi,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // actions: [
      //   TextButton(
      //     onPressed: () {
      //       Navigator.of(context).pop();
      //     },
      //     child: const Text('Tutup'),
      //   ),
      // ],
    );
  }
}
