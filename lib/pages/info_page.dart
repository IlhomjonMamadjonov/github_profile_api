import 'package:architecture_github/view_models/info_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  InfoViewModel viewModel = InfoViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.apiLoadUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.share_outlined,
                color: Colors.blue.shade700,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings_outlined,
                color: Colors.blue.shade700,
              )),
        ],
      ),
      body: ChangeNotifierProvider(
          create: (context) => viewModel,
          child: Consumer(
            builder: (ctx, model, index) => viewModel.isLoading
                ? Center(
                    child: CircularProgressIndicator.adaptive(),
                  )
                : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Column(
                      children: [
                        //User_info
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Row(
                            children: [
                              //imj_profile
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(80),
                                  child: Image.network(
                                    viewModel.user.avatarUrl!,
                                    height: 65,
                                    width: 65,
                                    fit: BoxFit.cover,
                                  )),
                              const SizedBox(width: 20),
                              Column(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    viewModel.user.name!,
                                    style: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    viewModel.user.login!,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey.shade600),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),

                        // bio
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          child: Text(
                            "${viewModel.user.bio}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),

                        //location
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          child: Row(
                            children: [
                              Icon(
                                CupertinoIcons.location,
                                size: 23,
                                color: Colors.grey.shade600,
                              ),
                              Text(
                                " ${viewModel.user.location}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                        ),

                        //link to Social
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          child: Row(
                            children: [
                              Icon(
                                CupertinoIcons.link,
                                size: 23,
                                color: Colors.grey.shade600,
                              ),
                              Text(
                                " ${viewModel.user.blog}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                        //follow
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          child: Row(
                            children: [
                              Icon(
                                CupertinoIcons.person,
                                size: 23,
                                color: Colors.grey.shade600,
                              ),
                              Text(
                                " " + viewModel.user.followers.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              const Text(" followers",
                                  style: TextStyle(fontSize: 18)),
                              Text(
                                " · " +
                                    viewModel.user.following.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              const Text(" following",
                                  style: TextStyle(fontSize: 18)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
