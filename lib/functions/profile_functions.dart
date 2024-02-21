void handleItemClick(context, Map<String, String> item) {
  // You can customize this function based on the item clicked
  // print("Clicked on item: ${item["name"]} with tag ${item["tag"]}");
  // Add your logic here
  if (item["name"] == "Contact Us") {
    // Navigate to ContactUsPage
    print('contact us');
  } else if (item["name"] == "Setting") {
    // Navigate to SettingsView
    print('settings');
  } else if (item["name"] == "Privacy Policy") {
    // Navigate to SettingsView
    print('privacy policy');
  } else if (item["name"] == "Personal Data") {
    print('Personal Data');
  } else if (item["name"] == "Achievement") {
    print('Achievement');
  } else if (item["name"] == "Activity History") {
    print('Activity History');
  } else if (item["name"] == "Workout Progress") {
    print('Workout Progress');
  }
}
