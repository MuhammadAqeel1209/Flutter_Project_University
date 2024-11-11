import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isDarkMode;
  final VoidCallback toggleTheme;
  final List<String> menuItems;
  final ValueChanged<String?> onMenuItemSelected;

  const CustomAppBar({
    super.key,
    required this.isDarkMode,
    required this.toggleTheme,
    required this.menuItems,
    required this.onMenuItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start, // Align items to the start
        children: [
          // Main menu icon (dropdown) at the start of the row
          DropdownButton<String>(
            alignment: Alignment.topLeft,
            icon: Icon(
              Icons.menu,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
            items: menuItems.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              );
            }).toList(),
            onChanged: onMenuItemSelected,
            underline: Container(), // Hide underline
          ),

          // Expanded widget to center the title in the AppBar
          Expanded(
            child: Center(
              child: Text(
                "Gym Management",
                style: Theme.of(context).appBarTheme.titleTextStyle,
              ),
            ),
          ),

          // Toggle button for theme (right-aligned)
          IconButton(
            onPressed: toggleTheme,
            icon: Icon(
              isDarkMode ? Icons.toggle_off : Icons.toggle_on,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
      backgroundColor: isDarkMode ? Colors.black : Colors.blueAccent,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
