import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreateProfile extends StatefulWidget {
  @override
  _CreateProfileState createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
			appBar: AppBar(
				title: Text("Create Profile"),

			),
			body: Container(
				child: Padding(
					padding:  EdgeInsets.only(left: 8,right: 8,top: 32,bottom: 8),
					child: Column(
						mainAxisAlignment: MainAxisAlignment.spaceEvenly,
						children: <Widget>[
//							TitleRow(title: 'Profile',
//								trailing: CircleAvatar(
//									backgroundColor: kThemeColor,
//									child: GestureDetector(
//										onTap: (){
//											if(phoneNumber!=null&&gender!=null) {
//												setState(() {
//													savingData =true;
//												});
//												registerUserInDatabase();
//											}
//											else{
//												Fluttertoast.showToast(msg: 'Please Select Gender and Enter Phone Number');
//											}
//										},
//										child: Icon(
//											Icons.save,
//											color: Colors.white,
//										),
//									),
//								),),
							Flexible(
								child: CircleAvatar(
									radius: 45,
									child: ClipRRect(
										borderRadius: BorderRadius.circular(55),
										child: Image.network("https://avatars0.githubusercontent.com/u/45289002?s=400&u=b16c25f2f53e1bd99cdd812198df21b9a20a596f&v=4"),
									),
								),
							),
							Center(child: Text("Shreyansh",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
							Row(
								mainAxisAlignment: MainAxisAlignment.spaceBetween,
								children: <Widget>[
									Padding(
										padding: const EdgeInsets.all(8.0),
										child: Column(
											crossAxisAlignment: CrossAxisAlignment.start,
											children: <Widget>[
												Text('Roll No',style: TextStyle(fontSize: 18,color: Colors.grey),),
												Text("IIT2018073"),
											],
										),
									),
									Padding(
										padding: const EdgeInsets.all(8.0),
										child: Column(
											crossAxisAlignment: CrossAxisAlignment.end,
											children: <Widget>[
												Text('Email',style: TextStyle(fontSize: 18,color: Colors.grey),),
												Text("iit2018073@iiita.ac.in"),
											],
										),
									),
								],
							),
							Row(
								mainAxisAlignment: MainAxisAlignment.spaceBetween,
								children: <Widget>[
									Padding(
										padding: const EdgeInsets.all(8.0),
										child: Text('Select Gender',style: TextStyle(fontSize: 18,color: Colors.grey),),
									),
									Row(
										mainAxisAlignment: MainAxisAlignment.end,
										children: <Widget>[
											Padding(
												padding: const EdgeInsets.all(8.0),
												child: GestureDetector(
													onTap: (){
														setState(() {
//															gender=kMale;
//															maleSelected=true;
//															femaleSelected=false;
														});
//														Fluttertoast.showToast(msg: 'Male Selected',toastLength: Toast.LENGTH_SHORT);
													},
													child: Container(
														child: Icon(
															FontAwesomeIcons.mars,
															color: Colors.white,
															size: 50,
														),
														height: 80,
														width: 80,
														decoration: BoxDecoration(
															borderRadius: BorderRadius.circular(10),
															color: Colors.blue,
														),
													),
												),
											),
											Padding(
												padding: const EdgeInsets.all(8.0),
												child: GestureDetector(
													onTap: (){
														setState(() {
//															gender=kFemale;
//															maleSelected=false;
//															femaleSelected=true;
														});
													//	Fluttertoast.showToast(msg: 'Female Selected',toastLength: Toast.LENGTH_SHORT);
													},
													child: Container(
														child: Icon(
															FontAwesomeIcons.venus,
															color: Colors.white,
															size: 50,
														),
														height: 80,
														width: 80,
														decoration: BoxDecoration(
															borderRadius: BorderRadius.circular(10),
															color: Colors.grey,
														),
													),
												),
											),

										],
									),
								],
							),
							Flexible(
								flex: 1,
								child: Container(
									child: Text('Enter your Phone Number',style: TextStyle(fontSize: 18,color: Colors.grey),),
									margin: EdgeInsets.fromLTRB(0,20,0,0),),
							),
							Expanded(
								flex: 2,
								child: Row(
									children: <Widget>[
										Container(
											color: Colors.grey[200],
											width: 80,
											child: Padding(
												padding: const EdgeInsets.all(16.0),
												child: Text('+91',style: TextStyle(fontSize: 18,color: Colors.grey),),
											),
										),
										SizedBox(width: 10,),
										Expanded(
											child: Container(
												color: Colors.grey[200],
												child: Padding(
													padding: const EdgeInsets.all(3.0),
													child: TextField(
														keyboardType: TextInputType.number,
														onChanged: (value){
															setState(() {
															//	phoneNumber=value;
															});
														},
														style: TextStyle(fontSize: 18,color: Colors.grey[700],fontWeight: FontWeight.bold),),
												),
											),
										)
									],
								),
							),
							Expanded(
								flex: 2,
								child: Row(
									children: <Widget>[
										Column(
											mainAxisAlignment: MainAxisAlignment.center,
											children: <Widget>[
												Text('Referral Roll No',style: TextStyle(fontSize: 16,color: Colors.grey),),
												Text('(Optional)',style: TextStyle(fontSize: 12,color: Colors.grey),),
											],
										),
										SizedBox(width: 10,),
										Expanded(
											child: Container(
												color: Colors.grey[200],
												child: TextField(
													textAlign: TextAlign.center,
													onChanged: (value){
														setState(() {
															//referral = value;
														});
													},
													style: TextStyle(fontSize: 18,color: Colors.grey[500],fontWeight: FontWeight.w700),),
											),
										)
									],
								),
							),
						],
					),
				),
			),
		);
  }
}
