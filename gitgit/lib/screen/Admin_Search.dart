import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ronfic_ver2/controller/Club_Info_Admin.dart';
import 'package:ronfic_ver2/controller/loginchk_info.dart';
import 'package:ronfic_ver2/model/Club_mebers.dart';
import 'package:ronfic_ver2/model/Clubs_Info.dart';
import 'package:ronfic_ver2/screen/Admin_SearchPage.dart';
import 'package:ronfic_ver2/screen/signedin_page.dart';
import 'package:transparent_image/transparent_image.dart';


// ClubInfo ci;
ExistingMebers em;
class AdminSearch extends StatelessWidget {
  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // ci = Provider.of<ClubInfo>(context);
    // em.clubUserList();
    em = Provider.of<ExistingMebers>(context);
    // var  = ci.getClub();



    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color(0xffffffff),
      //   elevation: 0,
      //   title: Text(
      //     em.user.clubName,
      //     style: TextStyle(fontSize: 24, color: Colors.lightBlueAccent),
      //   ),
      // ),
      body:NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: Text(
                innerBoxIsScrolled ?  em.user.clubName : "search",style: TextStyle(fontSize: 24, color: Colors.lightBlueAccent ),
              ),
              backgroundColor: Colors.white,
              pinned: true,
              floating: true,

            ),
          ];
        },
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  right: 15.0, left: 12.0),
              child: Container(
                height: 50,
                // width: 40,
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search),
                      hintText: '검색..',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        borderSide: BorderSide(color: Colors.blue, width: 1.0),
                      )),
                  onChanged: em.onSearchChange,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: em.clubInfo == null
                  ? Center(child: CircularProgressIndicator())
                  : em.TextData.length != 0 || _controller.text.isNotEmpty
                  ? em.TextData.length == 0 ? Center(child: Text('일치하는 회원이 없습니다.',style: TextStyle(fontSize: 24,color: Colors.grey),)) : ListView.builder(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                itemCount: em.TextData.isEmpty ? 0:em.TextData.length,
                itemBuilder: (BuildContext context, i) {
                  final member = em.TextData[i];
                  return ListViewWidget(member,context,i);
                },
              )
                  : ListView.builder(
                  physics:const  BouncingScrollPhysics(),
                  itemCount: em.clubInfo.length,
                  itemBuilder: (BuildContext context, i) {
                    final member = em.clubInfo[i];
                    return ListViewWidget(member,context,i);
                  }),
            ),
          ],
        ),
      ),
    );
  }

  ListViewWidget(ClubInfoUser member,context,index) {
    return
      GestureDetector(
        behavior: HitTestBehavior.opaque,
        onPanDown: (_) {
      FocusScope.of(context).requestFocus(FocusNode());
    },
      child:
      Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AdminSearchPage(member: em.clubInfo[index])),
              );



            },
            child: Container(
              height: 60,
              // color: Colors.green,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        member.profileUrl.isEmpty
                            ? Padding(
                                padding: const EdgeInsets.only(
                                    right: 15.0, left: 12.0),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50.0),
                                    child: Image.asset('images/profile.png')),
                              )
                            :
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: ClipOval( child: FadeInImage( placeholder: MemoryImage(kTransparentImage),image: NetworkImage(member.profileUrl,),fit: BoxFit.fill,)),
                            // ),
                            Padding(
                                padding: const EdgeInsets.only(
                                    right: 15.0, left: 12.0),
                                child: Container(
                                    width: 60.0,
                                    height: 60.0,
                                    decoration: new BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: new DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(member.profileUrl),
                                        ))),
                              ),
                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            member.gender == 'Male'
                                ? Image.asset('images/male.png',
                                    height: 12, width: 12, color: Colors.blue)
                                : Image.asset(
                                    'images/Female.png',
                                    height: 12,
                                    width: 12,
                                    color: Colors.pink[200],
                                  ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                member.userName,
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff3c4043)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey[300],
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            height: 30,
          ),
        ],
      ),
    );
  }
}
