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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Dropdown menu for navigation
          DropdownButton<String>(
            icon: Icon(
              Icons.menu,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
            items: menuItems.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: onMenuItemSelected,
            underline: Container(), // Hide underline
          ),

          // Centered title
          Expanded(
            child: Center(
              child: Text(
                "Gym Management",
                style: Theme.of(context).appBarTheme.titleTextStyle,
              ),
            ),
          ),

          // Toggle button for theme
          IconButton(
            // IconButton(
            //   icon: Icon(
            //     Icons.search,
            //     size: 30,
            //     color: isDarkMode ? Colors.white : Colors.black,
            //   ),
            //   onPressed: () {
            //     // Implement search functionality here
            //   },
            // ),
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
