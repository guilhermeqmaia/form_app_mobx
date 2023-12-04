import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:target_test/features/info_capture/info_capture_store.dart';
import 'package:target_test/shared/extensions/build_context_extensions.dart';
import 'package:target_test/shared/widgets/input.dart';

class InfoCapturePage extends StatefulWidget {
  const InfoCapturePage({super.key});

  @override
  State<InfoCapturePage> createState() => _InfoCapturePageState();
}

class _InfoCapturePageState extends State<InfoCapturePage> {
  final store = Modular.get<InfoCaptureStore>();
  final focus = FocusNode();
  final controller = TextEditingController();

  @override
  void initState() {
    store.fetch();
    focus.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Observer(
                      builder: (_) {
                        return Material(
                          color: Colors.transparent,
                          child: ListView.separated(
                            itemCount: store.data.length,
                            separatorBuilder: (_, __) =>
                                const SizedBox(height: 4),
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(
                                  store.data[index],
                                  style: TextStyle(
                                    color: Colors.grey.shade700,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                shape: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                ),
                                trailing: IconButton(
                                  onPressed: () {
                                    //TODO: add delete action with dialog
                                  },
                                  icon: const Icon(Icons.delete),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Input(
                  hint: "Digite seu texto",
                  controller: controller,
                  focusNode: focus,
                  onFieldSubmitted: (value) {
                    controller.clear();
                    focus.requestFocus();
                    if (value.isEmpty) return;
                    store.add(value).then((result) {
                      if (result) {
                        context.showSnackBar("Informação salva com sucesso!");
                      } else {
                        context.showSnackBar("Erro ao salvar informação", true);
                      }
                      setState(() {});
                    });
                  },
                  onTapOutside: (_) {
                    focus.requestFocus();
                  },
                ),
              ],
            ),
          ),
          Observer(
            builder: (_) {
              if (store.isLoading) {
                return Container(
                  color: Colors.black.withOpacity(0.5),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          )
        ],
      ),
    );
  }
}
