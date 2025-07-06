import 'package:flutter/material.dart';
class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});



  Stream<String> getLoadingMessage(){
      final message= <String>[
    'Cargando peliculas',
    'Cargando Populares',
    'Comprando palomitas',
    'Cargando sigue',
    'Algo pasa espere'
  ];
    return Stream.periodic(const Duration(milliseconds: 1200),(step){
      return message[step];
    }).take(message.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Espere'),
          const SizedBox(
            height: 10,
          ),
          const CircularProgressIndicator(strokeWidth: 2,),
          const SizedBox(
            height: 10,
          ),
          StreamBuilder(
            stream: getLoadingMessage(),
            //initialData: initialData,
            builder: (context, snapshot) {
              if(!snapshot.hasData)return const Text('Cargando.....');
              return Text(snapshot.data!);
            },
          ),
        ],
      ),
    );
  }
}