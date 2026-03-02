void main() {
  final windPlant = WindPlant(initialEnergy: 100, /type: "Wind"/); //Ahora se instancia la WindPlant 
  final nuclearPlant = NuclearPlant(energyLeft: 1000);
  
  print('Wind: ${chargePhone(windPlant)}');
  print('Nuclear: ${chargePhone(nuclearPlant)}');
  //print('Planta: $windPlant');
}


double chargePhone(EnergyPlant plant){
  if(plant.energyLeft <10){
    throw Exception('Not enought energy');
  }
  return plant.energyLeft -10;
} 
  
enum PlantType{nuclear, wind, water}


 abstract class EnergyPlant {
   double energyLeft;
   final PlantType type;
   
   //Constructor
   EnergyPlant({
     required this.energyLeft,
     required this.type
     });
   
   //Creamos un metodo sobre el consumo de energia
   void consumeEnergy(double amount)
   /*{
     energyLeft -= amount;
   }*/ // Se quito porque cada planta tiene un consumo diferente, por lo tanto se implementa en cada clase hija
 }

class WindPlant extends EnergyPlant{
  WindPlant({required double initialEnergy})
    : super(energyLeft: initialEnergy, type : PlantType.wind /*"Wind"*/); //Para usar los atributos de la clase abstracta mandamos a llamar a dicha clase con la palabra reservada super
    @override
    void consumeEnergy(double amount){
    energyLeft -= amount; 
  }
}

class NuclearPlant extends EnergyPlant{
  //Se arregla los requeridos de la clase padre
  @override
  double energyLeft;
  
  @override
  //final String type ="nuclear";

  NuclearPlant({required /*double*/ this.energyLeft});
  @override
  void consumeEnergy(double amount){
    energyLeft -= (amount * 0.5); 
  }
}
    
//Clases abstractas, son un tipo de meta clase, lo cual nos permiten crear otras clases pero no es herencia
//Añadimos la palabra abstrac antes dek nombre de la clase para volverlo abstracta
