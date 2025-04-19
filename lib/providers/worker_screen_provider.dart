import 'package:flutter/material.dart';
import 'package:Trabajadores/entities/databaseHelper.dart';
//import 'package:rogos/entities/merge_sort.dart';
import 'package:Trabajadores/entities/worker_class.dart';



class WorkerScreenProvider extends ChangeNotifier
{
  List<Worker>_ListWorkers=[];
  List<String>DeleteNames=[];


  List<Worker> get ListWorkers => _ListWorkers;

  //Agrega un nuevo trabajador
  Future<void> addworkers(dynamic controlador) async {

      Worker Nuevo=Worker(null, controlador.text,0,'No definido','No definido',0);
      
      await DbWorker.insert(Nuevo);
      updateWorkerList();
      notifyListeners();
    
    }
  
  //Actualizar lista de trabajadores 
  Future <void>updateWorkerList() async{

    _ListWorkers=await DbWorker.getAllWorkers();
    notifyListeners();
  }

  Future<void>updateIncidencesList(int index) async{
    _ListWorkers[index].Incidencias= await DbWorker.getAllIncidences(_ListWorkers[index].get_id);
    notifyListeners();

  }

  //Actualiza el estado del trabajador
  void update_status(int index, bool? value){
    if (value!=null) {
      if(_ListWorkers[index].get_status==0){
        _ListWorkers[index].status=1;
       DeleteNames.add(_ListWorkers[index].get_nombre);
      }else{
        _ListWorkers[index].status=0;
        DeleteNames.remove(_ListWorkers[index].get_nombre);
      }
    notifyListeners();
    }
  }
  
  Future<void> DeleteWorker()async{

      for (var i = 0; i < DeleteNames.length; i++) {
        await DbWorker.delete(DeleteNames[i]);  
      }
    updateWorkerList();
  }
  
  Future<void> ModifyWorker(int index,String Campo, String edited)async{
    await DbWorker.update(ListWorkers[index].get_id,Campo, edited);

  }

  Future<void> AddIncidencia(int index)async{
    await DbWorker.InsertarIncidencia(ListWorkers[index]);

  }


  void wnotifyListeners(){
    notifyListeners();
  }
}

