 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ttttt/modules/login/login_page.dart';
import 'package:ttttt/modules/pageview/page_view.dart';

class list extends StatefulWidget {
  const list({Key? key}) : super(key: key);

  @override
  _listState createState() => _listState();
}

class _listState extends State<list> {
  int _currentPage = 0;
  PageController _controller = PageController();
  List<Widget> _pages = [
    page_view(
        title: "Keep",
        description:
        "Accept cryptocurrencies and digital assets, keep thern here, or send to orthers",
        image: "lib/icons/1.svg"),
    page_view(
        title: "Buy",
        description:
        "Buy Bitcoin and cryptocurrencies with VISA and MasterVard right in the App",
        image: "lib/icons/3.svg"),
    page_view(
        title: "Sell",
        description:
        "Sell your Bitcoin cryptocurrencies or Change with orthres digital assets or flat money",
        image: "lib/icons/4.svg"),
  ];
  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget> [
          PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: _controller,
            onPageChanged: _onchanged,
            itemBuilder: (context ,  index){
              return _pages[index];

            },
            itemCount: 3,
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(_pages.length, (int index) {
                  return AnimatedContainer(
                    duration: Duration(microseconds: 300),
                    height: 10,
                    width: (index == _currentPage) ? 30 : 10,
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: (index == _currentPage)
                        ? Colors.blue
                        : Colors.blue.withOpacity(0.5)),
                  );

                }
                )
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        _controller.nextPage(
                            duration: Duration(milliseconds: 700),
                            curve: Curves.easeInOutQuint);
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login_Page()));


                      },
                      child:  AnimatedContainer(

                        duration:  Duration(milliseconds: 500),
                        height: 50,
                        alignment: Alignment.center,
                        width: (_currentPage == (_pages.length -1 )) ? 200 : 70,
                        decoration: BoxDecoration(color: Colors.blue, borderRadius:  BorderRadius.circular(35),

                        ),
                        child: (_currentPage == (_pages.length -1 )

                          ?
                          Text(
                          "Get Started",
                          style: TextStyle(color: Colors.white , fontSize: 20,

                        ),


                      )
                            :Icon(
                          Icons.navigate_next,
                          color: Colors.white,
                          size: 50,
                        )
                    ),


                    )
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),

    );
  }
}
