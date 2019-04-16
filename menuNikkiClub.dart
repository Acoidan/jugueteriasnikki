import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:jugueteriasnikki/UI/Contacto/Contacto.dart';
import 'package:jugueteriasnikki/UI/Drawer/Drawer.dart';
import 'package:jugueteriasnikki/UI/NikkiClub/Cliente.dart';
import 'package:jugueteriasnikki/UI/NikkiClub/Cliente.dart';
import 'package:jugueteriasnikki/UI/NikkiClub/Cliente.dart';
import 'package:jugueteriasnikki/UI/NikkiClub/NikkiClub.dart';
import 'package:jugueteriasnikki/UI/Pruebas/BaseDatos.dart';
import 'package:jugueteriasnikki/UI/NikkiClub/Cliente.dart' as dire;


class menunikkiclub extends StatelessWidget{
	final String barcodeScanRes;
	final Cliente cliente;

	const menunikkiclub ({Key key, this.barcodeScanRes, this.cliente}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: new AppBar(
				title: Text('Jugueterias Nikki - NikkiClub'),
				textTheme: TextTheme(title: TextStyle(color: Colors.white,fontSize: 24)),),
			body:bodyMenuNikkiClub() ,
			drawer: drawer(),
		);
	}
}
class bodyMenuNikkiClub extends StatelessWidget{

	const bodyMenuNikkiClub({Key key}) : super(key: key);
	@override
	Widget build(BuildContext context) {
		SystemChrome.setPreferredOrientations([
			DeviceOrientation.portraitUp,
			DeviceOrientation.portraitDown,
		]);
		//final cliente = dire.Cliente();
		return new Container(
			decoration: new BoxDecoration(
				image: new DecorationImage(
					image: new 	AssetImage(
						'lib/img/Background.png'
					),
					repeat: ImageRepeat.repeat
				)
			),
			padding: EdgeInsets.only(top: 20),
			child: new Center(
				child: new Column(
					children: <Widget>[
						new Image.asset("lib/img/TarjetaNikkiClub.png",width: 300,),
						new Text("Bienvenido a NikkiClub", style: TextStyle(fontSize: 32,color: Colors.deepOrangeAccent,fontWeight: FontWeight.bold)),
						new Container(
							child: Column(
								children: <Widget>[
									new Row(
										children: <Widget>[
											new Expanded(
												flex: 1,
												child: new Container(
													child: new MaterialButton(child: Image.asset("lib/img/EstrellaModificarDatos.png",width: 300),
														onPressed: (){
															Navigator.push(
																context,
																MaterialPageRoute(builder: (context) => prueba()));
														})
												)
											),
											new Expanded(
												flex: 1,
												child: new Container(
													child: new MaterialButton(child: Image.asset("lib/img/EstrellaConsultarPuntos.png",width: 300),
														onPressed: (){
															Navigator.push(
																context,
																MaterialPageRoute(builder: (context) => nikkiclub()));
														})
												)
											),
										],
									),
									new Row(
										children: <Widget>[
											new Expanded(
												flex: 1,
												child: new Container(
													child: new MaterialButton(child: Image.asset("lib/img/EstrellaAñadirPuntos.png",width: 300),
														onPressed: () async {
															final String barcodeScanRes = await
															FlutterBarcodeScanner.scanBarcode("#FF0000","Cancelar");
															Scaffold.of(context).showSnackBar(new SnackBar(
																content: new Text("Codigo: $barcodeScanRes"),
															));
														})
												)
											),
											new Expanded(
												flex: 1,
												child: new Container(
													child: new MaterialButton(child: Image.asset("lib/img/EstrellaConsultarPuntos.png",width: 300),
														onPressed: (){
														print(widget.cliente.getNumeroTarjeta);
															/*Navigator.push(
																context,
																MaterialPageRoute(builder: (context) => contacto()));*/
														})
												)
											),
										],
									),
								],
							),
						)
					],
				)
			),
		);
	}

}
