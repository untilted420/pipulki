import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:matule/layers/presentation/shared/store/root_store.dart';
import 'package:matule/layers/data/local/shared_preferences/preferences_model.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  bool changedName = true;
  bool changedLastName = true;
  bool changedAddress = true;
  bool changedNumber = true;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final RootStore _rootstore = RootStore();

  void changetNameTrue() {
    setState(() {
      widget.changedName = true;
    });
  }

  void changetNameFalse() {
    setState(() {
      widget.changedName = false;
    });
  }

  void changetLastNameTrue() {
    setState(() {
      widget.changedLastName = true;
    });
  }

  void changetLastNameFalse() {
    setState(() {
      widget.changedLastName = false;
    });
  }

  void changetAddressTrue() {
    setState(() {
      widget.changedAddress = true;
    });
  }

  void changetAddressFalse() {
    setState(() {
      widget.changedAddress = false;
    });
  }

  void changetNumTrue() {
    setState(() {
      widget.changedNumber = true;
    });
  }

  void changetNumFalse() {
    setState(() {
      widget.changedNumber = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Align(
          child: Text(
            'Профиль',
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                child: Column(
                  children: [
                    SizedBox(height: 48),
                    Image.asset('assets/photo/profile_image.png'),
                    Observer(
                      builder:
                          (_) => Text(
                            'Emmanuel Oyiboke',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                    ),
                    Text(
                      context.tr('change_profile_img'),
                      style: TextStyle(
                        color: Color.fromRGBO(72, 178, 231, 1),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 11),
                    GestureDetector(
                      onTap: () {
                        print('code');
                      },
                      child: Container(
                        height: 66,
                        width: 335,
                        child: Row(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: RotatedBox(
                                quarterTurns: 3,
                                child: Text(
                                  context.tr('open'),
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            Image.asset('assets/photo/code_profile.png'),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        context.tr('name'),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 17),
                    Observer(
                      builder:
                          (_) => TextField(
                            textAlign: TextAlign.center,
                            onSubmitted: (value) {
                              // _rootstore.profileDetails.changeName(value);
                              changetNameTrue();
                            },
                            onTap: () {
                              changetNameFalse();
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              // labelText: _rootstore.profileDetails.name,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              suffixIcon:
                                  widget.changedName
                                      ? Icon(CupertinoIcons.check_mark)
                                      : Icon(CupertinoIcons.clear),
                            ),
                          ),
                    ),
                    SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        context.tr('last_name'),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 17),
                    Observer(
                      builder:
                          (_) => TextField(
                            textAlign: TextAlign.center,
                            onSubmitted: (value) {
                              // _rootstore.profileDetails.changelastname(value);
                              changetLastNameTrue();
                            },
                            onTap: () {
                              changetLastNameFalse();
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              // labelText: _rootstore.profileDetails.lastname,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              suffixIcon:
                                  widget.changedLastName
                                      ? Icon(CupertinoIcons.check_mark)
                                      : Icon(CupertinoIcons.clear),
                            ),
                          ),
                    ),
                    SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        context.tr('address'),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 17),
                    Observer(
                      builder:
                          (_) => TextField(
                            textAlign: TextAlign.center,
                            onSubmitted: (value) {
                              // _rootstore.profileDetails.changeaddress(value);
                              changetAddressTrue();
                            },
                            onTap: () {
                              changetAddressFalse();
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              // labelText: _rootstore.profileDetails.address,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              suffixIcon:
                                  widget.changedAddress
                                      ? Icon(CupertinoIcons.check_mark)
                                      : Icon(CupertinoIcons.clear),
                            ),
                          ),
                    ),
                    SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Телефон',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 17),
                    Observer(
                      builder:
                          (_) => TextField(
                            textAlign: TextAlign.center,
                            onSubmitted: (value) {
                              // _rootstore.profileDetails.changenumber(value);
                              changetNumTrue();
                            },
                            onTap: () {
                              changetNumFalse();
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              // labelText: _rootstore.profileDetails.number,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              suffixIcon:
                                  widget.changedNumber
                                      ? Icon(CupertinoIcons.check_mark)
                                      : Icon(CupertinoIcons.clear),
                            ),
                          ),
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
