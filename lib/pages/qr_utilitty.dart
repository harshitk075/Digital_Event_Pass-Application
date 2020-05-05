import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qrcode/qrcode.dart';
import 'package:digitaleventpass/pages/home.dart';
class QrUtility extends StatefulWidget {

	final String EventID;
	QrUtility({Key key,@required this.EventID}):super(key: key);
	
  @override
  _QrUtilityState createState() => _QrUtilityState();
}

class _QrUtilityState extends State<QrUtility> {
	QRCaptureController _captureController = QRCaptureController();
  String EventID;
	bool _isTorchOn = false;
	final _firestore = Firestore.instance;
	@override
	void initState() {
		 EventID = widget.EventID;
		_captureController.onCapture((data)  async {
			_captureController.pause();

			var document = await _firestore.collection('OrganizerContainer').document(home.getUid()).
			collection("Events").document(EventID).collection("Inviteelist").document(data).get();
			print(document.data);
			if(document.data==null){
				_captureController.pause();
				await Navigator.pushNamed(context, "/notverified");
				_captureController.resume();
			}
			else{
				    var doc=  await _firestore.collection('OrganizerContainer').document(home.getUid()).
						collection("Events").document(EventID).collection("Inviteelist").document(data).get();
				    //var x= doc.get();
				    if(doc.data["isverified"]==false) {
							_firestore.collection('OrganizerContainer').document(home.getUid()).
							collection("Events").document(EventID).collection("Inviteelist").document(data).updateData({
								'Timestamp' : Timestamp.now(),
								'isverified' : true,
							});
							await Navigator.pushNamed(context,"/verified");
							_captureController.resume();
				    }
				    else{
							await Navigator.pushNamed(context, "/notverified");
							_captureController.resume();
						}
			}
			//print(document.data['OrgmailId']);
		});
		super.initState();
	}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
			body: Stack(
			alignment: Alignment.center,
			children: <Widget>[
				QRCaptureView(controller: _captureController),
				Align(
					alignment: Alignment.bottomCenter,
					child: _buildToolBar(),
				)
			],
		),);
  }
	Widget _buildToolBar() {
		return Row(
			mainAxisSize: MainAxisSize.max,
			mainAxisAlignment: MainAxisAlignment.center,
			children: <Widget>[
				FlatButton(
					onPressed: () {
						_captureController.pause();
					},
					child: Text('pause'),
				),
				FlatButton(
					onPressed: () {
						if (_isTorchOn) {
							_captureController.torchMode = CaptureTorchMode.off;
						} else {
							_captureController.torchMode = CaptureTorchMode.on;
						}
						_isTorchOn = !_isTorchOn;
					},
					child: Text('torch'),
				),
				FlatButton(
					onPressed: () {
						_captureController.resume();
					},
					child: Text('resume'),
				),
			],
		);
	}
}
