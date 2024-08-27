import 'package:flutter/material.dart';
import 'package:valuable/services/constants.dart';
import 'package:logger/logger.dart';

final _logger = Logger();


class NumericKeypad extends StatefulWidget {
  const NumericKeypad({super.key});

  @override
  State<NumericKeypad> createState() => _NumericKeypadState();
}

class _NumericKeypadState extends State<NumericKeypad> {
  
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _remarkController = TextEditingController();

  static const String ok = 'OK';
  static const String clear = 'CE';

  int? _value = 1;

  final List<CostCategory> _categories = [
    CostCategory(categoryName: '工资', id: 6, icon: 'search'),
    CostCategory(categoryName: '租金', id: 7, icon: 'search'),
    CostCategory(categoryName: '保险费', id: 8, icon: 'search'),
    CostCategory(categoryName: '设备维护费', id: 9, icon: 'search'),
  ];

  void _handleKeyPress(String character) {
    Feedback.forTap(context);
    setState(() {
      if (character == clear) {
        if (_controller.text.isNotEmpty) {
          _controller.text =
              _controller.text.substring(0, _controller.text.length - 1);
        }
      } else if (character == ok) {
        if (_controller.text.isEmpty) {
          return;
        }
        if (double.tryParse(_controller.text) == null) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Warning!"),
                  content: Text("输入的字符串: ${_controller.text} 不是合法的数字"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("我知道了"))
                  ],
                );
              });
          return;
        }

        const snackBar = SnackBar(
          backgroundColor: Colors.green,
          content: Text('添加成功!'),
          duration: Duration(seconds: 2), // 设置提示框显示的时长
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        // Handle OK button press, for example, by printing the text
        _logger.i("Confirmed text: ${_controller.text}");

        _controller.text = '';
      } else {
        _controller.text += character;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 1,
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: IconButton(onPressed: (){
                          Navigator.of(context).pop();
                        }, icon: const Icon(Icons.close)))),
                const Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("支出"),
                              Text("收入"),
                              Text("不计入收支"),
                            ],
                          )),
                      Expanded(
                          flex: 3,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text("日期"),
                          )),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                        labelText: '输入金额',
                        prefixIcon: Padding(
                          padding: EdgeInsets.fromLTRB(10, 5, 0, 10),
                          child: Text('¥',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.iconColor)),
                        ),
                        border: OutlineInputBorder()),
                    enabled: false,
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: Wrap(
                      runSpacing: 5.0,
                      spacing: 5.0,
                      children: [
                        ..._categories
                            .map((toElement) =>
                                _buildCostCategoryList(toElement))
                            .toList(),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                      child: _buildNoteButton(),
                    )),
                SizedBox(
                    height: 284,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                            flex: 5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    _buildButton('1', 1, 65, 90),
                                    _buildButton('2', 1, 65, 90),
                                    _buildButton('3', 1, 65, 90),
                                  ],
                                ),
                                Row(
                                  children: [
                                    _buildButton('4', 1, 65, 90),
                                    _buildButton('5', 1, 65, 90),
                                    _buildButton('6', 1, 65, 90),
                                  ],
                                ),
                                Row(
                                  children: [
                                    _buildButton('7', 1, 65, 90),
                                    _buildButton('8', 1, 65, 90),
                                    _buildButton('9', 1, 65, 90),
                                  ],
                                ),
                                Row(
                                  children: [
                                    _buildButton('0', 2, 65, 90),
                                    _buildButton('.', 1, 65, 90),
                                  ],
                                )
                              ],
                            )),
                        Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                _buildButton(clear, 1, 55, 100),
                                _buildButton(ok, 2, 55, 100),
                              ],
                            ))
                      ],
                    ))
              ],
            )),);
  }

  Widget _buildNoteButton() {
      _logger.i("添加备注");
    if(_remarkController.text.isEmpty) {
      return Row(
          mainAxisAlignment: MainAxisAlignment.start,
        children: [
            TextButton(onPressed: (){
              _showAddNoteDialog();
              }, 
              child: const Align(alignment: Alignment.bottomLeft, 
                child: Text("添加备注", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),)),
            Text(_remarkController.text, style: const TextStyle(fontSize: 16)),
          ],);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
      Text(_remarkController.text, style: const TextStyle(fontSize: 16)),
      TextButton(onPressed: (){
            _showAddNoteDialog();
          }, child: const Align(alignment: Alignment.bottomLeft, 
          child: Text("修改", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),)),
    ],);
  }

  void _showAddNoteDialog() {
    showDialog(context: context, builder: (context) {
        return AlertDialog(content: TextField(
          controller: _remarkController,
        ), title: const Text("请输入备注:"),
        actions: [
          TextButton(onPressed: () {
            Navigator.of(context).pop();
            setState(() {
              _remarkController.text = _remarkController.text;
            });
          }, child: const Text("保存"))
        ],);
    });
  }

  Widget _buildCostCategoryList(CostCategory item) {
    return ChoiceChip(
      label: Text(item.categoryName),
      avatar: const Icon(Icons.search),
      selected: _value == item.id,
      onSelected: (bool selected) {
        setState(() {
          _value = selected ? item.id : null;
        });
      },
    );
  }

  Widget _buildButton(String character, int flex, double height, double width) {
    Color confirmedColor = Colors.green;
    Color clearColor = Colors.red;

    Color defaultColor = AppColors.iconColor;
    if (character == ok) {
      defaultColor = confirmedColor;
    }
    if (character == clear) {
      defaultColor = clearColor;
    }
    return Expanded(
        flex: flex,
        child: Padding(
          padding: const EdgeInsets.all(3),
          child: SizedBox(
            width: width,
            height: height,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all(defaultColor), // 设置背景颜色
                  shape: WidgetStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)))),
              onPressed: () => _handleKeyPress(character),
              child: Text(character, style: const TextStyle(fontSize: 24)),
            ),
          ),
        ));
  }
}

class CostCategory {
  CostCategory(
      {required this.id, required this.categoryName, required this.icon});
  int id;
  String categoryName;
  String description = '';
  int sortOrder = 0;
  String icon;
  late int parentId;
}
