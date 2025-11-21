import 'package:flutter/material.dart';
void main(){
runApp(const MyApp());
}

//My App is statless widget because its properties do not change over time
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Flutter Demo",
      theme:ThemeData(
         colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const ButtonWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class HomePage extends StatelessWidget{
  const HomePage({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body:Padding(
        padding: EdgeInsets.all(16.0) ,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Header Text With styling
            Text(
              "Welcome to flutter",
              style:TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color:Colors.deepPurple,
                fontStyle: FontStyle.italic,
              )
            ),
            SizedBox(height: 10,),
            //Subtitle Text
            Text(
              "Lets Learn Layouts and Styling in Fultter",
              style:TextStyle(
                fontSize: 18,
                color:Colors.grey[600],
              )
            ),
            SizedBox(height:30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  color: Colors.red,
                  alignment: Alignment.center,
                  child:Text(
                    "Box 1",
                    style:TextStyle(
                      color:Colors.white,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                ),
                Container(
                  width: 80,
                  height: 80,
                  color: Colors.green,
                  alignment: Alignment.center,
                  child:Text(
                    "Box 2",
                    style:TextStyle(
                      color:Colors.white,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                ),
                Container(
                  width: 80,
                  height: 80,
                  color: Colors.blue,
                  alignment: Alignment.center,
                  child:Text(
                    "Box 3",
                    style:TextStyle(
                      color:Colors.white,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                ),
              ],
            ),
            SizedBox(height:30,),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color:Colors.amber[100],
                  borderRadius: BorderRadius.circular(12),
                  border:Border.all(color:Colors.amber, width:2)
              ),
              child: Text("This is.",style: TextStyle(
                fontSize: 14,
                color:Colors.black87
              ),)
              ,
            )
          ],
        )

    ));
  }
}
class ButtonWidget extends StatelessWidget{
  const ButtonWidget({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Interactive Widgets"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "BUtton Types in the Flutter",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color:Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 20),
            //Elevated Button - Raised Button with shadow
            ElevatedButton(onPressed: (){
              print("Elevated Pressed!");
            }, child: const Text("Elevated Button"))
          ],
        ),
      ),
    );
  }
}