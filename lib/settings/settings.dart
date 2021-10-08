import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recommendinator/menu/bloc/menu_bloc.dart';
import 'package:recommendinator/models/customer_preferences.dart';
import 'package:recommendinator/settings/bloc/settings_bloc.dart';

enum SettingsEnum { addItem, reset }

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return _settingsContent(context, state);
        },
      ),
    );
  }

  Widget _settingsContent(BuildContext context, SettingsState state) {
    return ListView.builder(
        itemCount: SettingsEnum.values.length,
        itemBuilder: (context, index) {
          var setting = SettingsEnum.values[index];
          return Card(
              child: ListTile(
                  onTap: () => _performActionForSetting(context, setting),
                  title: Text(_titleForSetting(setting)),
                  subtitle: Text(_subtitleForSetting(setting))));
        });
  }

  void _performActionForSetting(BuildContext context, SettingsEnum setting) {
    //TODO: Actually make them do stuff
    switch (setting) {
      case SettingsEnum.addItem:
        break;
      case SettingsEnum.reset:
        _showResetConfirmationDialog(context);
        break;
    }
  }

  String _titleForSetting(SettingsEnum setting) {
    switch (setting) {
      case SettingsEnum.addItem:
        return "Add Menu Item";
      case SettingsEnum.reset:
        return "Reset App";
    }
  }

  String _subtitleForSetting(SettingsEnum setting) {
    switch (setting) {
      case SettingsEnum.addItem:
        return "Add a new menu item to the food database";
      case SettingsEnum.reset:
        return "Resets all menu items and food recommendations";
    }
  }

  void _showResetConfirmationDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text('Reset'),
              content: const Text("Are you sure you want to reset?"),
              actions: [
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Reset'),
                  onPressed: () {
                    CustomerPreferences.resetCustomerPreferences();
                    context.read<MenuBloc>().add(LoadMenu());
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
  }
}
