import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task8/Cubits/cubit/changeselectedvalue_cubit.dart';
import 'package:task8/Cubits/cubit/cubit/radiotoggle_cubit.dart';
import 'package:task8/Cubits/cubit/cubit/replaceuicubit_cubit.dart';
import 'package:task8/Cubits/cubit/showpass/cubit/showhidepass_cubit.dart';

class task8 extends StatelessWidget {
  task8({super.key});

  List<String> filterlist = [
    "تمت",
    "تحت المراجعة",
    "المكتمله",
    "الملغيه",
    "قيد التنفيذ"
  ];
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
              BlocBuilder<ChangeselectedvalueCubit, ChangeselectedvalueState>(
                builder: (context, state) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(
                          height: 100,
                        ),
                        for (int i = 0; i < filterlist.length; i++)
                          InkWell(
                            onTap: () {
                              context
                                  .read<ChangeselectedvalueCubit>()
                                  .changeselectedvalue(i);
                            },
                            child: Container(
                              margin: EdgeInsets.all(4),
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  color: context
                                              .read<ChangeselectedvalueCubit>()
                                              .selectedindex ==
                                          i
                                      ? Colors.red
                                      : Colors.grey.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(18)),
                              child: Text(filterlist[i],
                                  style: TextStyle(
                                      color: context
                                                  .read<
                                                      ChangeselectedvalueCubit>()
                                                  .selectedindex ==
                                              i
                                          ? Colors.white
                                          : Colors.black)),
                            ),
                          )
                      ],
                    ),
                  );
                },
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
                child: BlocBuilder<ShowhidepassCubit, ShowhidepassState>(
                  builder: (context, state) {
                    return TextFormField(
                      obscureText: context.read<ShowhidepassCubit>().isshow,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: context.read<ShowhidepassCubit>().isshow
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                          onPressed: () {
                            context.read<ShowhidepassCubit>().showhidepass();
                            ;
                          },
                        ),
                        hintText: "password",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    );
                  },
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
                child: BlocBuilder<RadiotoggleCubit, RadiotoggleState>(
                  builder: (context, state) {
                    return ListView.builder(
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          return RadioListTile(
                            value: index,
                            groupValue:
                                context.read<RadiotoggleCubit>().currentindex,
                            onChanged: (value) {
                              context.read<RadiotoggleCubit>().toggle(value!);
                            },
                            title: Text("Title${index + 1}"),
                            subtitle: Text("Hello we are iti"),
                          );
                        });
                  },
                ),
              ),
              Divider(
                color: Colors.black,
                thickness: 2,
              ),
              SizedBox(
                height: 25,
              ),
              BlocBuilder<ReplaceuicubitCubit, ReplaceuicubitState>(
                  builder: (context, state) {
                if (state is ShowText)
                  return Text("Hello we are iti");
                else if (state is ShowCubit)
                  return SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.network(
                        "https://pub.dev/packages/flutter_bloc/versions/8.1.3/gen-res/gen/190x190/logo.webp"),
                  );
                else if (state is ShowShape)
                  return Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.red),
                  );
                else
                  return Text("No Button clicked yet");
              }),
              ElevatedButton(
                  onPressed: () {
                    context.read<ReplaceuicubitCubit>().reset();
                  },
                  child: Text("reset")),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<ReplaceuicubitCubit>().showtext();
                  },
                  child: Text("showtext")),
              ElevatedButton(
                  onPressed: () {
                    context.read<ReplaceuicubitCubit>().showcubit();
                  },
                  child: Text("showcubit")),
              ElevatedButton(
                  onPressed: () {
                    context.read<ReplaceuicubitCubit>().showshape();
                  },
                  child: Text("showshape")),
            ]),
          ),
        ),
      ),
    );
  }
}
