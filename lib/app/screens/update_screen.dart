import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../components/menu_component.dart';
import '../controllers/parking_spot_controller.dart';
import '../models/parking_spot_model.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({Key? key, required this.object}) : super(key: key);

  final ParkingSpotModel object;

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {

  var controller = ParkingSpotController.parkingSpotController;

  final _formKey = GlobalKey<FormState>();

  TextEditingController _parkingSpotNumberController = TextEditingController();
  TextEditingController _licensePlateCarController = TextEditingController();
  TextEditingController _brandCarController = TextEditingController();
  TextEditingController _modelCarController = TextEditingController();
  TextEditingController _colorCarController = TextEditingController();
  TextEditingController _responsibleNameController = TextEditingController();
  TextEditingController _apartamentController = TextEditingController();
  TextEditingController _blockController = TextEditingController();

  void initState() {
    super.initState();

    _parkingSpotNumberController.text = widget.object.parkingSpotNumber;
    _licensePlateCarController.text = widget.object.licensePlateCar;
    _brandCarController.text = widget.object.brandCar;
    _modelCarController.text = widget.object.modelCar;
    _colorCarController.text = widget.object.colorCar;
    _responsibleNameController.text = widget.object.responsibleName;
    _apartamentController.text = widget.object.apartment;
    _blockController.text = widget.object.block;

  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Page'),
      ),
      drawer: Menu(context),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _parkingSpotNumberController,
              decoration: const InputDecoration(
                hintText: 'numero da sua vaga',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _licensePlateCarController,
              decoration: const InputDecoration(
                hintText: 'Placa',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _brandCarController,
              decoration: const InputDecoration(
                hintText: 'Marca do Carro',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _modelCarController,
              decoration: const InputDecoration(
                hintText: 'Modelo do Veiculo',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _colorCarController,
              decoration: const InputDecoration(
                hintText: 'Cor',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _responsibleNameController,
              decoration: const InputDecoration(
                hintText: 'Dono',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _apartamentController,
              decoration: const InputDecoration(
                hintText: 'endereco',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _blockController,
              decoration: const InputDecoration(
                hintText: 'Bloco',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  ParkingSpotModel parkingSpot = ParkingSpotModel(
                      widget.object.id,
                      _parkingSpotNumberController.text,
                      _licensePlateCarController.text,
                      _brandCarController.text,
                      _modelCarController.text,
                      _colorCarController.text,
                      widget.object.registrationDate,
                      _responsibleNameController.text,
                      _apartamentController.text,
                      _blockController.text
                  );

                  var response = await controller.updateParkingSpot(parkingSpot);
                  if(response != false){

                    Get.snackbar(
                      "Cadastrado",
                      "Cadastrado",
                      icon: Icon(Icons.check, color: Colors.white),
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.lightGreen,
                      colorText: Colors.white,

                    );

                  }else{
                    Get.snackbar(
                        "ERROR",
                        "ERROR",
                        icon: Icon(Icons.error, color: Colors.white),
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.blue,
                        //   borderColor: Colors.blue
                        colorText: Colors.white
                    );
                  }

                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}