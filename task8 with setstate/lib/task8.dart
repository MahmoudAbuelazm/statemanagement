import 'package:flutter/material.dart';

class task8 extends StatefulWidget {
  task8({super.key});

  @override
  State<task8> createState() => _task8State();
}

class _task8State extends State<task8> {
  List<String> filterlist = [
    "تمت",
    "تحت المراجعة",
    "المكتمله",
    "الملغيه",
    "قيد التنفيذ"
  ];
  int selectedindex = 0;
  void changeselectedvalue(int index) {
    setState(() {
      selectedindex = index;
    });
  }

  bool isshow = true;
  void showhidepass() {
    setState(() {
      isshow = !isshow;
    });
  }

  int selectedvalue = 0;
  void changeselectedvaluer(int value) {
    setState(() {
      selectedvalue = value;
    });
  }

  bool ShowText = false;
  bool ShowCubit = false;
  bool ShowShape = false;
  bool reset = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    for (int i = 0; i < filterlist.length; i++)
                      InkWell(
                        onTap: () => changeselectedvalue(i),
                        child: Container(
                          margin: EdgeInsets.all(4),
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: selectedindex == i
                                  ? Colors.red
                                  : Colors.grey.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(18)),
                          child: Text(filterlist[i],
                              style: TextStyle(
                                  color: selectedindex == i
                                      ? Colors.white
                                      : Colors.black)),
                        ),
                      )
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                color: Colors.black,
                thickness: 2,
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  obscureText: isshow,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: isshow
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                      onPressed: () {
                        showhidepass();
                      },
                    ),
                    hintText: "password",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Divider(
                color: Colors.black,
                thickness: 2,
              ),
              SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 300,
                child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return RadioListTile(
                        value: index,
                        groupValue: selectedvalue,
                        onChanged: (value) {
                          changeselectedvaluer(value!);
                        },
                        title: Text("Title${index + 1}"),
                        subtitle: Text("Hello we are iti"),
                      );
                    }),
              ),
              Divider(
                color: Colors.black,
                thickness: 2,
              ),
              SizedBox(
                height: 25,
              ),
              if (ShowText) Text("Hello we are iti"),
              if (ShowCubit)
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.network(
                      "https://pub.dev/packages/flutter_bloc/versions/8.1.3/gen-res/gen/190x190/logo.webp"),
                ),
              if (ShowShape)
                Container(
                  width: 100,
                  height: 100,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                ),
              if (reset) Text("No Button clicked yet"),
              ElevatedButton(
                  onPressed: () {
                    ShowCubit = false;
                    ShowShape = false;
                    ShowText = false;
                    reset = true;
                    setState(() {});
                  },
                  child: Text("reset")),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      ShowText = true;
                      ShowCubit = false;
                      ShowShape = false;
                      reset = false;
                    });
                  },
                  child: Text("showtext")),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      ShowCubit = true;
                      ShowText = false;
                      ShowShape = false;
                      reset = false;
                    });
                  },
                  child: Text("showcubit")),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      ShowShape = true;
                      ShowCubit = false;
                      ShowText = false;
                      reset = false;
                    });
                  },
                  child: Text("showshape")),
            ]),
          ),
        ),
      ),
    );
  }
}
