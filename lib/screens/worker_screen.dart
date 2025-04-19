import 'package:flutter/material.dart';
import 'package:Trabajadores/providers/worker_screen_provider.dart';
import 'package:provider/provider.dart';

TextEditingController worker_controller = TextEditingController();
class WorkerScreen extends StatelessWidget{
  
  const WorkerScreen({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    final watch=context.watch<WorkerScreenProvider>();
    final read=context.read<WorkerScreenProvider>();
  WidgetsBinding.instance.addPostFrameCallback((_) {
      read.updateIncidencesList(index); // Método para cargar incidencias
    });

    return Scaffold(
      
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            
                      showDialog(
                        context: context, builder: (BuildContext context) { 
                          return AlertDialog(
                          title: Text("Agregar incidencia",),
                          actions: [
                            TextField(
                            controller: worker_controller,
                            ),
                            TextButton(onPressed: (){
                              if (worker_controller.value.text.isNotEmpty) {
                                read.ListWorkers[index].Incidencias.add((read.ListWorkers[index].get_id.toString(),worker_controller.text));
                                read.AddIncidencia(index);
                                read.updateIncidencesList(index);
                              read.wnotifyListeners();
                              worker_controller.clear();
                              }
                              
                              Navigator.pop(context);
                            }, child: Text("Aceptar")),
                            TextButton(onPressed: (){
                              worker_controller.clear();
                              Navigator.pop(context);
                            }, child:Text("Cancelar"))
                           ],
                          );
                         },
                        );                        
          }, icon: Icon(Icons.add))
        ],
        title: Text(watch.ListWorkers[index].get_nombre),
        
        
        shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)  
              ), 
            ),
          ),
      
      
      body: Column(
        children: [
          
          Flexible(child: 
          ListView(
            children: [
              Row(
                children: [
                  Flexible(
                    child: ListTile(
                      
                      onTap: () {
                        showDialog(
                          context: context, builder: (BuildContext context) { 
                            return AlertDialog(
                            title: Text("Editar salario",),
                            actions: [
                              TextField(
                              controller: worker_controller,
                              ),
                              TextButton(onPressed: (){
                                read.ListWorkers[index].salario=int.parse(worker_controller.text);
                            read.ModifyWorker(index, 'salario', read.ListWorkers[index].get_salario.toString());
                                read.wnotifyListeners();
                                worker_controller.clear();
                                Navigator.pop(context);
                              }, child: Text("Aceptar")),
                              TextButton(onPressed: (){
                                worker_controller.clear();
                                Navigator.pop(context);
                              }, child:Text("Cancelar"))
                             ],
                            );
                           },
                          );
                        },
                      title: Text("Salario: ${watch.ListWorkers[index].get_salario}"),
                    ),
                  ),
                  Flexible(
                    child: ListTile(
                     onTap: () {
                      showDialog(
                      context: context, builder: (BuildContext context) { 
                        return AlertDialog(
                        title: Text("Editar fecha de cobro",),
                          actions: [
                          TextField(
                          controller: worker_controller,
                          ),
                          TextButton(onPressed: (){
                            read.ListWorkers[index].proximo_pago=worker_controller.text;
                            read.ModifyWorker(index, 'proximo_cobro', read.ListWorkers[index].get_fecha);
                            read.wnotifyListeners();
                            worker_controller.clear();
                            Navigator.pop(context);
                          }, child: Text("Aceptar")),
                          TextButton(onPressed: (){
                            worker_controller.clear();
                            Navigator.pop(context);
                          }, child:Text("Cancelar"))
                         ],
                        );
                       },
                      );
                     },
                      title: Text("Proximo cobro: ${watch.ListWorkers[index].get_fecha.toString()}"),
                      ),
                     )
                    ],
                   ),
                  Row(
                    children: [
                       Flexible(
                    child: ListTile(
                     onTap: () {
                      showDialog(
                      context: context, builder: (BuildContext context) { 
                        return AlertDialog(
                        title: Text("Editar fecha de ultimo pago",),
                          actions: [
                          TextField(
                          controller: worker_controller,
                          ),
                          TextButton(onPressed: (){
                            read.ListWorkers[index].ultimo_pago=worker_controller.text;
                            read.ModifyWorker(index, 'ultimo_cobro', read.ListWorkers[index].get_ultimo_cobro);
                            read.wnotifyListeners();
                            worker_controller.clear();
                            Navigator.pop(context);
                          }, child: Text("Aceptar")),
                          TextButton(onPressed: (){
                            worker_controller.clear();
                            Navigator.pop(context);
                          }, child:Text("Cancelar"))
                         ],
                        );
                       },
                      );
                     },
                      title: Text("Ultimo cobro:  ${watch.ListWorkers[index].get_ultimo_cobro.toString()}"),
                      ),
                     )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                     
                      itemCount: context.watch<WorkerScreenProvider>().ListWorkers[index].Incidencias.length,
                      itemBuilder: (BuildContext context, int indexI){
                      return ListTile(
                        title: Text(context.watch<WorkerScreenProvider>().ListWorkers[index].Incidencias[indexI].$2),
                      );
                    }),
                  )
                  ],
                 )
                )
               ],
              ),
             );
            } 
  }