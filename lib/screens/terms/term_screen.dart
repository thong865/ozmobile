import 'package:flutter/material.dart';
import 'package:ozmobile/screens/register/register_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TermScreen extends StatelessWidget {
  const TermScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..loadRequest(Uri.parse('https://flutter.dev'));
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.clear_all))
            ],
            pinned: true,
            expandedHeight: 100.0,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Notification'),
              stretchModes: <StretchMode>[
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
                StretchMode.fadeTitle,
              ],
            ),
          ),
          SliverToBoxAdapter(
            // child: WebViewWidget(controller: _webViewController),
            child: SingleChildScrollView(
              child: Expanded(
                  child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(11.0),
                    child: WebViewWidget(controller: _webViewController),
                  ),
                ),
              )),
            ),
          )
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const RegisterScreen(),
                ),
              );
            },
            minWidth: MediaQuery.of(context).size.width - 200,
            height: 50,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            color: Colors.red,
            child: const Text('Accept'),
          ),
        ],
      ),
    );
  }
}
