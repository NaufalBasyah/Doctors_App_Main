import "package:flutter/material.dart";


class EditProfile extends StatefulWidget {


  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController displayNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  bool isLoading = false;
  List<String> profileInfo = ["Barbara", "Lang","Email.email@email.com"," Some kind of address"];
  DateTime dob= DateTime.utc(1997, 5, 10);
  String fullName;

  @override
  void initState() {
    super.initState();
    fullName= profileInfo[0]+" "+profileInfo[1];
  }


  Column buildDisplayNameField({String text}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(top: 12.0),
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
              ),
            )),
        TextField(
          controller: displayNameController,
          decoration: InputDecoration(
            hintText: "Update Display Name",
          ),
        )
      ],
    );
  }

  Column buildDOBField({DateTime text}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(top: 12.0),
            child: Text(
              "${text.toLocal()}".split(' ')[0],
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            )),
        TextField(
          controller: dobController,
          decoration: InputDecoration(
            hintText: "Update DOB",
          ),
        )
      ],
    );
  }
  Column buildContactField({String text}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(top: 12.0),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            )),
        TextField(
          controller: contactController,
          decoration: InputDecoration(
            hintText: "Update Contact",
          ),
        )
      ],
    );
  }
  Column buildAddressField({String text}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(top: 12.0),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            )),
        TextField(
          controller: addressController,
          decoration: InputDecoration(
            hintText: "Update Address",
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Edit Profile",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.done,
              size: 30.0,
              color: Colors.green,
            ),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    top: 16.0,
                    bottom: 8.0,
                  ),
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundImage:NetworkImage('https://www.scripps.org/sparkle-assets/images/headshot-kim-hui-b5afaebeec2a6d7c4887266d94fb6c0e.jpg'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      buildDisplayNameField(
                          text: fullName
                      ),
                      buildDOBField(
                          text: dob,
                      ),
                      buildContactField(
                          text: profileInfo[2]
                      ),
                      buildAddressField(
                          text: profileInfo[3]
                      )
                    ],
                  ),
                ),
                RaisedButton(
                  onPressed: () => print('update profile data'),
                  child: Text(
                    "Update Profile",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.all(16.0),
                //   child: FlatButton.icon(
                //     onPressed: () => print('logout'),
                //     icon: Icon(Icons.cancel, color: Colors.red),
                //     label: Text(
                //       "Logout",
                //       style: TextStyle(color: Colors.red, fontSize: 20.0),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}