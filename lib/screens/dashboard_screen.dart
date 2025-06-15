import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CircleAvatar(
          radius: 20,
          backgroundColor: Color.fromARGB(255, 245, 245, 245),
          child: Text(
            'C',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        title: Text(
          'Hello, Clarence ',
          style: TextStyle(
            fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.notifications_outlined)
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255,12,100,100),
                    Color.fromARGB(255, 2, 47, 58)
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        color: Color.fromARGB(50, 245, 245, 245),
                        padding: EdgeInsets.all(8),
                        child: Image.asset(
                          'assets/icons/credit-card.png',
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Text(
                        'Wallet ballance',
                        style: TextStyle(
                          fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                          color: Theme.of(context).textTheme.bodySmall?.color,
                        ),
                      ),
                      const SizedBox(height: 25,),
                      Row(
                        children: [
                          Text(
                            'KES',
                            style: TextStyle(
                              fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Text(
                            '0.00',
                            style: TextStyle(
                              fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25,),
                      Container(
                        height: 30,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color.fromARGB(50, 245, 245, 245),
                        ),
                        child: Text(
                          '\$ 0.00',
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodySmall?.color,
                            fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}