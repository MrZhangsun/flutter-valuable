import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:intl/intl.dart';
import 'package:valuable/services/constants.dart';
import 'keyboard.dart';

final _logger = Logger();

class CreateBusinssPage extends StatefulWidget {
  final String projectName;
  const CreateBusinssPage({Key? key, required this.projectName})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _CreateBusinssPageState();
}

class _CreateBusinssPageState extends State<CreateBusinssPage> {
  final TextEditingController _businessNameController = TextEditingController();
  final TextEditingController _industryController = TextEditingController();
  final TextEditingController _initialInvestmentController =
      TextEditingController();
  final TextEditingController _initialAddressController =
      TextEditingController();
  // Dynamic list for costs
  final List<CostItem> _costs = [
    CostItem(category: '餐饮', amount: 1.4, mark: '请客吃饭'),
    CostItem(category: '住宿', amount: 1.4, mark: '请客吃饭'),
    CostItem(category: '出行', amount: 1.4, mark: '请客吃饭'),
    CostItem(category: '餐饮', amount: 1.4, mark: '请客吃饭'),
    CostItem(category: '住宿', amount: 1.4, mark: '请客吃饭'),
    CostItem(category: '出行', amount: 1.4, mark: '请客吃饭'),
    CostItem(category: '餐饮', amount: 1.4, mark: '请客吃饭'),
    CostItem(category: '住宿', amount: 1.4, mark: '请客吃饭'),
    CostItem(category: '出行', amount: 1.4, mark: '请客吃饭'),
    CostItem(category: '旅游', amount: 1.4, mark: '请客吃饭')
  ];

  static const List<(Color?, Color? background, ShapeBorder?)> customizations =
      <(Color?, Color?, ShapeBorder?)>[
    (null, null, null), // The FAB uses its default for null parameters.
    (null, Colors.green, null),
    (Colors.white, Colors.green, null),
    (Colors.white, Colors.green, CircleBorder()),
  ];
  int index = 0; // Selects the customization.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.projectName),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(35.0, 10, 35, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBasicInfoSection(),
            const SizedBox(height: 20.0),
            _buildCostsSection(),
            const SizedBox(height: 20.0),
            _buildSubmitButton(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddItemBottomSheet();
          setState(() {
            index = (index + 1) % customizations.length;
          });
        },
        foregroundColor: customizations[index].$1,
        backgroundColor: customizations[index].$2,
        shape: customizations[index].$3,
        child: const Text("添加"),
      ),
    );
  }

  // Basic Information Section
  Widget _buildBasicInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '基本信息',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        Table(
          columnWidths: const {
            0: FlexColumnWidth(4),
            1: FlexColumnWidth(1),
            2: FlexColumnWidth(4),
          },
          children: [
            TableRow(children: [
              TableCell(
                child: TextField(
                  controller: _businessNameController,
                  decoration: const InputDecoration(labelText: '生意名称'),
                ),
              ),
              const TableCell(
                  child: SizedBox(
                width: 10,
              )),
              TableCell(
                child: TextField(
                  controller: _industryController,
                  decoration: const InputDecoration(labelText: '行业'),
                ),
              )
            ]),
            TableRow(children: [
              TableCell(
                  child: TextField(
                controller: _initialInvestmentController,
                decoration: const InputDecoration(labelText: '初始投资金额'),
                keyboardType: TextInputType.number, // 选择数字键盘
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (value) {
                  // 处理输入的数字
                },
              )),
              const TableCell(
                  child: SizedBox(
                width: 10,
              )),
              TableCell(
                child: TextField(
                  controller: _initialAddressController,
                  decoration: const InputDecoration(labelText: '经营地址'),
                  keyboardType: TextInputType.number,
                ),
              )
            ])
          ],
        ),
      ],
    );
  }

  // Costs Section with Dynamic List
  Widget _buildCostsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '成本信息',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10.0),
        ..._costs.map((costItem) => _buildCostItem(costItem)).toList(),
        const SizedBox(height: 100.0),
      ],
    );
  }

  // Cost Item Widget
  Widget _buildCostItem(CostItem costItem) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.food_bank,
                      size: 40,
                      color: AppColors.iconColor,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      verticalDirection: VerticalDirection.down,
                      children: [
                        Text(costItem.category),
                        Row(
                          children: [
                            Text(
                              costItem.recordTime,
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.black45),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              "|",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.black45),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              costItem.mark,
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.black45),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                Text(
                  costItem.amount.toString(),
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            const Divider(
              color: Colors.black12,
              height: 16,
            )
          ],
        ));
  }

  // Submit Button
  Widget _buildSubmitButton() {
    return Center(
      child: ElevatedButton(
        onPressed: _submitAnalysis,
        child: const Text('提交分析'),
      ),
    );
  }

  void _change() {}
  // Add a new cost item
  void _showAddItemBottomSheet() {

    showModalBottomSheet(
      context: context,
      builder: (context) {
        var width = MediaQuery.of(context).size.width;
        var height = MediaQuery.of(context).size.height;

        _logger.i("屏幕宽度: $width, 高度: $height");
        return SizedBox(
          height: height * 0.8,
          width: double.infinity,
          child: const NumericKeypad(),
        );
      },

      isDismissible: false,
      isScrollControlled: true, 
    );
    setState(() {
      // _costs.add(CostItem());
    });
  }

  // Submit the analysis
  void _submitAnalysis() {
    // Here you can collect and validate data, then proceed with the analysis
    // For example, you can send the data to a backend or perform local calculations
    // Show a message or navigate to another page after submitting
  }
}

// Class to represent a cost item
class CostItem {
  CostItem({required this.category, this.mark = '', required this.amount});
  // 备注
  String mark;
  // 分类
  String category;
  // 面值
  double amount;
  // 记录时间
  String recordTime = DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now());
}
