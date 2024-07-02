import 'package:clean_coding/config/color/colors.dart';
import 'package:flutter/material.dart';

class InternetExceptionWidget extends StatelessWidget {

  final VoidCallback onPress;
  const InternetExceptionWidget({super.key,required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height*.15,
        ),
        const Icon(
          Icons.cloud_off,
          color: Colors.red,
          size: 50,

        ),
        Text(
            'We Are unable to show results\n Please check your data\n Connection',
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme.
          displayMedium!.
          copyWith(fontSize: 20),

        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height*.1,
        ),
        ElevatedButton(
            onPressed: (){

            },
            child: Center(child: Text('Retry',
                style: Theme.of(context).textTheme.bodySmall,


            ),
        ))
      ],
    );
  }
}
