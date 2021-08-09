import 'package:flutter/material.dart';
import 'package:mobiletest/domain/product.dart';

class MenuCari extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    List<Products> products = [
      Products("Obat Mujarab", "Dapat Menyembuhkan penyakit walau belum diminum"),
      // _Products("Title 2", "ini keterangan 2"),
      // _Products("Title 3", "ini keterangan 3"),
      // _Products("Title 4", "ini keterangan 4"),
    ];
    return Scaffold(
        body: Center(
            child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return
                    /*Card(
              child: ListTile(
                  title: Text(products[index].title),
                  subtitle: Text(products[index].description),
                  leading: CircleAvatar(
                      backgroundColor: Colors.grey
                  ),
                  trailing: Icon(Icons.verified_user_outlined)));
             */
                    Card(
                        clipBehavior: Clip.antiAlias,
                        child: Column(
                          children: [
                            ListTile(
                              //leading: Icon(Icons.arrow_drop_down_circle),
                              title: Text(products[index].title),
                              subtitle: Text(
                                products[index].description,
                                style: TextStyle(color: Colors.black.withOpacity(0.6)),
                              ),
                            ),
                            Image.asset('assets/png/efway_medicine.png',
                                width: 300,
                                fit:BoxFit.fill),
                            ButtonBar(
                              alignment: MainAxisAlignment.start,
                              children: [
                                TextButton(
                                  style: TextButton.styleFrom(
                                    primary: const Color(0xFF6200EE),
                                  ),
                                  onPressed: () {
                                    // Perform some action
                                  },
                                  child: Row(
                                    children: <Widget>[
                                      Icon(Icons.shopping_cart),
                                      Text('Tambah Ke Keranjang')
                                    ]
                                  ),
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    primary: const Color(0xFF6200EE),
                                  ),
                                  onPressed: () {
                                    // Perform some action
                                  },
                                  child: Row(
                                      children: <Widget>[
                                        Icon(Icons.add_circle_sharp),
                                        Text('Add Wishlist')
                                      ]
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                    );
                })
        )
    );
  }
}

