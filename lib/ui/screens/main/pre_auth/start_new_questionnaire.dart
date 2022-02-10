import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:loono/constants.dart';
import 'package:loono/helpers/ui_helpers.dart';
import 'package:loono/l10n/ext.dart';
import 'package:loono/router/app_router.gr.dart';
import 'package:loono/ui/widgets/button.dart';
import 'package:loono/ui/widgets/skip_button.dart';

class StartNewQuestionnaireScreen extends StatelessWidget {
  const StartNewQuestionnaireScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 18, left: 18, right: 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SkipButton(
                text: context.l10n.already_have_an_account_skip_button,
                onPressed: () {
                  if (AutoRouter.of(context).isRouteActive(PreAuthMainRoute().routeName)) {
                    AutoRouter.of(context).popUntilRoot();
                  }
                  AutoRouter.of(context)
                      .push(PreAuthMainRoute(overridenPreventionRoute: LoginRoute()));
                },
              ),
              const SizedBox(height: 24),
              const Text(
                'Vítej do společnosti  (ne)obyčejných hrdinů!\n\nTODO: screen UI',
                textAlign: TextAlign.center,
                style: LoonoFonts.bigFontStyle,
              ),
              const Spacer(),
              LoonoButton(
                text: context.l10n.start_new_questionnaire_button,
                onTap: () => AutoRouter.of(context).push(const OnboardingWrapperRoute()),
              ),
              SizedBox(height: LoonoSizes.buttonBottomPadding(context)),
            ],
          ),
        ),
      ),
    );
  }
}
