import 'package:flutter/material.dart';

class CardProduct extends StatelessWidget {
  final String gambar;
  final String name;
  final double harga;

  const CardProduct({
    required this.gambar,
    required this.name,
    required this.harga,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //gambar card
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          child: Image.asset(
            gambar,
            height: 165,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 165,
                width: 165,
                color: Colors.grey.shade300,
                alignment: Alignment.center,
                child: const Icon(Icons.broken_image, size: 50),
              );
            },
          ),
        ),

        Container(
          width: 165,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //nama produk
              Text(
                name,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),

              const SizedBox(height: 4),

              //harga produk
              Text(
                'IDR ${harga.toStringAsFixed(2)}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.blue.shade600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
