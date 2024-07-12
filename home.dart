import 'package:cctv_pay/data.dart';
import 'package:cctv_pay/test.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home(
      {super.key, required this.screenWidth, required this.screenHeight});

  final double screenWidth;
  final double screenHeight;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController search = TextEditingController();
  TextEditingController controller = TextEditingController();

  bool sort = true;
  List<Data>? filterData;

  @override
  void dispose() {
    search.dispose();

    super.dispose();
  }

  onsortColum(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        filterData!.sort((a, b) => a.name!.compareTo(b.name!));
      } else {
        filterData!.sort((a, b) => b.name!.compareTo(a.name!));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: widget.screenWidth / 2.0 + 100,
                height: widget.screenHeight - 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 231, 208, 216),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    //รายละเอียด
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('รายการ'),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('รายละเอียด'),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 15, top: 15, right: widget.screenWidth / 3),
                        child: TextField(
                          controller: search,
                          decoration: InputDecoration(
                              labelText: 'รายชื่อที่ค้นหา',
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        width: widget.screenWidth / 2 + 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: PaginatedDataTable(
                          sortColumnIndex: 0,
                          sortAscending: sort,
                          source:
                              RowSource(myData: myData, count: myData.length),
                          rowsPerPage: 10,
                          columnSpacing: 10,
                          columns: [
                            DataColumn(
                              label: const Text('No.'),
                              onSort: (columnIndex, ascending) {
                                setState(() {
                                  sort = !sort;
                                });
                                onsortColum(columnIndex, ascending);
                              },
                            ),
                            const DataColumn(
                              label: Text('Picture'),
                            ),
                            const DataColumn(
                              label: Text('Date'),
                            ),
                            const DataColumn(
                              label: Text('TYpecar'),
                            ),
                            const DataColumn(
                              label: Text('Pax'),
                            ),
                            const DataColumn(
                              label: Text('Remark'),
                            ),
                            const DataColumn(
                              label: Text('Status'),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 50.0,
              ),
              Container(
                width: widget.screenWidth / 3.0,
                height: widget.screenHeight - 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.amber[100],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class RowSource extends DataTableSource {
  var myData;
  final count;
  RowSource({
    required this.myData,
    required this.count,
  });

  @override
  DataRow? getRow(int index) {
    if (index < rowCount) {
      return recentFileDataRow(myData![index]);
    } else
      return null;
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => count;

  @override
  int get selectedRowCount => 0;
}

DataRow recentFileDataRow(var data) {
  return DataRow(
    cells: [
      DataCell(Text(data.name ?? "")),
      DataCell(Text(data.phone.toString())),
      DataCell(Text(data.Age.toString())),
      DataCell(Text(data.date ?? '')),
      DataCell(Text(data.typecar ?? '')),
      DataCell(Text(data.pax.toString())),
      DataCell(Text(data.remark ?? '')),
    ],
  );
}
