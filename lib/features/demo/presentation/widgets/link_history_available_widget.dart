import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grisoft/features/demo/presentation/providers/link_short_provider.dart';
import 'package:provider/provider.dart';

class LinkHistoryAvailableWidget extends StatelessWidget {
  const LinkHistoryAvailableWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var linkShorterProvider = Provider.of<LinkShorterProvider>(
      context,
    );

    return SizedBox(
      height: MediaQuery.of(context).size.height - 120,
      child: Stack(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Expanded(
                flex: 5,
                child: Text(
                  'Your link history',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                flex: 150,
                child: Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: SizedBox(
                    // height: MediaQuery.of(context).size.height - 50,
                    child: Container(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: linkShorterProvider.linkHistory.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 6.0, horizontal: 24),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: Colors.white,
                                ),
                                height: 170,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 18),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 7,
                                            child: SizedBox(
                                              width: 250,
                                              child: Text(
                                                linkShorterProvider
                                                        .linkHistory[index]
                                                        .result!
                                                        .originalLink ??
                                                    '',
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: IconButton(
                                              onPressed: () {
                                                linkShorterProvider.deleteLink(
                                                    linkShorterProvider
                                                            .linkHistory[index]
                                                            .result!
                                                            .code ??
                                                        '');
                                              },
                                              icon: const Icon(
                                                Icons.delete,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Divider(
                                      thickness: 1.2,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 18.0),
                                      child: Text(
                                        linkShorterProvider.linkHistory[index]
                                                .result!.shortLink ??
                                            '',
                                        style: const TextStyle(
                                            color: Color(0xff1CBED0),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        await Clipboard.setData(
                                          ClipboardData(
                                              text: linkShorterProvider
                                                  .linkHistory[index]
                                                  .result!
                                                  .shortLink),
                                        );
                                        linkShorterProvider.copiedLink =
                                            linkShorterProvider
                                                .linkHistory[index]
                                                .result!
                                                .code;
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 48.0),
                                        child: Container(
                                          height: 45,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            color: linkShorterProvider
                                                        .copiedLink ==
                                                    linkShorterProvider
                                                        .linkHistory[index]
                                                        .result!
                                                        .code
                                                ? const Color(0xff382C53)
                                                : const Color(0xff1CBED0),
                                          ),
                                          width: double.infinity,
                                          child: Center(
                                            child: Text(
                                              linkShorterProvider.copiedLink ==
                                                      linkShorterProvider
                                                          .linkHistory[index]
                                                          .result!
                                                          .code
                                                  ? 'COPIED!'
                                                  : 'COPY',
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ),
              ),
            ],
          ),
          linkShorterProvider.isWaiting
              ? Positioned(
                  top: (MediaQuery.of(context).size.height) / 2,
                  left: MediaQuery.of(context).size.width / 2,
                  child: CircularProgressIndicator(),
                )
              : Positioned(
                  child: Container(),
                ),
        ],
      ),
    );
  }
}
