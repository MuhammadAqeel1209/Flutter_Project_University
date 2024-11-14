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
      title: Text(
        "Gym Management",
        style: Theme.of(context).appBarTheme.titleTextStyle,
      ),
      leading: PopupMenuButton<String>(
        icon: Icon(
          Icons.menu,
          color: isDarkMode ? Colors.white : Colors.black,
        ),
        onSelected: onMenuItemSelected,
        itemBuilder: (BuildContext context) {
          return menuItems.map((String item) {
            return PopupMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            );
          }).toList();
        },
      ),
      actions: [
        IconButton(
          onPressed: toggleTheme,
          icon: Icon(
            isDarkMode ? Icons.toggle_off : Icons.toggle_on,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
      ],
      backgroundColor: isDarkMode ? Colors.black : Colors.blueAccent,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
