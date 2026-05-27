import 'package:flutter/material.dart';
import 'package:exam/Views/Pages/ProductDetailPage.dart';

class ProductWidgetStateFull extends StatefulWidget {
  ProductWidgetStateFull({super.key});

  @override
  State<ProductWidgetStateFull> createState() => _ProductWidgetStateFullState();
}

class _ProductWidgetStateFullState extends State<ProductWidgetStateFull> {
  int _cout = 0;
  OnPressCount() {
    setState(() {
      _cout++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 500,
        /*decoration: BoxDecoration(
          border: Border.all(width: 3, color: Colors.red),
        ),*/
        child: Card(
          child: Column(
            children: [
              //Ảnh sản phẩm
              Expanded(
                flex: 7,
                child: Container(
                  width: double.infinity,
                  height: 300,
                  child: Stack(
                    // alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 300,
                        child: Image.asset(
                          "assets/images/dog.jpg",
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                        top: 200,
                        left: 200,

                        child: FloatingActionButton.extended(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetail(),
                              ),
                            );
                          },
                          label: Text("Add to cart"),
                          icon: Icon(Icons.shopping_cart),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //Tên sản phẩm
              SizedBox(height: 15),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Product Name: Tea Cup"),
                          Text("Price: 300\$"),
                        ],
                      ),
                    ),

                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                _cout++;
                              });
                            },
                            icon: Icon(Icons.star, color: Colors.yellow),
                          ),
                          Text(_cout.toString()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 15),
              //Mô tả sản phẩm
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: SingleChildScrollView(
                      child: Text(
                        "Anh Tiến Đạt (Thành viên đồng sáng lập quán cà phê), cho biết khi nhóm lên ý tưởng kinh doanh cũng là lúc cơ quan chức năng của Hà Nội tăng cường lập lại trật tự vỉa hè. Xác định không được tận dụng vỉa hè cho khách ngồi, cả nhóm quyết định điều chỉnh thiết kế nhằm thích ứng một cách lâu dài. Anh Tiến Đạt (Thành viên đồng sáng lập quán cà phê), cho biết khi nhóm lên ý tưởng kinh doanh cũng là lúc cơ quan chức năng của Hà Nội tăng cường lập lại trật tự vỉa hè. Xác định không được tận dụng vỉa hè cho khách ngồi, cả nhóm quyết định điều chỉnh thiết kế nhằm thích ứng một cách lâu dài. ",
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Productwidget extends StatelessWidget {
  Productwidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 500,
        /*decoration: BoxDecoration(
          border: Border.all(width: 3, color: Colors.red),
        ),*/
        child: Card(
          child: Column(
            children: [
              //Ảnh sản phẩm
              Expanded(
                flex: 7,
                child: Container(
                  width: double.infinity,
                  height: 300,
                  child: Stack(
                    // alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 300,
                        child: Image.asset(
                          "assets/images/dog.jpg",
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                        top: 200,
                        left: 200,

                        child: FloatingActionButton.extended(
                          onPressed: () {},
                          label: Text("Add to cart"),
                          icon: Icon(Icons.shopping_cart),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //Tên sản phẩm
              SizedBox(height: 15),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Product Name: Tea Cup"),
                          Text("Price: 300\$"),
                        ],
                      ),
                    ),

                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          IconButton(onPressed: () {}, icon: Icon(Icons.star)),
                          Text("41"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 15),
              //Mô tả sản phẩm
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: SingleChildScrollView(
                      child: Text(
                        "Anh Tiến Đạt (Thành viên đồng sáng lập quán cà phê), cho biết khi nhóm lên ý tưởng kinh doanh cũng là lúc cơ quan chức năng của Hà Nội tăng cường lập lại trật tự vỉa hè. Xác định không được tận dụng vỉa hè cho khách ngồi, cả nhóm quyết định điều chỉnh thiết kế nhằm thích ứng một cách lâu dài. Anh Tiến Đạt (Thành viên đồng sáng lập quán cà phê), cho biết khi nhóm lên ý tưởng kinh doanh cũng là lúc cơ quan chức năng của Hà Nội tăng cường lập lại trật tự vỉa hè. Xác định không được tận dụng vỉa hè cho khách ngồi, cả nhóm quyết định điều chỉnh thiết kế nhằm thích ứng một cách lâu dài. ",
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
