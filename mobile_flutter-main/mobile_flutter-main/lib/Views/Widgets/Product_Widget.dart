import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        height: 500,
        decoration: BoxDecoration(
          border: Border.all(width: 3, color: Colors.red),
        ),
        child: Column(
          children: [
            //Product Image
            Container(
              width: double.infinity,
              height: 200,
              child: Image.asset('assets/images/dog.jpg', fit: BoxFit.fill),
            ),
            //Product name, price, like
            Row(
              children: [
                Column(
                  children: [
                    Text("Product Name: Tea cup dog"),
                    Text("Price: 450\$"),
                  ],
                ),
                Icon(
                  Icons.start,
                  color: Colors.yellow,
                  fontWeight: FontWeight.bold,
                ),
                Text("41"),
              ],
            ),
            //List Icons
            Row(
              children: [
                for (int i = 1; i <= 5; i++)
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                    fontWeight: FontWeight.bold,
                  ),
              ],
            ),
            //Product Description
            Text(
              "Theo ghi nhận của phóng viên Dân trí, dự án được xây dựng trên một khu đất với nhiều hộ dân sinh sống bên trong, ở giữa khu đất là một khu nghĩa trang với hàng trăm ngôi mộ. Phần lớn diện tích khu vực này hiện vẫn còn bị bao phủ bởi đầm lầy, cỏ cây, bụi rậm, khá hoang sơ.",
            ),
          ],
        ),
      ),
    );
  }
}
