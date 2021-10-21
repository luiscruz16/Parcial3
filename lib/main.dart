
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value) {
  runApp( MaterialApp(    
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue
    ),
    home: Parcial3(),
  ));
  });
}

class Parcial3 extends StatefulWidget {

  @override
  _Parcial3State createState() => _Parcial3State();
}

class _Parcial3State extends State<Parcial3> {
  @override  
String? cedula, nombre, apellido, fechaNacimiento,
sexo, tipo, usuario, vuelo, avion, destino;

getcedula(dui){this.cedula= dui;}
getnombre(nombre){this.nombre = nombre;}
getapellido(apellido){this.apellido = apellido;}
getsexo(sexo){this.sexo=sexo;}
getusuario(usuario){this.usuario=usuario;}
getvuelo(vuelo){this.vuelo=vuelo;}
getavion(avion){this.avion=avion;}
getdestino(destino){this.destino=destino;}

createData(){
DocumentReference documentReference =
 FirebaseFirestore.instance.collection("Clientes").doc(cedula); 

 Map<String, dynamic> students = {
"cedula":cedula,
"nombre":nombre,
"apellido":apellido,
"sexo":sexo,
"usuario":usuario,
"vuelo":vuelo,
"avion": avion,
"destino":destino
};

documentReference.set(students).whenComplete(() {
  print("Client Created");
});

}

readDate(){
 DocumentReference documentReference =
 FirebaseFirestore.instance.collection("MyStudents").doc(cedula);

 documentReference.get().then((datasnapshot) {
     print(datasnapshot.data());
 });
}

updateData(){
  DocumentReference documentReference =
  FirebaseFirestore.instance.collection("MyStudents").doc(cedula);

   Map<String, dynamic> students = {
"cedula":cedula,
"nombre":nombre,
"apellido":apellido,
"sexo":sexo,
"usuario":usuario,
"vuelo":vuelo,
"avion": avion,
"destino":destino
};

documentReference.set(students).whenComplete(() {
  print("StudentName Updated");
});

}

deleteData(){
  DocumentReference documentReference =
  FirebaseFirestore.instance.collection("MyStudents").doc(cedula);
  documentReference.delete().whenComplete(() {
    print("$cedula Deleted");
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Parcial 3 Ejercicio 2"),
      ),
      body: Padding(
        padding:EdgeInsets.all(16.0),
        child: ListView(
          children:<Widget> [
            Padding(
              padding: EdgeInsets.only(bottom:8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Cedula",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue,
                    width: 2.0)
                  )              
                ),
                onChanged: (String cedula){
                  getcedula(cedula);                  
                },
              ),
            ),
             Padding(
              padding: EdgeInsets.only(bottom:8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Nombre",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue,
                    width: 2.0)
                  )              
                ),
                onChanged: (String nombre){
                   getnombre(nombre);
                },
              ),
            ),
             Padding(
              padding: EdgeInsets.only(bottom:8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Apellido",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue,
                    width: 2.0)
                  )              
                ),
                onChanged: (String apellido){
                  getapellido(apellido);
                },
              ),
            ),
            
             Padding(
              padding: EdgeInsets.only(bottom:8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Sexo",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue,
                    width: 2.0)
                  )              
                ),
                onChanged: (String sexo){
                  getsexo(sexo);
                },
              ),
            ),
            
             Padding(
              padding: EdgeInsets.only(bottom:8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Usuario",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue,
                    width: 2.0)
                  )              
                ),
                onChanged: (String usuario){
                  getusuario(usuario);
                },
              ),
            ),
             
             Padding(
              padding: EdgeInsets.only(bottom:8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Vuelo",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue,
                    width: 2.0)
                  )              
                ),
                onChanged: (String vuelo){
                  getvuelo(vuelo);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom:8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Avion",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue,
                    width: 2.0)
                  )              
                ),
                onChanged: (String avion){
                  getavion(avion);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom:8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Destino",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue,
                    width: 2.0)
                  )              
                ),
                onChanged: (String destino){
                  getdestino(destino);
                },
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:<Widget> [
              RaisedButton(
                color: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
                ),
                child: Text("Create"),
                textColor: Colors.white,
                onPressed: (){
                  createData();
                },
              ),
              RaisedButton(
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
                ),
                child: Text("Read"),
                textColor: Colors.white,
                onPressed: (){
                  readDate();
                },
              ),
              RaisedButton(
                color: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
                ),
                child: Text("Update"),
                textColor: Colors.white,
                onPressed: (){
                  updateData();
                },
              ),
               RaisedButton(
                color: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
                ),
                child: Text("Delete"),
                textColor: Colors.white,
                onPressed: (){
                  deleteData();
                },
              )
            ],
            ),            
          ],
        ),
      ),
    );
  }
}