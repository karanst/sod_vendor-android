import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:fixerking/RideFlow/utils/Session.dart';
import 'package:fixerking/new%20model/GetProfileModel.dart';
import 'package:fixerking/new%20model/categories_model.dart';
import 'package:fixerking/screen/profile/profile.dart';
import 'package:fixerking/token/token_string.dart';
import 'package:fixerking/utility_widget/customLoader.dart';
import 'package:fixerking/utils/app_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart'as http;
import 'package:image_picker_gallery_camera/image_picker_gallery_camera.dart';
// import 'package:image_picker_gallery_camera/image_picker_gallery_camera.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api/api_path.dart';
import '../../new model/Edit_Profile_Model.dart';
import '../../utils/colors.dart';

class EditNewProfile extends StatefulWidget {
  final Data? model;
  final String? upi, bankName, accNo, accHolderName, ifsc, accountType;
  const EditNewProfile({Key? key, this.model, this.upi, this.bankName, this.accNo, this.accHolderName, this.ifsc, this.accountType}) : super(key: key);



  @override
  State<EditNewProfile> createState() => _EditNewProfileState();
}

class _EditNewProfileState extends State<EditNewProfile> {

  String? bankValue;

  File? rcImage;
  File? rcImageBack;
  File? aadharImage;
  File? aadharImageBack;
  File? panImage;
  File? drivingImage;
  File? drivingImageBack;
  File? profileImage;

  String? type;
  String? appBarTitle;

  // String? type;
  // String? appBarTitle;

  int _value = 1;
  var _value1;

  bool isUpi = false;
  bool isLoading = false;
  List accountType = [
    'Savings',
    'Current'
  ];
  var accTypeValue;


  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController fssaiController = TextEditingController();
  TextEditingController vehicleController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController gstController = TextEditingController();
  TextEditingController storeNameController = TextEditingController();
  TextEditingController upiController = TextEditingController();
  TextEditingController accountHolderController = TextEditingController();
  TextEditingController accountNoController = TextEditingController();
  TextEditingController confirmAccountNoController = TextEditingController();
  TextEditingController ifscController = TextEditingController();
  TextEditingController accountTypeController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController storeDescriptionController = TextEditingController();


