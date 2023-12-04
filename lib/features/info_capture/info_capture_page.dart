import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:target_test/features/info_capture/info_capture_store.dart';
import 'package:target_test/features/info_capture/widgets/item_list_tile.dart';
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
    return Observer(
      builder: (context) {
        return Scaffold(
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    if (store.data.isEmpty)
                      Expanded(
                        child: Center(
                          child: Text(
                            "Digite algo no teclado para exibir na tela",
                            style: TextStyle(color: Colors.grey.shade700),
                          ),
                        ),
                      )
                    else
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: Material(
                            color: Colors.transparent,
                            child: ListView.separated(
                              itemCount: store.data.length,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(height: 4),
                              itemBuilder: (context, index) {
                                return ItemListTile(
                                  value: store.data[index],
                                  onConfirm: () {
                                    store.deleteByIndex(index).then(
                                      (success) {
                                        if (success) {
                                          context.showSnackBar(
                                              "Informação removida com sucesso");
                                        }
                                        Modular.to.pop();
                                      },
                                    );
                                  },
                                );
                              },
                            ),
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
                        store.add(value).then((success) {
                          if (success) {
                            context
                                .showSnackBar("Informação salva com sucesso!");
                          } else {
                            context.showSnackBar(
                                "Erro ao salvar informação", true);
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
              if (store.isLoading)
                Container(
                  color: Colors.black.withOpacity(0.5),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
