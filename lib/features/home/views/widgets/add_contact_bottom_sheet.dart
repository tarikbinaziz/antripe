import 'package:country_code_picker/country_code_picker.dart';
import 'package:task/core/core.dart';
import 'package:task/core/widgets/custom_textfield.dart';
import 'package:task/core/widgets/drop_downs/form_builder_drop_down_widget.dart';

void showAddContactSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => _AddContactSheet(),
  );
}

class _AddContactSheet extends StatelessWidget {
  _AddContactSheet();

  final phoneController = TextEditingController();
  String countryCode = "+880";

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();

    return DraggableScrollableSheet(
      initialChildSize: 0.65,
      minChildSize: 0.6,
      maxChildSize: 0.95,
      expand: false,
      builder: (_, controller) {
        return Container(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 12,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
          ),
          child: FormBuilder(
            key: formKey,
            child: ListView(
              controller: controller,
              children: [
                /// drag handle
                Center(
                  child: Container(
                    height: 6.h,
                    width: 151.w,
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Gap(24.h),

                /// NAME
                const CustomTextFieldWithHeading(
                  textFieldName: "name",
                  hintText: "Enter name",
                ),

                const SizedBox(height: 12),

                /// PHONE
                CustomTextFieldWithHeading(
                  textFieldName: "phone",
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  hintText: "1812 432 654",
                  prefixIcon: CountryCodePicker(
                    padding: EdgeInsets.zero,
                    onChanged: (code) {
                      countryCode = code.dialCode ?? "+880";
                    },
                    initialSelection: 'BD',
                    favorite: const ['+880', 'BD'],
                    showCountryOnly: false,
                    showOnlyCountryWhenClosed: false,
                    alignLeft: false,
                    hideMainText: true,
                    showDropDownButton: true,
                    
                  ),
                ),

                const SizedBox(height: 12),

                /// DESIGNATION
                const CustomTextFieldWithHeading(
                  textFieldName: "designation",
                  hintText: "Designation",
                ),

                const SizedBox(height: 12),

                /// COMPANY
                const CustomTextFieldWithHeading(
                  textFieldName: "company",
                  hintText: "Company",
                ),

                const SizedBox(height: 12),

                /// RELATION DROPDOWN
                CustomFormBuilderDropdown(
                  formKey: formKey,
                  name: "relation",
                  hintText: "Relation",
                  items: const ["Family", "Friend", "Colleague", "Other"],
                ),

                const SizedBox(height: 24),

                /// SAVE BUTTON
                SizedBox(
                  height: 52,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1F6E54),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    onPressed: () {
                      if (formKey.currentState?.saveAndValidate() ?? false) {
                        final data = formKey.currentState!.value;
                        debugPrint("FORM DATA = $data");

                        Navigator.pop(context);
                      }
                    },
                    child: const Text("Save Contact"),
                  ),
                ),

                const SizedBox(height: 12),

                /// CANCEL BUTTON
                SizedBox(
                  height: 52,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Cancel"),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
