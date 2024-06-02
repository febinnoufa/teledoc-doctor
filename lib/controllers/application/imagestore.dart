// imagestore()async{
//    // Ensure the image path is converted to a File
//                 if (applicationController.imageTemporary.value.isNotEmpty) {
//                   File imageFile =
//                       File(applicationController.imageTemporary.value);
//                   String? imageUrl =
//                       await applicationController.uploadImage(imageFile);

//                   if (imageUrl != null) {
//                     applicationController.downloadUrl.value = imageUrl;
//                     print(
//                         'Image uploaded successfully...............................................................: $imageUrl');
//                   } else {
//                     print(
//                         'Failed to upload image.....................................................................');
//                     // Handle the error case here if needed
//                   }
//                 } else {
//                   print(
//                       'No image selected............................................................................');
//                   // Handle the case where no image is selected
//                 }

//                 if (genderController.selectedGender.value.isNotEmpty) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       content: Text(
//                           'Selected gender: ${genderController.selectedGender.value}'),
//                     ),
//                   );
//                   Get.off(const ApplicatioDetailsScreen());
//                 } else {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(content: Text('Please select a gender')),
//                   );
//                 }
// }