import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Map<String, String>> financialServices = [
    {
      "title": "Send Money",
      "icon": "assets/icons/send.png",
    },
    {
      "title": "Buy Goods",
      "icon": "assets/icons/buy-goods.png",
    },
    {
      "title": "Paybill",
      "icon": "assets/icons/paybill.png",
    },
    {
      "title": "Airtime",
      "icon": "assets/icons/airtime.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 15,
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
        ),
        title: Text(
          'Hello, Clarence 👋',
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 200,
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
                  padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(50, 245, 245, 245),
                              borderRadius: BorderRadius.circular(8)
                            ),
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.symmetric(vertical: 8),
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
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 15,),
                          Row(
                            children: [
                              Text(
                                'KES',
                                style: TextStyle(
                                  fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 10,),
                              Text(
                                '0.00',
                                style: TextStyle(
                                  fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15,),
                          Container(
                            height: 35,
                            width: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(50, 245, 245, 245),
                            ),
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              '\$ 0.00',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                              ),
                            ),
                          )
                        ],
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(50, 245, 245, 245),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: IconButton(
                            onPressed: (){}, 
                            icon: Icon(Icons.visibility, color: Colors.white,)
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 15,),
            
                //Financial Services
                Container(
                  height: 210,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.light ? Color.fromARGB(255, 245, 245,245) : Colors.grey[600],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Financial Services',
                            style: TextStyle(
                              fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white,
                            ),
                          ),
                          Spacer(),
                          //Selector dropdown for countries
                          DropdownButton<String>(
                            iconEnabledColor: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white,
                            dropdownColor: Theme.of(context).brightness == Brightness.light ? Colors.white : Colors.grey[600],
                            value: 'Kenya',
                            items: <String>['Kenya', 'Uganda', 'Tanzania'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(
                                    fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {},
                          ),
                        ],
                      ),
                      //get three items per row in the grid
                      Expanded(
                        child: GridView.builder(
                          itemCount: financialServices.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 30.0,
                            mainAxisSpacing: 0,
                          ),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor.withAlpha(100),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  padding: EdgeInsets.all(10),
                                  child: Image.asset(
                                    financialServices[index]['icon']!,
                                    height: 40,
                                    width: 40,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                const SizedBox(height: 5,),
                                Text(
                                  financialServices[index]['title']!,
                                  style: TextStyle(
                                    fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                                    color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
            
                //Recent Transactions
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recent transactions',
                          style: TextStyle(
                            color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                          ),
                        ),
                        
                        TextButton(
                          onPressed: (){}, 
                          child: Text(
                            'See all',
                            style: TextStyle(
                              fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        )
                      ],
                    ),
            
                    // Transactions
                    Container(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/icons/invoice.png',
                            color: Colors.grey,
                            height: 60,
                            width: 60,
                          ),
                          const SizedBox(height: 25,),
                          Text(
                            'No recent transactions',
                            style: TextStyle(
                              color: Theme.of(context).textTheme.bodyMedium?.color,
                              fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                            ),
                          )
                        ],
                      ),
                    ),
            
                  ],
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}