import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rogos/providers/worker_screen_provider.dart';
import 'package:rogos/screens/worker_screen.dart';

class delete_worker_page extends StatelessWidget {
  const delete_worker_page({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(' Detalles de los pagos'
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)  
              ), 
            ),
              centerTitle: true,
              shadowColor: Colors.blue, 
              elevation: 5,
              
            
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: context.watch<WorkerScreenProvider>().ListWorkers.length,
                  itemBuilder: (BuildContext context, int index) { 
                  return SizedBox(
                    child: Padding(padding: EdgeInsets.all(10),
                    child: ListTile(
                      leading:Checkbox(
                        value: context.read<WorkerScreenProvider>().ListWorkers[index].StateToBool(),
                        onChanged: (bool? value){
                          context.read<WorkerScreenProvider>().update_status(index,value);
                        },
                      ),
                      title: Text(context.watch<WorkerScreenProvider>().ListWorkers[index].get_nombre),
                      trailing: Text("Salario: ${context.watch<WorkerScreenProvider>().ListWorkers[index].get_salario.toString()}"),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>WorkerScreen(index: index)));
                      },
                    )
                    ),
                  );
                },),
              )
            ],
          ),
          bottomNavigationBar: SizedBox(
            height: 40,
            child: ClipRRect(
              
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10)
                ),
              
              child: BottomAppBar(
                color: const Color.fromARGB(255, 111, 48, 115),
                child: TextButton(
                  
                  onPressed: () {
                    context.read<WorkerScreenProvider>().DeleteWorker();
                  },
                  child: Text(
                    "Eliminar",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        )
    );
  }
}