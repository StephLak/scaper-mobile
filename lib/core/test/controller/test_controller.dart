import 'dart:async';

import 'package:get/get.dart';
import 'package:scaper_mobile/core/test/models/test_models.dart';

class TestController extends GetxController {
  Rxn<DialogNode> currentNode = Rxn<DialogNode>();
  RxInt score = 0.obs;
  RxInt timeLeft = 0.obs;
  Rxn<Timer> timer = Rxn<Timer>();
  RxBool testEnded = false.obs;

  final Map<String, DialogNode> dialogTree = {
    "node0": DialogNode(
      id: "node0",
      text:
          "You're at a coffee shop and a stranger asks, 'Hey, can you recommend a good drink here?'",
      videoAsset: "npc_dialog.mp4",
      videoTimecode: 10,
      timeLimit: 5,
      options: [
        AnswerOption(
            text: "Sure! Try the caramel latte.",
            points: 5,
            nextNodeId: "node1"),
        AnswerOption(
            text: "I don't know, I just got here too.",
            points: 10,
            nextNodeId: "node2"),
      ],
    ),
    "node1": DialogNode(
      id: "node1",
      text:
          "The stranger smiles and says, 'That sounds great! What's your favorite dessert?'",
      videoAsset: "npc_dialog.mp4",
      videoTimecode: 20,
      timeLimit: 5,
      options: [
        AnswerOption(
            text: "I love chocolate cake!", points: 5, nextNodeId: "node3"),
        AnswerOption(
            text: "I'm more into savory food.",
            points: 10,
            nextNodeId: "node4"),
      ],
    ),
    "node2": DialogNode(
      id: "node2",
      text:
          "The stranger nods and looks around for recommendations from someone else.",
      videoAsset: "npc_dialog.mp4",
      videoTimecode: 30,
      timeLimit: 5,
      options: [
        AnswerOption(text: "Yes, it's great!", points: 10, nextNodeId: "node6"),
        AnswerOption(
            text: "No, but I’ve heard good things.",
            points: 5,
            nextNodeId: "node5"),
      ],
    ),
    "node3": DialogNode(
      id: "node3",
      text:
          "The stranger laughs and says, 'Chocolate cake is the best! Any favorite bakeries?'",
      videoAsset: "npc_dialog.mp4",
      videoTimecode: 40,
      timeLimit: 5,
      options: [
        AnswerOption(
            text: "Yes! There’s a great place downtown.",
            points: 5,
            nextNodeId: "node5"),
        AnswerOption(
            text: "I usually just bake my own.",
            points: 10,
            nextNodeId: "node6"),
      ],
    ),
    "node4": DialogNode(
      id: "node4",
      text: "The stranger says, 'Interesting! What's your go-to savory dish?'",
      videoAsset: "npc_dialog.mp4",
      videoTimecode: 50,
      timeLimit: 5,
      options: [
        AnswerOption(text: "I love pasta!", points: 10, nextNodeId: "node7"),
        AnswerOption(
            text: "Burgers all the way.", points: 5, nextNodeId: "node8"),
      ],
    ),
    "node7": DialogNode(
      id: "node7",
      text:
          "You're at a bookstore, and someone asks, 'Do you have any book recommendations?'",
      videoAsset: "npc_dialog.mp4",
      videoTimecode: 190,
      timeLimit: 5,
      options: [
        AnswerOption(
            text: "Yes! I love mystery novels.",
            points: 10,
            nextNodeId: "node10"),
        AnswerOption(
            text: "I don’t read much, sorry!", points: 5, nextNodeId: "node9"),
      ],
    ),
    "node8": DialogNode(
      id: "node8",
      text:
          "The person smiles and says, 'Which mystery novel would you recommend first?'",
      videoAsset: "npc_dialog.mp4",
      videoTimecode: 200,
      timeLimit: 5,
      options: [
        AnswerOption(
            text: "Sherlock Holmes is a classic!",
            points: 10,
            nextNodeId: "node11"),
        AnswerOption(
            text: "I prefer modern thrillers.",
            points: 5,
            nextNodeId: "node12"),
      ],
    ),
    "node9": DialogNode(
      id: "node9",
      text:
          "The person gets excited and says, 'I love Sherlock Holmes too! Which story is your favorite?'",
      videoAsset: "npc_dialog.mp4",
      videoTimecode: 220,
      timeLimit: 5,
      options: [
        AnswerOption(
            text: "The Hound of the Baskervilles!",
            points: 10,
            nextNodeId: "node13"),
        AnswerOption(
            text: "A Study in Scarlet!", points: 5, nextNodeId: "node14"),
      ],
    ),
    "node10": DialogNode(
      id: "node10",
      text: "The person asks, 'Any good modern thriller recommendations?'",
      videoAsset: "npc_dialog.mp4",
      videoTimecode: 230,
      timeLimit: 5,
      options: [
        AnswerOption(
            text: "Gone Girl is a great read!",
            points: 10,
            nextNodeId: "node16"),
        AnswerOption(
            text: "The Girl with the Dragon Tattoo!",
            points: 5,
            nextNodeId: "node15"),
      ],
    ),
    // More questions continuing the conversation dynamically...
  };

  void startTimer() {
    timeLeft.value = currentNode.value!.timeLimit;
    timer.value?.cancel();
    timer.value = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeLeft.value > 0) {
        timeLeft.value--;
      } else {
        timer.cancel();
        moveToNextDialog();
      }
    });
  }

  void moveToNextDialog() {
    if (currentNode.value!.options.isNotEmpty) {
      selectOption(currentNode.value!.options.first, selected: false);
    }
  }

  void selectOption(AnswerOption option, {bool selected = true}) {
    if (selected) {
      score.value += option.points;
    }
    if (dialogTree[option.nextNodeId] != null) {
      currentNode.value = dialogTree[option.nextNodeId]!;
      startTimer();
    } else {
      testEnded.value = true;
    }
  }

  @override
  void onInit() {
    super.onInit();
    currentNode.value = dialogTree["node0"]!;
    startTimer();
  }
}
