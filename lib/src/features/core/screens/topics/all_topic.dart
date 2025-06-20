import 'package:first_aid_app/src/constants/colors.dart';
import 'package:first_aid_app/src/constants/image_strings.dart';
import 'package:first_aid_app/src/constants/text_strings.dart';
import 'package:first_aid_app/src/features/core/screens/topics/allergic_reactions.dart';
import 'package:first_aid_app/src/features/core/screens/topics/assessing_injured_person.dart';
import 'package:first_aid_app/src/features/core/screens/topics/asthma.dart';
import 'package:first_aid_app/src/features/core/screens/topics/bites.dart';
import 'package:first_aid_app/src/features/core/screens/topics/bleeding.dart';
import 'package:first_aid_app/src/features/core/screens/topics/burns.dart';
import 'package:first_aid_app/src/features/core/screens/topics/choking.dart';
import 'package:first_aid_app/src/features/core/screens/topics/cpr.dart';
import 'package:first_aid_app/src/features/core/screens/topics/diabetics.dart';
import 'package:first_aid_app/src/features/core/screens/topics/drug_overdose.dart';
import 'package:first_aid_app/src/features/core/screens/topics/eye_injury.dart';
import 'package:first_aid_app/src/features/core/screens/topics/fractures.dart';
import 'package:first_aid_app/src/features/core/screens/topics/head_injury.dart';
import 'package:first_aid_app/src/features/core/screens/topics/heart_condition.dart';
import 'package:first_aid_app/src/features/core/screens/topics/poisons.dart';
import 'package:first_aid_app/src/features/core/screens/topics/recovery_pos.dart';
import 'package:first_aid_app/src/features/core/screens/topics/seizures.dart';
import 'package:first_aid_app/src/features/core/screens/topics/shock.dart';
import 'package:first_aid_app/src/features/core/screens/topics/spinal_injury.dart';
import 'package:first_aid_app/src/features/core/screens/topics/sprainsstrains.dart';
import 'package:first_aid_app/src/features/core/screens/topics/stroke.dart';
import 'package:first_aid_app/src/features/core/screens/topics/wound_care.dart';
import 'package:flutter/material.dart';

class AllTopicsScreen extends StatelessWidget {
  const AllTopicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          color: Color.fromARGB(255, 139, 47, 49),
        ),
        title: IconButton(
          onPressed: () {},
          icon: Image(image: AssetImage(tLogo), height: height * 0.05),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20, top: 7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: tCardBgColor,
            ),
          ),
          // PopupMenuButton<String>(
          //   icon: const Icon(
          //     Icons.more_vert,
          //     color: Color.fromARGB(255, 139, 47, 49),
          //   ),
          //   onSelected: (value) {},
          //   itemBuilder:
          //       (context) => [
          //         const PopupMenuItem(
          //           value: 'settings',
          //           child: Text('Settings'),
          //         ),
          //         const PopupMenuItem(value: 'help', child: Text('Help')),
          //         const PopupMenuItem(value: 'logout', child: Text('Logout')),
          //       ],
          // ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 20.0),
              _buildFirstButtonRow(context),
              const SizedBox(height: 15.0),
              _buildSecondButtonRow(context),
              const SizedBox(height: 30.0),
              _buildScrollableTopicsGrid(context),
            ],
          ),
        ),
      ),
    );
  }

  // Existing button row methods...
  Widget _buildFirstButtonRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildButton(context, tCprimg, tCpr, CprScreen()),
        const SizedBox(width: 15.0),
        _buildButton(context, tWoundimg, tBleeding, const Bleeding()),
        const SizedBox(width: 15.0),
        _buildButton(context, tBurnimg, 'Burns', const BurnScreen()),
      ],
    );
  }

  Widget _buildSecondButtonRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildButton(context, tChokingimg, tChoking, const ChokingScreen()),
        const SizedBox(width: 15.0),
        _buildButton(context, tPoisonimg, tPoisons, const PoisonScreen()),
        const SizedBox(width: 15.0),
        _buildButton(context, tBitinigimg, tBites, const Bites()),
      ],
    );
  }

  Widget _buildButton(
    BuildContext context,
    String image,
    String text,
    Widget screen,
  ) {
    return SizedBox(
      width: 100,
      height: 100,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          foregroundColor: tWhiteColor,
          backgroundColor: tPrimaryColor,
          side: BorderSide(color: tSecondaryColor),
          padding: const EdgeInsets.all(8.0),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage(image), width: 40.0),
            const SizedBox(height: 8.0),
            Text(
              text,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                fontFamily: "Poppins",
              ),
            ),
          ],
        ),
      ),
    );
  }

  // New vertically scrollable grid of white buttons
  Widget _buildScrollableTopicsGrid(BuildContext context) {
    final List<Map<String, dynamic>> topics = [
      {'image': tInjuryimg, 'title': tFractures, 'screen': const FracturesScreen()},
      {
        'image': tAllergicReactionimg,
        'title': tAllergicReaction,
        'screen': const AllergicReactions(),
      },
      {'image': tAsthmaimg, 'title': tAsthma, 'screen': const Asthma()},
      {
        'image': tDiabeticsimg,
        'title': tDiabetics,
        'screen': const DiabeticsScreen(),
      },
      {
        'image': tDrugOverDoseimg,
        'title': tDrugOverdose,
        'screen': const DrugOverdoseScreen(),
      },
      {'image': tSoreEyesimg, 'title': tEyeInjury, 'screen': const EyeInjuryScreen()},
      {'image': tHeadimg, 'title': tHeadInjury, 'screen': const HeadInjury()},
      {
        'image': tHeartAttackimg,
        'title': tHeartCondition,
        'screen': const HeartCondition(),
      },
      {'image': tSeizureimg, 'title': tSeizure, 'screen': const Seizures()},
      {'image': tEpilepsyimg, 'title': tShock, 'screen': const Shock()},
      {
        'image': tSpinalInjuryimg,
        'title': tSpinalInjury,
        'screen': const SpinalInjury(),
      },
      {
        'image': tSprainimg,
        'title': tSprainsStrains,
        'screen': const SprainsStrains(),
      },
      {'image': tStrotkeimg, 'title': tStroke, 'screen': const StrokeScreen()},
      {'image': tBandAidimg, 'title': tWoundCare, 'screen': const WoundCare()},
      {
        'image': tHelpingPersonimg,
        'title': tAssessing,
        'screen': const AssessingInjuredPerson(),
      },
      {
        'image': tRecoveryPosimg,
        'title': tRecoveryPos,
        'screen': const RecoveryPos(),
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'More First Aid Topics',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 10),
        // Remove fixed height constraint and let it expand naturally
        GridView.builder(
          shrinkWrap: true, // Important for scrolling inside Column
          physics:
              const NeverScrollableScrollPhysics(), // Let parent SingleChildScrollView handle scrolling
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3, // Wider and shorter buttons
            mainAxisExtent: 80, // Fixed height for each item
          ),
          itemCount: topics.length,
          itemBuilder: (context, index) {
            return _buildCompactButton(
              context,
              topics[index]['image'],
              topics[index]['title'],
              topics[index]['screen'],
            );
          },
        ),
      ],
    );
  }

  Widget _buildCompactButton(
    BuildContext context,
    String image,
    String text,
    Widget screen,
  ) {
    return OutlinedButton(
      onPressed: () {
        // Required parameter
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        side: BorderSide(color: Colors.grey.shade300),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      ),
      child: Row(
        // Required parameter
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(image: AssetImage(image), width: 30, height: 30),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                fontFamily: "Poppins",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
