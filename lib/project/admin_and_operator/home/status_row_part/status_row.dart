import 'package:flutter/material.dart';

class MyAllComplaintInCount extends StatelessWidget {
  const MyAllComplaintInCount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(
                '50',
                style: TextStyle(
                  color: Colors.orange[500],
                  fontSize: 18,
                ),
              ),
              const Text(
                'new',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Column(
            children: const [
              Text(
                '60',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                ),
              ),
              Text(
                'process',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Column(
            children: const [
              Text(
                '48',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                ),
              ),
              Text(
                'pending',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Column(
            children: const [
              Text(
                '50560',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 18,
                ),
              ),
              Text(
                'completed',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
