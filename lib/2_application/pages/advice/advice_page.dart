import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:performx/2_application/core/constants/color/color_constants.dart';
import 'package:performx/2_application/core/localization/lcoale_provider.dart';
import 'package:performx/2_application/core/theme/text_theme_light.dart';
import 'package:performx/l10n/l10n.dart';
import 'package:provider/provider.dart';
import '../../../injection.dart';
import '../../core/services/theme_service.dart';
import 'cubit/advicer_cubit.dart';
import 'widgets/advice_field.dart';
import 'widgets/custom_button.dart';
import 'widgets/error_message.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AdvicerPageWrapperProvider extends StatelessWidget {
  const AdvicerPageWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AdvicerCubit>(),
      child: const AdvicerPage(),
    );
  }
}

class AdvicerPage extends StatefulWidget {
  const AdvicerPage({super.key});

  @override
  State<AdvicerPage> createState() => _AdvicerPageState();
}

class _AdvicerPageState extends State<AdvicerPage> {
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final t = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.helloWorld,
          style: TextThemeLight.instance!.signInInput,
        ),
        centerTitle: true,
        actions: [
          CupertinoSwitch(
              value: Provider.of<ThemeService>(context).isDarkModeOn,
              onChanged: (_) {
                Provider.of<ThemeService>(context, listen: false).toggleTheme();
              })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: BlocBuilder<AdvicerCubit, AdvicerCubitState>(
                  builder: (context, state) {
                    if (state is AdvicerInitial) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            t.helloWorld,
                            style: TextThemeLight.instance!.signInRemember,
                          ),
                          DropdownButton<String>(
                            isExpanded: true,
                            isDense: true,
                            icon: const Icon(
                              Icons.arrow_drop_down_outlined,
                            ),
                            hint: Text(
                              t.localeName,
                            ),
                            elevation: 16,
                            underline: const SizedBox(),
                            onChanged: (String? value) async {
                              // final locale = FactoryOfMyLocale.create(langMap[value]!);
                              // context.setLocale(locale);
                            },
                            items: L10n.support.map<DropdownMenuItem<String>>((locale) {
                              return DropdownMenuItem<String>(
                                value: locale.toString(),
                                child: Text(
                                  locale.toString(),
                                ),
                                onTap: () {
                                  final provider = Provider.of<LocaleProvider>(context, listen: false);
                                  provider.setLocale(locale);
                                },
                              );
                            }).toList(),
                          ),
                        ],
                      );
                    } else if (state is AdvicerStateLoading) {
                      return CircularProgressIndicator(
                        color: ColorConstants.instance.status_green,
                      );
                    } else if (state is AdvicerStateLoaded) {
                      return AdviceField(
                        advice: state.advice,
                      );
                    } else if (state is AdvicerStateError) {
                      return ErrorMessage(message: state.message);
                    }
                    return const SizedBox();
                  },
                ),
              ),
            ),
            SizedBox(
              height: 200,
              child: Center(
                child: CustomButton(
                  onTap: () => BlocProvider.of<AdvicerCubit>(context).adviceRequested,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