  Widget imageRC() {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        onTap: () {
          requestPermission(context, 3);
          // uploadRCFromCamOrGallary(context);
        },
        child: Center(
          child: Container(
            height: 100,
            width: MediaQuery.of(context).size.width/2 - 40,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(15)),
            child:
            // widget.model!.profileImage == null || widget.model!.profileImage == null ?
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: rcImage != null
                  ? Image.file(rcImage!, fit: BoxFit.cover)
                  :  widget.model!.rcBook == "" || widget.model!.rcBook ==  null?
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Icon(Icons.upload_file_outlined, size: 60)),
                  Text("Registration Card")
                ],
              )
              :   Image.network('${widget.model!.rcBook.toString()}', fit: BoxFit.cover)
            )
              //   : ClipRRect(
              // borderRadius: BorderRadius.circular(15),
              // child:
              // // rcImage != null ?
              // Image.network(widget.model!.profileImage.toString(), fit: BoxFit.cover)
              //     : Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Center(child: Icon(Icons.person, size: 60)),
              //     Text("Profile Image")
              //   ],
              // ),
            // )
            ,
          ),
        ),
      ),
    );
  }

  Widget imageRCBack() {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        onTap: () {
          requestPermission(context, 7);
          // uploadRCFromCamOrGallary(context);
        },
        child: Center(
          child: Container(
            height: 100,
            width: MediaQuery.of(context).size.width/2 - 40,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(15)),
            child:
            // widget.model!.profileImage == null || widget.model!.profileImage == null ?
            ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: rcImageBack != null
                    ? Image.file(rcImageBack!, fit: BoxFit.cover)
                    :  widget.model!.rcBookBack == "" || widget.model!.rcBookBack ==  null?
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Icon(Icons.upload_file_outlined, size: 60)),
                    Text("Registration Card")
                  ],
                )
                    :   Image.network('${widget.model!.rcBookBack.toString()}', fit: BoxFit.cover)
            )
            //   : ClipRRect(
            // borderRadius: BorderRadius.circular(15),
            // child:
            // // rcImage != null ?
            // Image.network(widget.model!.profileImage.toString(), fit: BoxFit.cover)
            //     : Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Center(child: Icon(Icons.person, size: 60)),
            //     Text("Profile Image")
            //   ],
            // ),
            // )
            ,
          ),
        ),
      ),
    );
  }

  Widget imageProfile() {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        onTap: () {
          requestPermission(context, 5);
          // uploadRCFromCamOrGallary(context);
        },
        child: Center(
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(15)),
            child:
            // widget.model!.profileImage == null || widget.model!.profileImage == "" ?
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: profileImage != null
                      ? Image.file(profileImage!, fit: BoxFit.cover)
                      : widget.model!.profileImage.toString() == '' || widget.model!.profileImage == null ?
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(child: Icon(Icons.person, size: 60)),
                      Text("Profile Image")
                    ],
                  ) : ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child:
                      Image.network('${widget.model!.profileImage.toString()}', fit: BoxFit.cover)
                  ),
                ),

            //   : ClipRRect(
            // borderRadius: BorderRadius.circular(15),
            // child:
            // // rcImage != null ?
            // Image.network(widget.model!.profileImage.toString(), fit: BoxFit.cover)
            // //     : Column(
            // //   mainAxisAlignment: MainAxisAlignment.center,
            // //   children: [
            // //     Center(child: Icon(Icons.person, size: 60)),
            // //     Text("Profile Image")
            // //   ],
            // // ),
            // )

          ),
        ),
      ),
    );
  }

  Widget imageAadhar() {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        onTap: () {
          // getImage(ImgSource.Both, context,1);
          requestPermission(context, 1);
          //uploadAadharFromCamOrGallary(context);
        },
        child: Center(
          child: Container(
            height: 100,
            width: MediaQuery.of(context).size.width / 2 - 40,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(15)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: aadharImage != null
                  ? Image.file(aadharImage!, fit: BoxFit.cover)
                  : widget.model!.adharCard == "" || widget.model!.adharCard ==  null?
              Column(
                children: [
                  Center(child: Icon(Icons.upload_file_outlined, size: 60)),
                  Text("Aadhar card")
                ],
              ) :  Image.network('${widget.model!.adharCard.toString()}', fit: BoxFit.cover),
          )
          ),
        ),
      ),
    );
  }

  Widget imageAadharBack() {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        onTap: () {
          requestPermission(context, 6);
        },
        child: Center(
          child: Container(
            height: 100,
            width: MediaQuery.of(context).size.width / 2 - 40,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(15)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: aadharImageBack != null
                  ? Image.file(aadharImageBack!, fit: BoxFit.cover)
                  : widget.model!.adharBack == "" || widget.model!.adharBack ==  null?
              Column(
                children: [
                  Center(
                      child: Icon(Icons.upload_file_outlined, size: 60)),
                  Text("Aadhar card back")
                ],
              )
              : Image.network('${widget.model!.adharBack.toString()}', fit: BoxFit.cover),
            ),
          ),
        ),
      ),
    );
  }

  Widget imagePan() {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        onTap: () {
          requestPermission(context, 2);
          // uploadPanFromCamOrGallary(context);
        },
        child: Center(
          child: Container(
            height: 100,
            width: MediaQuery.of(context).size.width - 60,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(15),
            ),
            child:
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: panImage != null
                  ? Image.file(panImage!, fit: BoxFit.cover)
                  : widget.model!.pancard == "" || widget.model!.pancard ==  null?
              Column(
                children: [
                  Center(child: Icon(Icons.upload_file_outlined, size: 60)),
                  Text("Pan Card")
                ],
              ): Image.network('${widget.model!.pancard.toString()}', fit: BoxFit.cover),
            )

          ),
        ),
      ),
    );
  }

  Widget imagedriving() {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        onTap: () {
          requestPermission(context, 4);
          // uploaddrivingFromCamOrGallary(context);
        },
        child: Center(
          child: Container(
            height: 100,
            width: MediaQuery.of(context).size.width/2 - 40,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: drivingImage != null
                  ? Image.file(drivingImage!, fit: BoxFit.cover)
                  :  widget.model!.drivingLicense == "" || widget.model!.drivingLicense ==  null?
              Column(
                children: const [
                  Center(child: Icon(Icons.upload_file_outlined, size: 60)),
                  Text("Driving License Front"),
                ],
              )
              :  Image.network('${widget.model!.drivingLicense.toString()}', fit: BoxFit.cover),
            ),
          ),
        ),
      ),
    );
  }

  Widget imageDrivingBack() {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        onTap: () {
          requestPermission(context, 8);
          // uploaddrivingFromCamOrGallary(context);
        },
        child: Center(
          child: Container(
            height: 100,
            width: MediaQuery.of(context).size.width/2 - 40,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: drivingImageBack != null
                  ? Image.file(drivingImageBack!, fit: BoxFit.cover)
                  :  widget.model!.drivingLicenseBack == "" || widget.model!.drivingLicenseBack ==  null?
              Column(
                children: const [
                  Center(child: Icon(Icons.upload_file_outlined, size: 60)),
                  Text("Driving License"),
                ],
              )
                  :  Image.network('${widget.model!.drivingLicenseBack.toString()}', fit: BoxFit.cover),
            ),
          ),
        ),
      ),
    );
  }

  String? pickLat;
  String? pickLong;

  // _getPickLocation() async {
  //   LocationResult result = await Navigator.of(context).push(MaterialPageRoute(
  //       builder: (context) => PlacePicker(
  //         "AIzaSyCqQW9tN814NYD_MdsLIb35HRY65hHomco",
  //       )));
  //   print(
  //       "checking adderss detail ${result.country!.name.toString()} and ${result.locality.toString()} and ${result.country!.shortName.toString()} ");
  //   setState(() {
  //     addressController.text = result.formattedAddress.toString();
  //     pickLat = result.latLng!.latitude.toString();
  //     pickLong = result.latLng!.longitude.toString();
  //     // cityC.text = result.locality.toString();
  //     // stateC.text = result.administrativeAreaLevel1!.name.toString();
  //     // countryC.text = result.country!.name.toString();
  //     // lat = result.latLng!.latitude;
  //     // long = result.latLng!.longitude;
  //     // pincodeC.text = result.postalCode.toString();
  //   });
  //   print("this is picked LAT LONG $pickLat @@ $pickLong");
  // }
  // _getPickLocation() async {
  //   // Navigator.push(
  //   //   context,
  //   //   MaterialPageRoute(
  //   //     builder: (context) => PlacePicker(
  //   //       apiKey: Platform.isAndroid
  //   //           ? "AIzaSyD6Jt-f1wlCIXV146XMOGtxrTNfzVB-2oY"
  //   //           : "AIzaSyD6Jt-f1wlCIXV146XMOGtxrTNfzVB-2oY",
  //   //       onPlacePicked: (result) async {
  //   //         print(result.formattedAddress);
  //   //         currentAddress.text = result.formattedAddress.toString();
  //   //         latitude = result.geometry!.location.lat;
  //   //         longitude = result.geometry!.location.lng;
  //   //         SharedPreferences preferences =
  //   //         await SharedPreferences.getInstance();
  //   //         await preferences.setString(mylatitude, latitude.toString());
  //   //         await preferences.setString(mylongitude, longitude.toString());
  //   //         // pinController.text = result.first.postalCode;
  //   //         loc.lat = latitude;
  //   //         loc.lng = longitude;
  //   //
  //   //         Navigator.of(context).pop();
  //   //         setState(() {
  //   //           sellerList.clear();
  //   //           getSeller();
  //   //           _refresh();
  //   //         });
  //   //       },
  //   //       initialPosition: latitude != null
  //   //           ? LatLng(double.parse(latitude.toString()),
  //   //           double.parse(longitude.toString()))
  //   //           : LatLng(20.5937, 78.9629),
  //   //       //useCurrentLocation: true,
  //   //       selectInitialPosition: true,
  //   //     ),
  //   //   ),
  //   // );
  //   var result = await Navigator.of(context).push(MaterialPageRoute(
  //       builder: (context) => PlacePicker(
  //         apiKey: "AIzaSyCqQW9tN814NYD_MdsLIb35HRY65hHomco",
  //         onPlacePicked: (result) async {
  //           print(result.formattedAddress);
  //           addressController.text = result.formattedAddress.toString();
  //           pickLat = result.geometry!.location.lat;
  //           pickLong = result.geometry!.location.lng;
  //
  //           Navigator.pop(context);
  //
  //         }, initialPosition: pickLat != null
  //           ? LatLng(double.parse(pickLat.toString()),
  //           double.parse(pickLong.toString()))
  //           : LatLng(20.5937, 78.9629),
  //         useCurrentLocation: true,
  //
  //
  //       )
  //   ));
  //   print(
  //       "checking adderss detail ${result.country!.name.toString()} and ${result.locality.toString()} and ${result.country!.shortName.toString()} ");
  //   // setState(() {
  //   //   addressController.text = result.formattedAddress.toString();
  //   //   pickLat = result.latLng!.latitude.toString();
  //   //   pickLong = result.latLng!.longitude.toString();
  //   //   // cityC.text = result.locality.toString();
  //   //   // stateC.text = result.administrativeAreaLevel1!.name.toString();
  //   //   // countryC.text = result.country!.name.toString();
  //   //   // lat = result.latLng!.latitude;
  //   //   // long = result.latLng!.longitude;
  //   //   // pincodeC.text = result.postalCode.toString();
  //   // });
  //   print("this is picked LAT LONG $pickLat @@ $pickLong");
  // }

  UpdateRequest() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? uid = prefs.getString(TokenString.userid);

    var headers = {'Cookie': 'ci_session=cf2fmpq7vue0kthvj5s046uv4m2j5r11'};

    var request = http.MultipartRequest(
        'POST', Uri.parse('${Apipath.editProfile}'));
    request.fields.addAll({
      'id': "$uid",
      'type': "$type",
      'name': '${nameController.text.toString()}',
      'mobile': '${mobileController.text.toString()}',
      'email': '${emailController.text.toString()}',
      'address': '${addressController.text.toString()}',
      'lat': pickLat == '' || pickLat == null ? widget.model!.latitude.toString() : '${pickLat.toString()}' ,
      'lang': pickLong == '' || pickLong == null ? widget.model!.longitude.toString() : '${pickLong.toString()}',
      'gst_no': '${gstController.text.toString()}',
      'bank_upi':
      isUpi ?
    '{"account_holder_name" : "${accountHolderController.text.toString()}","account_number" : "${accountNoController.text.toString()}","bank_name" : "${bankNameController.text.toString()}","account_type": "${accTypeValue.toString()}","ifsc_code" : "${ifscController.text.toString()}"}'
      : '{"UPI" : "${upiController.text.toString()}"}'
    });

    ///orderfood
    if (type == "1") {
      request.fields.addAll({
        'store_name': type == "1"? '${storeNameController.text.toString()}' : '',
        'store_description' : '${storeDescriptionController.text.toString()}',
        'fssai': '${fssaiController.text.toString()}',
        'gst_no': '${gstController.text.toString()}',
      });
    }

    ///2wheeler


   profileImage == null ? null :   request.files.add(
          await http.MultipartFile.fromPath('profile_image', profileImage!.path.toString()));

    aadharImageBack == null ? null :   request.files.add(
        await http.MultipartFile.fromPath('adhar_back', aadharImageBack!.path.toString()));

    drivingImage == null ? null :   request.files.add(
        await http.MultipartFile.fromPath('driving_front', drivingImage!.path.toString()));

    drivingImageBack == null ? null :   request.files.add(
        await http.MultipartFile.fromPath('driving_back', drivingImageBack!.path.toString()));

    rcImage == null ? null :   request.files.add(
        await http.MultipartFile.fromPath('rc_front', rcImage!.path.toString()));

    rcImageBack == null ? null :   request.files.add(
        await http.MultipartFile.fromPath('rc_back', rcImageBack!.path.toString()));

  // aadharImage == null ? null :  request.files.add(
  //       await http.MultipartFile.fromPath('adhar_card', aadharImage!.path.toString()));
  //
  //   aadharImage == null ? null :  request.files.add(
  //       await http.MultipartFile.fromPath('adhar_card', aadharImage!.path.toString()));

    aadharImage == null ? null :  request.files.add(
        await http.MultipartFile.fromPath('adhar_card', aadharImage!.path.toString()));



   panImage == null ? null : request.files
        .add(await http.MultipartFile.fromPath('pancard', panImage!.path.toString()));

    print("ok++++++++======>>>>${request.fields} ${request.files}");
    request.headers.addAll(headers);

    var response = await request.send();

    String str = await response.stream.bytesToString();
    print("this is response =========>>>> ${response.statusCode}");
    if (response.statusCode == 200) {
      print("this is respoinse @@ ${response.statusCode}");
      setState((){
        isLoading = false;
      });
      var result = jsonDecode(str);
      final jsonResponse = EditProfileModel.fromJson(result);
      Fluttertoast.showToast(msg: "${jsonResponse.message}");
      Navigator.pop(context, true);
      // Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
      // }

    } else {
      setState((){
        isLoading = false;
      });
      Fluttertoast.showToast(msg: "Error during communication : server error");
      print(response.reasonPhrase);
    }
  }


  String? uid;
  void checkingLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      uid = prefs.getString(TokenString.userid).toString();
      type = prefs.getString(TokenString.type).toString();
    });
    print("this id uid ${uid.toString()} aand ${type}");
  }

  void requestPermission(BuildContext context,int i) async{
    return await showDialog<void>(
      context: context,
      // barrierDismissible: barrierDismissible, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(6))),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              InkWell(
                onTap: () async {
                  getFromGallery(i);
                },
                child: Container(
                  child: ListTile(
                      title:  Text("Gallery"),
                      leading: Icon(
                        Icons.image,
                        color: colors.primary,
                      )),
                ),
              ),
              Container(
                width: 200,
                height: 1,
                color: Colors.black12,
              ),
              InkWell(
                onTap: () async {
                  getImage(ImgSource.Camera, context, i);
                },
                child: Container(
                  child: ListTile(
                      title:  Text("Camera"),
                      leading: Icon(
                        Icons.camera,
                        color: colors.primary,
                      )),
                ),
              ),
            ],
          ),
        );
      },
    );

  }

  Future<void> getFromGallery(int i) async {
    var result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );
    if (result != null) {
      setState(() {
        if(i==1){
          aadharImage = File(result.files.single.path.toString());
        }else  if(i==2){
          panImage = File(result.files.single.path.toString());
        }else  if(i==3){
          rcImage = File(result.files.single.path.toString());
        }else if(i==4){
          drivingImage = File(result.files.single.path.toString());
        } else if(i==5){
          profileImage = File(result.files.single.path.toString());
        }
        else if(i==6){
          aadharImageBack = File(result.files.single.path.toString());
        }
        else if(i==7){
          rcImageBack = File(result.files.single.path.toString());
        }
        else if(i==8){
          drivingImageBack = File(result.files.single.path.toString());
        }
        // else if(i==8){
        //   fssaiImage = File(result.files.single.path.toString());
        // }
        // else if(i==9){
        //   gstImage = File(result.files.single.path.toString());
        // }
      });
      Navigator.pop(context);
    } else {
      // User canceled the picker
    }
  }

  Future getImage(ImgSource source, BuildContext context,int i) async {
    var image = await ImagePickerGC.pickImage(
      context: context,
      source: source,
      cameraIcon: Icon(
        Icons.add,
        color: Colors.red,
      ), //cameraIcon and galleryIcon can change. If no icon provided default icon will be present
    );

    getCropImage(context, i, image);
  }

  void getCropImage(BuildContext context,int i,var image) async {
    CroppedFile? croppedFile = await ImageCropper.platform.cropImage(
      sourcePath: image.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
    );
    setState(() {
      if(i==1){
        aadharImage = File(croppedFile!.path);
      } else  if(i==2){
        panImage = File(croppedFile!.path);
      }
      else  if(i==3){
        rcImage = File(croppedFile!.path);
      }
      else if(i==4){
        drivingImage = File(croppedFile!.path);
      } else if(i==5){
        profileImage = File(croppedFile!.path);
      }  else if(i==6){
        aadharImageBack = File(croppedFile!.path);
      }
      else if(i==7){
        rcImageBack = File(croppedFile!.path);
      }
      else if(i==8){
        drivingImageBack = File(croppedFile!.path);
      }
    });
    Navigator.pop(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController = TextEditingController(text: widget.model!.uname.toString());
    emailController = TextEditingController(text: widget.model!.email.toString());
    mobileController = TextEditingController(text: widget.model!.mobile.toString());
    companyController = TextEditingController(text: widget.model!.companyName.toString());
    gstController = TextEditingController(text: widget.model!.gstNo.toString());
    fssaiController = TextEditingController(text: widget.model!.fssai.toString());
    addressController = TextEditingController(text: widget.model!.address.toString());
    storeNameController = TextEditingController(text: widget.model!.storeName.toString());
    storeDescriptionController = TextEditingController(text: widget.model!.storeDescription.toString());
    companyController = TextEditingController(text: widget.model!.companyName.toString());
    print("this is 35456 ${widget.upi}");
    if(widget.upi == null || widget.upi == ""){
      if(widget.bankName != null && widget.accNo != null && widget.accHolderName != null && widget.ifsc != null
          || widget.bankName != "" && widget.accNo != "" && widget.accHolderName != "" && widget.ifsc != ""){
        bankNameController = TextEditingController(text: widget.bankName.toString());
        accountNoController = TextEditingController(text: widget.accNo.toString());
        confirmAccountNoController = TextEditingController(text: widget.accNo.toString());
        accountHolderController = TextEditingController(text: widget.accHolderName.toString());
        ifscController = TextEditingController(text: widget.ifsc.toString());
        accTypeValue = widget.accountType;
        print("tis is working here 2222");
        setState(() {
          _value = 2;
          isUpi = true;
        });
      }

    // }
    } else{
      print("tis is working here 1111");
      upiController = TextEditingController(text: widget.upi.toString());
      // if(upiController.text.isEmpty) {
      //   setState(() {
      //     _value = 2;
      //     isUpi = true;
      //   });
      // }else{
      setState(() {
        _value = 1;
        isUpi = false;
      });
    }
    // bankNameController = TextEditingController(text: widget.model!.bandDetails.toString());
    checkingLogin();
    // _getFoodVarients();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor().colorPrimary(),
      appBar: AppBar(
        title: Text("Edit Profile",),
        centerTitle: true,

        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios
          ),
        ),
        backgroundColor: AppColor().colorPrimary(),
        elevation: 0,
      ),
        // centerTitle: true,
        // title: Text("Profile"),),
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding:  EdgeInsets.only(top: 40),
          child : Container(
              padding: EdgeInsets.only(top: 5),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: AppColor().colorSecondary(),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45),
                  )),
              child: Container(
                height:  MediaQuery.of(context).size.height/1.2,
                 // height: MediaQuery.of(context).size.height-85.0-75,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45),
                        topRight: Radius.circular(45),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.only(top:70, left: 30.0, right: 30),
                    child: SingleChildScrollView(
                      child:
                      // Container(
                      //   child: Column(
                      //     children: [
                      //       SizedBox(
                      //         height: MediaQuery.of(context).size.height * .05,
                      //       ),
                      //       Row(
                      //         children: [
                      //           Text("Helly Rock "),
                      //           Text("Helly Rock "),
                      //         ],
                      //       ),
                      //       Text("Helly Rock "),
                      //       SizedBox(
                      //         height: 10,
                      //       ),
                      //
                      //
                      //
                      //
                      //       // AppBtn(
                      //       //   title: "Update Profile",
                      //       //   onPress: (){
                      //       //     setState(() {
                      //       //       change=true;
                      //       //     });
                      //       //      Navigator.push(context, MaterialPageRoute(builder: (context)=> const BottomNav()));
                      //       //   },
                      //       //   height: 50,
                      //       //   width: MediaQuery.of(context).size.width,
                      //       //   fSize: 18,
                      //       // )
                      //
                      //
                      //     ],
                      //   ),
                      // ) :
                      Container(
                        child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // SizedBox(
                            //   height: MediaQuery.of(context).size.height * .05,
                            // ),
                            // SizedBox(height: 30,),

                            Padding(
                              padding: EdgeInsets.only(left: 10, bottom: 0),
                              child: Text('Name'),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 50,
                              child: TextFormField(
                                  keyboardType: TextInputType.name,
                                  controller: nameController,
                                  validator: (msg) {
                                    if (msg!.isEmpty) {
                                      return "Please Enter name";
                                    }
                                  },
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(15)))),
                            ),
                            const SizedBox(
                              height: 10,
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left:10),
                              child: Text('Email Id'),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 50,
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                  controller: emailController,
                                  validator: (msg) {
                                    if (msg!.isEmpty) {
                                      return "Please Enter Email Id";
                                    }
                                  },
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(15)))),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, left: 10,),
                              child: Text('Mobile No.'),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 50,
                              child: TextFormField(
                                  controller: mobileController,
                                  maxLength: 10,
                                  keyboardType: TextInputType.phone,
                                  validator: (msg) {
                                    if (msg!.isEmpty) {
                                      return "Please Enter Mobile number";
                                    }
                                  },
                                  decoration: InputDecoration(
                                      counterText: "",
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(15)))),
                            ),

                            const SizedBox(
                              height: 10,
                            ),
                            type  == "2"|| type =="3"|| type =="4" ?
                                SizedBox.shrink()
                          :  Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left:10),
                                  child: Text(
                                      type == "1" ?
                                      'Store Name'
                                          :'Company Name'),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 50,
                                  child: TextFormField(
                                      keyboardType: TextInputType.name,
                                      controller:  type == "1" ? storeNameController : companyController,
                                      validator: (msg) {
                                        if (msg!.isEmpty) {
                                          return "Please Enter Company ";
                                        }
                                      },
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(15)))),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left:10),
                                  child: Text('GST Number'),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 50,
                                  child: TextFormField(
                                      keyboardType: TextInputType.name,
                                      controller: gstController,
                                      validator: (msg) {
                                        if (msg!.isEmpty) {
                                          return "Please Enter GST Number ";
                                        }
                                      },
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(15)))),
                                ),
                                // const SizedBox(
                                //   height: 10,
                                // ),
                              ],
                            ),

                           type =="1"?
                           Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Padding(
                                 padding: const EdgeInsets.only(top: 10, left:10),
                                 child: Text('Store Description'),
                               ),
                               SizedBox(
                                 height: 10,
                               ),
                               Container(
                                 height: 50,
                                 child: TextFormField(
                                     keyboardType: TextInputType.name,
                                     controller: storeDescriptionController,
                                     // validator: (msg) {
                                     //   if (msg!.isEmpty) {
                                     //     return "Please Enter GST Number ";
                                     //   }
                                     // },
                                     decoration: InputDecoration(
                                         border: OutlineInputBorder(
                                             borderRadius: BorderRadius.circular(15)))),
                               ),
                               const SizedBox(
                                 height: 10,
                               ),

                               Padding(
                                 padding: const EdgeInsets.only(left:10),
                                 child: Text('FSSAI No.'),
                               ),
                               SizedBox(
                                 height: 10,
                               ),
                               Container(
                                 height: 50,
                                 child: TextFormField(
                                     keyboardType: TextInputType.name,
                                     controller: fssaiController,
                                     // validator: (msg) {
                                     //   if (msg!.isEmpty) {
                                     //     return "Please Enter GST Number ";
                                     //   }
                                     // },
                                     decoration: InputDecoration(
                                         border: OutlineInputBorder(
                                             borderRadius: BorderRadius.circular(15)))),
                               ),
                             ],
                           )
                            : SizedBox.shrink(),
                            const SizedBox(
                              height: 10,
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text('Address'),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                // _getPickLocation();
                              },
                              child: Container(
                                // height: 60,
                                child: TextFormField(
                                    maxLines: 3,
                                    controller: addressController,
                                    validator: (msg) {
                                      if (msg!.isEmpty) {
                                        return "Please Enter Address ";
                                      }
                                    },
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => PlacePicker(
                                            apiKey: Platform.isAndroid
                                                ? "AIzaSyB0uPBgryG9RisP8_0v50Meds1ZePMwsoY"
                                                : "AIzaSyB0uPBgryG9RisP8_0v50Meds1ZePMwsoY",
                                            onPlacePicked: (result) {
                                              print(result.formattedAddress);
                                              setState(() {
                                                addressController.text =
                                                    result.formattedAddress.toString();
                                                pickLat =
                                                    result.geometry!.location.lat.toString();
                                                pickLong =
                                                    result.geometry!.location.lng.toString();
                                              });
                                              Navigator.of(context).pop();
                                            },
                                            initialPosition: LatLng(22.719568,75.857727
                                              // double.parse(widget.lat.toString()), double.parse(widget.long.toString())
                                            ),
                                            useCurrentLocation: true,
                                          ),
                                        ),
                                      );
                                      // _getPickLocation();
                                    },
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(15)))
                                  // decoration: InputDecoration(
                                  //   border: OutlineInputBorder(),
                                  // ),
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 0.0, bottom: 20),
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(left: 5.0, top: 5, bottom: 10),
                                        child: Text(
                                          "Aadhaar Card",
                                          style: TextStyle(
                                            fontSize: 15,
                                            // color: AppColor().colorSecondary()
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [imageAadhar(), imageAadharBack()],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(left: 5, top: 10, bottom: 10),
                                        child: Text(
                                          "Pan Card",
                                          style: TextStyle(
                                            fontSize: 15,
                                            // color: AppColor().colorSecondary()
                                          ),
                                        ),
                                      ),
                                      imagePan(),
                                    ],
                                  ),

                                  type == "2" || type == "3" || type == "4"
                                      ? Column(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 5.0, top: 10, bottom: 10),
                                            child: Text(
                                              "Registration Card",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              imageRC(),
                                              imageRCBack(),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 5.0, top: 10, bottom: 10),
                                            child: Text(
                                              "Driving License",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              imagedriving(),
                                              imageDrivingBack()
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                      : SizedBox.shrink(),

                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Radio(
                                        value: 1,
                                        fillColor: MaterialStateColor.resolveWith((states) => AppColor().colorPrimary()),
                                        groupValue: _value,
                                        onChanged: (int? value) {
                                          setState(() {
                                            _value = value!;
                                            isUpi = false;
                                          });
                                        }),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      "Bank Upi",
                                      style: TextStyle(color: AppColor.PrimaryDark),
                                    ),
                                  ],
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Radio(
                                        value: 2,
                                        fillColor: MaterialStateColor.resolveWith((states) => AppColor().colorPrimary()),
                                        groupValue: _value,
                                        onChanged: (int? value) {
                                          setState(() {
                                            _value = value!;
                                            isUpi = true;
                                          });
                                        }),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text("Bank Account",
                                      style: TextStyle(
                                          color: AppColor.PrimaryDark
                                      ),),
                                  ],
                                ),
                              ],
                            ),

                            isUpi == false
                                ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text('UPI Id'),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 50,
                                  child: TextFormField(
                                      controller: upiController,
                                      // validator: (msg) {
                                      //   if (msg!.isEmpty) {
                                      //     return "Please Enter UPI Id ";
                                      //   }
                                      // },
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(15)))
                                    // decoration: InputDecoration(
                                    //   border: OutlineInputBorder(),
                                    // ),
                                  ),
                                ),
                              ],
                            )
                                : SizedBox.shrink(),
                            isUpi == true
                                ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text('Account Holder Name'),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 50,
                                  child: TextFormField(
                                      controller: accountHolderController,
                                      // validator: (msg) {
                                      //   if (msg!.isEmpty) {
                                      //     return "Please Enter Account Holder Name ";
                                      //   }
                                      // },
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(15)))
                                    // decoration: InputDecoration(
                                    //   border: OutlineInputBorder(),
                                    // ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text('Account Number'),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 50,
                                  child: TextFormField(
                                      controller: accountNoController,
                                      keyboardType: TextInputType.number,
                                      // validator: (msg) {
                                      //   if (msg!.isEmpty) {
                                      //     return "Please Enter Account Number";
                                      //   }
                                      // },
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(15)))
                                    // decoration: InputDecoration(
                                    //   border: OutlineInputBorder(),
                                    // ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text('Confirm Account Number'),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 50,
                                  child: TextFormField(
                                      controller: confirmAccountNoController,
                                      keyboardType: TextInputType.number,
                                      // validator: (msg) {
                                      //   if (msg!.isEmpty) {
                                      //     return "Please Enter Account Number";
                                      //   }
                                      // },
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(15)))
                                    // decoration: InputDecoration(
                                    //   border: OutlineInputBorder(),
                                    // ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text('Bank Name'),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 50,
                                  child: TextFormField(
                                      controller: bankNameController,
                                      // validator: (msg) {
                                      //   if (msg!.isEmpty) {
                                      //     return "Please Enter Bank Name ";
                                      //   }
                                      // },
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(15)))
                                    // decoration: InputDecoration(
                                    //   border: OutlineInputBorder(),
                                    // ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text('IFSC Code'),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 50,
                                  child: TextFormField(
                                      controller: ifscController,
                                      // validator: (msg) {
                                      //   if (msg!.isEmpty) {
                                      //     return "Please Enter IFSC Code";
                                      //   }
                                      // },
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(15)))
                                    // decoration: InputDecoration(
                                    //   border: OutlineInputBorder(),
                                    // ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text('Account Type'),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 60,
                                  padding: EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      border: Border.all(
                                          color: Colors.black.withOpacity(0.7))),
                                  child: DropdownButton(
                                    // Initial Value
                                    value: accTypeValue,
                                    underline: Container(),
                                    isExpanded: true,
                                    // Down Arrow Icon
                                    icon: Icon(Icons.keyboard_arrow_down),
                                    hint: Text("Select Account Type"),
                                    // Array list of items
                                    items: accountType.map((items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Container(
                                            child: Text(items.toString())),
                                      );
                                    }).toList(),
                                    // After selecting the desired option,it will
                                    // change button value to selected value
                                    onChanged: (newValue) {
                                      setState(() {
                                        accTypeValue = newValue!;
                                        print(
                                            "selected category ${accTypeValue.toString()}");
                                      });
                                    },
                                  ),
                                ),
                              ],
                            )
                                : SizedBox.shrink(),
                            SizedBox(height: 30,),

                            InkWell(
                              onTap: (){
                                setState((){
                                  isLoading = true;
                                });
                                if(isUpi){
                                  if(accountNoController.text.isEmpty && accountHolderController.text.isEmpty && bankNameController.text.isEmpty && ifscController.text.isEmpty){
                                    Fluttertoast.showToast(msg: "Please enter valid bank details!");
                                    setState(() {
                                      isLoading =false;
                                    });
                                  }else{
                                    UpdateRequest();
                                  }
                                }else{
                                  if(upiController.text.isNotEmpty){
                                    UpdateRequest();
                                  }else{
                                    setState(() {
                                      isLoading =false;
                                    });
                                    Fluttertoast.showToast(msg: "Please enter valid UPI Id!");
                                  }
                                }

                              },
                              child: Container(
                                  height: 43,
                                  width: MediaQuery.of(context).size.width/ 1.2,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: AppColor().colorSecondary()),
                                  child: Center(child: isLoading ?
                                  loadingWidget()
                                      :
                                  Text("Submit", style: TextStyle(fontSize: 18, color: AppColor.PrimaryDark)))
                              ),
                            ),
                            // AppBtn(
                            //   onPress: (){
                            //     UpdateRequest();
                            //   },
                            //   label: "Update",
                            // ),
                            // InkWell(
                            //   onTap: (){
                            //     UpdateRequest();
                            //    /* Navigator.push(context, MaterialPageRoute(builder: (context)=>EditNewProfile()));*/
                            //   },
                            //   child: Container(
                            //     height: 44,
                            //     width: 300,
                            //     decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.circular(10.0),
                            //         color:AppColor.PrimaryDark
                            //     ),
                            //     child: Center(
                            //       child: Text(
                            //         "Update",
                            //         style: TextStyle(
                            //             color: Colors.white,
                            //             fontWeight: FontWeight.bold,fontSize: 15
                            //         ),
                            //       ),
                            //     ),
                            //   ),),
                            SizedBox(height: 30,),
                          ],
                        ),

                      ) ,







                    ),

                  )),
      )


            ),

            Positioned(
              top: 0,
              // left: MediaQuery.of(context).size.width * .38,
              child: Center(
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child:    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Stack(
                        children: [
                          imageProfile(),
                          Positioned(
                              bottom: 0,
                              right: -2,
                              child: InkWell(
                                onTap: (){
                                  requestPermission(context, 5);
                                },
                                child: Card(
                                    elevation: 4,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(40)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Icon(Icons.edit),
                                    )),
                              ))
                        ],
                      )
                  ),
                ),
              ),
            ),


            // Positioned(
            //   top:5,
            //   // left: MediaQuery.of(context).size.width * .38,
            //   child: Center(
            //     child: Container(
            //         decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(10)
            //         ),
            //         child:
            //
            //         Stack(
            //           children: [
            //             ClipRRect(
            //               borderRadius: BorderRadius.circular(10),
            //               child: imageProfile()
            //             ),
            //
            //           ],
            //         )
            //
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
