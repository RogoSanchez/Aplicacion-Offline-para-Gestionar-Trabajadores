import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Trabajadores/providers/worker_screen_provider.dart';
import 'package:Trabajadores/screens/delete_worker_screen.dart';
import 'package:Trabajadores/providers/dark_mode_provider.dart';
import 'package:Trabajadores/screens/worker_screen.dart';

class homepage extends StatelessWidget{
   homepage({super.key});
  final TextEditingController controlador=TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<WorkerScreenProvider>().updateWorkerList();
    });
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(' Detalles de los pagos'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)  
               )
              ), 
              centerTitle: true,
              shadowColor: Colors.blue,
              elevation: 5,
            actions: [
              IconButton(onPressed: (){
                context.read<WorkerScreenProvider>().updateWorkerList();
            }, icon: Icon(Icons.replay_outlined))
            ],
          ),
          drawer: Drawer(
            child: ListView(
              
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  
                  child: Center(
                    child: Text("Panel de estado",
                    style: TextStyle(
                      fontSize: 25,
                      color: (context.read<darkMode>().is_dark)? Colors.white:Colors.black
                     ),
                    ),
                   )
                  ),
                ListTile(
                  title: Center(child: Text("Modo Oscuro")),
                  subtitle: Switch(value: context.watch<darkMode>().is_dark, onChanged: (bool? value){
                    context.read<darkMode>().Toggle(value!);
                  }, 
                 ),
                )
               ],
              ),
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
                      title: Text(context.watch<WorkerScreenProvider>().ListWorkers[index].get_nombre),
                      trailing: Text("Salario: ${context.watch<WorkerScreenProvider>().ListWorkers[index].get_salario.toString()}"),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>WorkerScreen(index: index)));
                     },
                    )
                   ),
                  );
                 },
                ), 
               )
              ],
             ),
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10)
            ),
            child: BottomAppBar(
              color: const Color.fromARGB(255, 100, 33, 121),
              shape: CircularNotchedRectangle(
               
                ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(onPressed: (){
                      showDialog(
                      context: context, builder: (BuildContext context) { 
                      return AlertDialog(
                        title: Text("Introduce el nombre del trabajador",
                        style: TextStyle(
                          color: Colors.black
                        ),),
                        actions: [
                          TextField(
                            controller: controlador,
                            decoration: InputDecoration(
                            ),
                          ),
                          TextButton(onPressed: (){
                          
                            if (controlador.text.isNotEmpty){
                              context.read<WorkerScreenProvider>().addworkers(controlador);
                              controlador.clear();
                              Navigator.of(context).pop();
                            }
                          }, child: Text("Aceptar")),
                          
                          TextButton(onPressed: (){
                            
                           Navigator.of(context).pop(); 
                            }, child:Text("Cancelar"))
                        ],
                       );
                      },
                     );
                    }, icon: Icon(Icons.add,
                    color: (context.read<darkMode>().is_dark)?Colors.black: Colors.white
                    ,)),
                    IconButton(onPressed: (){
                      
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>delete_worker_page()));
                    }, icon: Icon(Icons.delete,
                    color:(context.read<darkMode>().is_dark)? Colors.white:Colors.black)
                    )
                ],
              ),
            ),
          ),
        ),
      );
  }

}






