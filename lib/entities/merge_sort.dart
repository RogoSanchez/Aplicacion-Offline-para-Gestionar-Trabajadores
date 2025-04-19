import 'package:Trabajadores/entities/worker_class.dart';

void MergeSort(List<Worker>arr){
  List<Worker>aux=List.filled(arr.length, Worker(null,"",0,'','',0));
  mergeSortAux(arr,0,arr.length-1,aux);
}

void mergeSortAux(List<Worker> arr, int left, int right, List<Worker> aux) {
  if (left < right) {
    int middle = (left + right) ~/ 2;
    mergeSortAux(arr, left, middle, aux);
    mergeSortAux(arr, middle + 1, right, aux);
    merge(arr, left,  right, aux);
  }
}

void merge(List<Worker> arr, int left, int right, List<Worker> aux) {
  if(left<right){
    int middle = (left + right) ~/ 2;
    int p=left;
    int k= left;
    int q=middle+1;
    while (p<=middle&&q<=right){
      if( arr[p].get_nombre.codeUnits[0]<arr[q].get_nombre.codeUnits[0]){
        
        aux[k++]=arr[p++];
        
      }else{
        aux[k++]=arr[q++];
        
      }
    }

    while (p <= middle) {
      aux[k++] = arr[p++];
    }

    // Copiar los elementos restantes de la segunda mitad
    while (q <= right) {
      
      aux[k++] = arr[q++];
    }

    // Copiar los elementos ordenados de aux a arr
    for (int i = left; i <= right; i++) {
      arr[i] = aux[i];
    
      }
    
  }
}