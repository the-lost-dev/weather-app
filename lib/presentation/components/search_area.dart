import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/utils/utils.dart';

final cityProvider = StateProvider<String>((ref) => 'Lisbon');

class CitySearchArea extends ConsumerStatefulWidget {
  const CitySearchArea({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CitySearchAreaState();
}

class _CitySearchAreaState extends ConsumerState<CitySearchArea> {
  late final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.text = ref.read(cityProvider);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: symmetricHorizontalPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(
              child: TextField(
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1,
                cursorColor: AppColors.textColor,
                decoration: const InputDecoration(
                  fillColor: AppColors.searchFillColor,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.textColor,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.textColor),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                ),
                onSubmitted: (value) =>
                    ref.read(cityProvider.state).state = value,
              ),
            ),
          ),
          InkWell(
            child: Container(
              height: SizeConfig.blockSizeVertical * 6.5,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: AppColors.utilityColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  Strings.search,
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ),
            onTap: () {
              FocusScope.of(context).unfocus();
              ref.read(cityProvider.state).state = _searchController.text;
              print(cityProvider);
            },
          ),
        ],
      ),
    );
  }
}


// class CitySearchArea extends ConsumerWidget {
//   const CitySearchArea({Key? key}) : super(key: key);

//   static final _searchController = TextEditingController();

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Padding(
//       padding: symmetricHorizontalPadding,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Expanded(
//             child: SizedBox(
//               child: TextField(
//                 textAlign: TextAlign.center,
//                 style: Theme.of(context).textTheme.bodyText1,
//                 cursorColor: AppColors.textColor,
//                 decoration: const InputDecoration(
//                   fillColor: AppColors.searchFillColor,
//                   filled: true,
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(
//                       color: AppColors.textColor,
//                       width: 2,
//                     ),
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(10),
//                       bottomLeft: Radius.circular(10),
//                     ),
//                   ),
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide(color: AppColors.textColor),
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(10),
//                       bottomLeft: Radius.circular(10),
//                     ),
//                   ),
//                 ),
//                 onSubmitted: (value) =>
//                     ref.read(cityProvider.state).state = value,
//               ),
//             ),
//           ),
//           InkWell(
//             child: Container(
//               height: SizeConfig.blockSizeVertical * 6.5,
//               alignment: Alignment.center,
//               decoration: const BoxDecoration(
//                 color: AppColors.utilityColor,
//                 borderRadius: BorderRadius.only(
//                   topRight: Radius.circular(10),
//                   bottomRight: Radius.circular(10),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 15),
//                 child: Text(
//                   Strings.search,
//                   style: Theme.of(context).textTheme.headline3,
//                 ),
//               ),
//             ),
//             onTap: () {
//               FocusScope.of(context).unfocus();
//               ref.read(cityProvider.state).state = _searchController.text;
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
