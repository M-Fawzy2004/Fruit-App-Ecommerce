import 'package:e_commerce_app/core/helper/function/get_user.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/feature/profile/presentation/provider/user_provider/user_provider.dart';
import 'package:e_commerce_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce_app/core/utils/assets.dart';
import 'package:e_commerce_app/core/widget/custom_button.dart';
import 'package:e_commerce_app/feature/profile/presentation/view/widget/edit_profile_text_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  bool _isEditable = false;

  @override
  void initState() {
    super.initState();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    _nameController = TextEditingController(text: userProvider.name);
    _emailController = TextEditingController(text: userProvider.email);
  }

  void _saveData() {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider.updateName(_nameController.text);
    setState(() => _isEditable = false);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${LocaleKeys.Profile_infoAccount.tr()} :',
          style: Styles.fontText16(context),
        ),
        SizedBox(
          height: screenHeight * 0.02,
        ),
        Consumer<UserProvider>(
          builder: (context, userProvider, child) {
            return EditProfileTextField(
              text: userProvider.name,
              controller: _nameController,
              isEditable: _isEditable,
              image: Assets.imagesVector,
              onEditPressed: () {
                setState(() => _isEditable = !_isEditable);
                if (!_isEditable) _saveData();
              },
            );
          },
        ),
        SizedBox(
          height: screenHeight * 0.02,
        ),
        EditProfileTextField(
          text: getUser().email,
          controller: _emailController,
          isEditable: false,
        ),
        SizedBox(
          height: screenHeight * 0.02,
        ),
        CustomButton(
          text: LocaleKeys.Profile_saveChange.tr(),
          onTap: _saveData,
        ),
      ],
    );
  }
}
