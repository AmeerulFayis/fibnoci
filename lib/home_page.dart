import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController numberController=TextEditingController();
  int? n;
  int? result;

  int fibonacci(int n) {
    if (n <= 1) {
      return n;
    }
    int a=0;
     int b=1;
     int   c=0;
    for(int i=2;i<=n;i++){
      c=a+b;
      a=b;
      b=c;
    }
    return c;

  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text("Fibonacci"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
           TextField(
            controller: numberController,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            decoration: const InputDecoration(
              hintText: "Enter the position",
              border: OutlineInputBorder()
            ),
          ),
          const SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
          if(  numberController.text.isNotEmpty){
            setState(() {
              n=int.parse(numberController.text.toString());
              result=fibonacci(n!);
            });
          }else{
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("enter a value"),backgroundColor: Colors.red,));
          }


          }, child: const Text("Submit")),
          const SizedBox(height: 20,),
          Text(numberController.text.isEmpty?""
              "":"Result : Fibonacci position of $n is $result")

        ],
      ),

    );
  }
}
