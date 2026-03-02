void main() {
  final windPlant = WindPlant(initialEnergy: 100, /type: "Wind"/); //Ahora se instancia la WindPlant 
  
  
  print('Planta: $windPlant');
}
 abstract class EnergyPlant {
   double energyLeft;
   final String type;
   
   //Constructor
   EnergyPlant({
     required this.energyLeft,
     required this.type
     });
   
   //Creamos un metodo sobre el consumo de energia
   void consumeEnergy(double amount){
     energyLeft -= amount;
   }
 }

class WindPlant extends EnergyPlant{
  WindPlant({required double initialEnergy})
    : super(energyLeft: initialEnergy, type : "Wind"); //Para usar los atributos de la clase abstracta mandamos a llamar a dicha clase con la palabra reservada super
}

class NuclearPlant extends EnergyPlant{
  //Se arregla los requeridos de la clase padre
  @override
  double energyLeft;
  
  @override
  final String type = "nuclear";
  
  NuclearPlant({required double energyLeft});
}
    
//Clases abstractas, son un tipo de meta clase, lo cual nos permiten crear otras clases pero no es herencia
//Añadimos la palabra abstrac antes dek nombre de la clase para volverlo abstracta
//planta nuclear (pendiente de acompletar)