
class Worker{
late int? _id;
late String _nombre;
late int _salario;
late String _proximo_cobro;
late String _ultimo_cobro;
late int _estado;
List<String> Incidencias=[];

Worker(int? id, String nombre, int salario, String proximo_cobro,String ultimo_cobro,int status){
  _id=id;
  _nombre=nombre;
  _salario=salario;
  _proximo_cobro=proximo_cobro;
  _ultimo_cobro=ultimo_cobro;
  _estado=status;
}

Map<String,dynamic> to_map (){
  return {
    'id':_id,
    'nombre': _nombre,
    'salario':_salario,
    'proximo_cobro':_proximo_cobro,
    'ultimo_cobro': _ultimo_cobro,
    'estado':_estado
  };
}

Map<String,dynamic> Incidencias_to_map (){
  return {
    'id':_id,
    'worker_id':_id,
    'Hecho':get_incidencias.last
  };
}
factory Worker.fromMap(Map<String, dynamic> map) {
    return Worker(
      map['id'],
      map['nombre'],
     int.parse(map['salario']), 
      map['proximo_cobro'],
      map['ultimo_cobro'],
      int.parse(map['estado']),
    );
  }

bool StateToBool (){
 return _estado==1;
}
set nombre(String nombre){
  _nombre=nombre;
}
set salario(int salario){
  _salario=salario;
}
set proximo_pago(String fecha){
  _proximo_cobro=fecha;
}
set status(int status){
  _estado=status;
}
set ultimo_pago(String fecha){
  _ultimo_cobro=fecha;
}

int? get get_id{
  return _id;
}

String get get_nombre{
  return _nombre;
}
int get get_salario{
  return _salario;
}
String get get_fecha{
  return _proximo_cobro;
}

int get get_status{
  return _estado;}
String get get_ultimo_cobro{
  return _ultimo_cobro;
}
List<String> get get_incidencias{
  return Incidencias;
}
}