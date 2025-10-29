import 'package:e_commerce/apps/widget/section/section_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/apps/widget/bloc/search/search_bloc.dart';
import 'package:e_commerce/apps/widget/bloc/search/search_event.dart';
import 'package:e_commerce/apps/widget/bloc/search/search_state.dart';
import 'package:e_commerce/apps/widget/section/section_banner.dart';

class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  // final List<Map<String, dynamic>> _daftarProduk = [
  //   {
  //     'gambar': 'assets/card/card_0.png',
  //     'name': 'Tas Anyam',
  //     'harga': 100000.0,
  //   },
  //   {
  //     'gambar': 'assets/card/card_1.png',
  //     'name': 'Kemeja Batik',
  //     'harga': 200000.0,
  //   },
  //   {
  //     'gambar': 'assets/card/card_2.png',
  //     'name': 'Kopi Bubuk Nusantara',
  //     'harga': 50000.0,
  //   },
  //   {
  //     'gambar': 'assets/card/card_3.png',
  //     'name': 'Rak Kayu Kecil',
  //     'harga': 110000.0,
  //   },
  //   {
  //     'gambar': 'assets/card/card_4.png',
  //     'name': 'Lukisan Canvas',
  //     'harga': 30000.0,
  //   },
  // ];

  // int getCrossCount(BuildContext context) {
  //   final width = MediaQuery.of(context).size.width;

  //   if (width >= 1000) return 4;

  //   if (width >= 600) return 3;

  //   return 2;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_bag_outlined,
                color: Colors.grey.shade900,
              ),
            ),

            Expanded(
              child: SizedBox(
                height: 35,
                child: BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) {
                    return TextField(
                      onChanged: (value) {
                        context.read<SearchBloc>().add(SearchTextField(value));
                      },
                      decoration: InputDecoration(
                        hintText: 'Cari ...',
                        hintStyle: const TextStyle(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 20,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.zero,
                        fillColor: Colors.grey.shade900,
                        filled: true,
                      ),
                    );
                  },
                ),
              ),
            ),

            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add_shopping_cart_outlined,
                color: Colors.grey.shade900,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionBanner(),

            const SizedBox(height: 10),

            const Text(
              'Produk Terpopuler',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 5),

            SectionProduct()

            // GridView.builder(
            //   itemCount: _daftarProduk.length,
            //   shrinkWrap: true,
            //   physics: const NeverScrollableScrollPhysics(),
            //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: getCrossCount(context),
            //     crossAxisSpacing: 20,
            //     mainAxisSpacing: 20,
            //     childAspectRatio: 0.80,
            //   ),
            //   itemBuilder: (context, index) {
            //     final item = _daftarProduk[index];

            //     return CardProduct(
            //       gambar: item['gambar'],
            //       name: item['name'],
            //       harga: item['harga'],
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
