import 'package:flutter/material.dart';
import 'package:nearest_beer/core/constants/constants.dart';
import 'package:nearest_beer/features/settings/presentation/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Nearest Beer',
          style: TextStyle(
            fontSize: 32,
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          children: [
            const SizedBox(
              width: 16,
            ),
            Text(
              'Settings',
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Divider(),
        ),
        SizedBox(
          height: 550,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 32,
                ),
                ListTile(
                  leading: const Text(
                    'Dark mode',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  trailing: Switch(
                    value: settingsProvider.isSelected,
                    onChanged: (value) {
                      settingsProvider.changeSelected(value);
                    },
                    activeColor: kAccentColor,
                    activeTrackColor: kPrimaryColorLight,
                    inactiveTrackColor: kPrimaryColorLight,
                  ),
                  contentPadding: EdgeInsets.zero,
                ),
                const SizedBox(
                  height: 32,
                ),
                const Divider(),
                const Spacer(),
                const ListTile(
                  leading: Text(
                    'Show favorites',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios_outlined),
                  contentPadding: EdgeInsets.zero,
                ),
                const ListTile(
                  leading: Text(
                    'Clear history',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios_outlined),
                  contentPadding: EdgeInsets.zero,
                ),
                // Row(
                //   children: [
                //     TextButton.icon(
                //       onPressed: () {},
                //       style: TextButton.styleFrom(
                //         padding: EdgeInsets.zero,
                //         foregroundColor: kAccentColor,
                //       ),
                //       icon: const Icon(Icons.favorite_outline),
                //       label: const Text(
                //         'Show Favorites',
                //       ),
                //     ),
                //   ],
                // ),
                // Row(
                //   children: [
                //     TextButton(
                //       onPressed: () {},
                //       style: TextButton.styleFrom(
                //         padding: EdgeInsets.zero,
                //         foregroundColor: kAccentColor,
                //       ),
                //       child: const Text(
                //         'Clear History',
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
