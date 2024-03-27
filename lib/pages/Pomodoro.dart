import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/components/Cronometro.dart';
import 'package:pomodoro/components/EntradaTempo.dart';
import 'package:pomodoro/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
          child: Cronometro(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Observer(
            builder: (context) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                EntradaTempo(
                  valor: store.tempoTrabalho,
                  titulo: "Trabalho",
                  incrementar: store.iniciado && store.estaTrabalhando()
                      ? null
                      : store.incrementarTempoTrabalho,
                  decrementar: store.iniciado && store.estaTrabalhando()
                      ? null
                      : store.decrementarTempoTrabalho,
                ),
                EntradaTempo(
                  valor: store.tempoDescanso,
                  titulo: "Descanso",
                  incrementar: store.iniciado && store.estaTrabalhando()
                      ? store.incrementarTempoDescanso : null,
                  decrementar: store.iniciado && store.estaTrabalhando()
                      ? store.decrementarTempoDescanso : null,
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
