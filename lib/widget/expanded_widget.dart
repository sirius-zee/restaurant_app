import 'package:flutter/material.dart';

class ExpandedWidget extends StatefulWidget {
  final String text;
  const ExpandedWidget({super.key, required this.text});

  @override
  ExpandedWidgetState createState() => ExpandedWidgetState();
}

class ExpandedWidgetState extends State<ExpandedWidget> {
  late String collapsedText;
  late String expandText;
  bool collexp = true;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > 150) {
      collapsedText = widget.text.substring(0, 150);
      expandText = widget.text.substring(151, widget.text.length);
    } else {
      collapsedText = widget.text;
      expandText = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: expandText == ''
          ? Text(widget.text)
          : Column(
              children: [
                Text(
                  collexp ? "$collapsedText..." : widget.text,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Colors.black54),
                ),
                const SizedBox(height: 5),
                InkWell(
                  onTap: () {
                    setState(() {
                      collexp = !collexp;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        collexp
                            ? Icons.keyboard_arrow_down_rounded
                            : Icons.keyboard_arrow_up_rounded,
                      ),
                      Text(
                        collexp ? "Expand" : "Collapse",
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
