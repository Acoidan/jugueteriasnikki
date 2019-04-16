import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jugueteriasnikki/UI/Drawer/Drawer.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:jugueteriasnikki/UI/NikkiClub/Cliente.dart';
import 'package:jugueteriasnikki/UI/NikkiClub/menuNikkiClub.dart';
import 'package:mysql1/mysql1.dart';

import 'package:jugueteriasnikki/UI/NikkiClub/Cliente.dart' as dire;


class nikkiclub extends StatelessWidget{

	const nikkiclub ({Key key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: new AppBar(
				title: Text('Jugueterias Nikki - NikkiClub'),
				textTheme: TextTheme(title: TextStyle(color: Colors.white,fontSize: 24))),
			body:bodyNikkiClub() ,
			drawer: drawer(),
		);

	}
}

class bodyNikkiClub extends StatefulWidget {
	final Cliente cliente;

	bodyNikkiClub({this.cliente});

	@override
	State<StatefulWidget> createState() => new _bodyNikkiClub();

}

class _bodyNikkiClub extends State<bodyNikkiClub> {

	final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
	final ControllerTarjeta = TextEditingController();
	final ControllerClave = TextEditingController();

	Cliente cliente = new Cliente();


	@override
	Widget build(BuildContext context) {
		final Size screenSize = MediaQuery.of(context).size;

		var settings = new ConnectionSettings(
			host: '5.145.175.138',
			user: 'admin_admin',
			password: 'Joman\$2016',
			db: 'admin_wp_nikkiclub'
		);
		return new Container(
			padding: new EdgeInsets.only(left: 200,right: 200,top: 40),
			child: new Form(
				key: this._formKey,
				child: new ListView(
					children: <Widget>[
						new TextFormField(
							controller: ControllerTarjeta,
							keyboardType: TextInputType.number,
							decoration: new InputDecoration(
								hintText: 'Número de tarjeta',
								labelText: 'Número de tarjeta'
							)
						),
						new TextFormField(
							controller: ControllerClave,
							obscureText: true,
							decoration: new InputDecoration(
								hintText: 'Clave de tarjeta',
								labelText: 'Clave de tarjeta'
							)
						),
						new Container(
							width: screenSize.width,
							margin: new EdgeInsets.only(top: 20.0),
							child: new Container(
								margin: EdgeInsets.only(right: 5),
								child: new RaisedButton(
									child: new Text(
										'Acceder',
										style: new TextStyle(
											color: Colors.white
										),
									),
									onPressed: () async {

										var conn = await MySqlConnection.connect(settings);

										if (conn != null){
											print("Conectado a la base de datos");
										}
										else {
											print("Fallo al conectar a la base de datos");
										}

										var NumeroTarjeta = ControllerTarjeta.text;

										var results = await conn.query('SELECT * FROM nikkiclub WHERE numerotarjeta = ?', [NumeroTarjeta]);

										if (results != null){

											print("Leectura de la base de datos correcta");
											print(results);

										}
										else{
											print("Ha ocurrido un error al leer en la base de datos");
										}

										for (var row in results) {

											if(row[26].toString().trim() == ControllerTarjeta.text && row[27].toString().trim() == ControllerClave.text){

												print("Coinciden los caracteres");
												cliente.setNumeroTarjeta("${row[26]}");
												print(cliente.getNumeroTrjeta());

												Navigator.push(
													context,
													MaterialPageRoute(builder: (context) => menunikkiclub(cliente:Cliente())));

											}
											else{
												print("No se encontraron coincidencias en la base de datos");
											}
										};
									},
									color: Colors.blue,
								),
							)
						)
					],
				),
			)
		);
	}
}