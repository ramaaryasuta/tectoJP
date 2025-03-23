import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tectojp/core/helper/ui_helper.dart';

import '../../../../core/components/snackbar.dart';
import '../../../../core/helper/subtitle_helper.dart';
import '../../../../core/utils/fonts.dart';
import '../../domain/entities/quiz.dart';
import '../cubit/quiz_cubit.dart';
import '../widgets/result_dialog.dart';
import '../widgets/warning_dialog.dart';

@RoutePage()
class QuizPage extends StatefulWidget {
  final KanaType kanaType;
  final QuizType quizType;
  const QuizPage({super.key, required this.kanaType, required this.quizType});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late QuizCubit cubit;
  final _pageController = PageController();
  final _answerController = TextEditingController();
  final FocusNode _answerFocusNode = FocusNode();

  int _currentQuizIndex = 0;
  int _totalQuiz = 0;
  int _correctAnswer = 0;

  // hold wrong question
  bool _startWrongAnswerState = false;
  final List<Quiz> _repeatQuiz = [];

  //counting time
  int _minutes = 0;
  int _seconds = 0;
  Timer? _timer;

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
        if (_seconds == 60) {
          _seconds = 0;
          _minutes++;
        }
      });
    });
  }

  void stopTimer() {
    _timer?.cancel();
  }

  @override
  void initState() {
    super.initState();
    cubit = context.read<QuizCubit>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      cubit.kanaShuffleRandomQuiz(
          quizType: widget.quizType, kanaType: widget.kanaType);
      startTimer();
    });
  }

  // @override
  // void dispose() {
  //   _pageController.dispose();
  //   _answerController.dispose();
  //   _answerFocusNode.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                    title: Text(S.of(context)!.exitQuiz),
                    content: Text(S.of(context)!.areYouSure),
                    actions: [
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(S.of(context)!.no),
                            ),
                          ),
                          Expanded(
                            child: TextButton(
                              onPressed: () {
                                context.router.back();
                              },
                              child: Text(S.of(context)!.yes),
                            ),
                          ),
                        ],
                      ),
                    ]),
              );
            }),
        title: Text(
            '${S.of(context)!.quiz} ${_startWrongAnswerState ? "Review" : ""}'),
        actions: [
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Text(
              "${_minutes.toString().padLeft(2, '0')}:${_seconds.toString().padLeft(2, '0')}",
            ),
          ),
        ],
      ),
      body: BlocBuilder<QuizCubit, QuizState>(
        builder: (context, state) {
          if (state is QuizLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is QuizLoaded) {
            _totalQuiz = state.quizes.length;
            var quizData = state.quizes;

            if (_startWrongAnswerState) {
              quizData = _repeatQuiz;
              _totalQuiz = _repeatQuiz.length;
            }

            return Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  spacing: 20,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .3,
                      child: PageView.builder(
                          controller: _pageController,
                          itemCount: quizData.length,
                          itemBuilder: (context, index) {
                            _currentQuizIndex = index;
                            return Stack(
                              children: [
                                Card(
                                  child: Center(
                                    child: Text(
                                      quizData[index].title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineLarge!
                                          .copyWith(
                                              fontFamily: MyFonts.notoSansJp,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .4),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    constraints: BoxConstraints(
                                      maxHeight: getDeviceHeight(context) * .1,
                                      maxWidth: getDeviceWidth(context) * .3,
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      '${index + 1} / ${quizData.length}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                              fontFamily: MyFonts.notoSansJp),
                                    ),
                                  ),
                                )
                              ],
                            );
                          }),
                    ),
                    TextField(
                      controller: _answerController,
                      focusNode: _answerFocusNode,
                      decoration: InputDecoration(
                        hintText: S.of(context)!.typeHere,
                        label: Text(S.of(context)!.answer),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onSubmitted: (v) {
                        ScaffoldMessenger.of(context).removeCurrentSnackBar();

                        if (v.toLowerCase() ==
                            quizData[_currentQuizIndex].romanji.toLowerCase()) {
                          // Jawaban benar
                          if (!_startWrongAnswerState) {
                            _correctAnswer++;
                          } else {
                            _repeatQuiz.remove(quizData[_currentQuizIndex]);
                          }

                          showSnackbar(
                              milliseconds: 300,
                              message: S.of(context)!.yourAnswerCorrect);
                        } else {
                          if (!_startWrongAnswerState) {
                            _repeatQuiz.add(quizData[_currentQuizIndex]);
                          }
                          showSnackbar(
                              milliseconds: 300,
                              message: S.of(context)!.yourAnswerWrong,
                              type: SnackbarType.error);
                        }

                        _answerController.clear();
                        FocusScope.of(context).requestFocus(_answerFocusNode);
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );

                        if (_pageController.page == _totalQuiz - 1 &&
                            _repeatQuiz.isNotEmpty) {
                          // warning dialog wrong answer
                          showWarning(_repeatQuiz.length.toString());
                          _startWrongAnswerState = true;
                          _pageController.jumpToPage(0);
                        } else if (_pageController.page == _totalQuiz - 1 &&
                            _startWrongAnswerState &&
                            _repeatQuiz.isEmpty) {
                          _startWrongAnswerState = false;
                        }

                        if (!_startWrongAnswerState &&
                            _repeatQuiz.isEmpty &&
                            _pageController.page?.round() == _totalQuiz - 1) {
                          stopTimer();

                          showResultQuiz(
                            score:
                                '$_correctAnswer/${state.quizes.length} (${S.of(context)!.accuracy} ${((_correctAnswer / state.quizes.length) * 100).toStringAsFixed(2)}%)',
                            finishTime:
                                '${_minutes < 10 ? "0$_minutes" : "$_minutes"} : ${_seconds < 10 ? "0$_seconds" : "$_seconds"}',
                          );
                        }
                        setState(() {});
                      },
                    )
                  ],
                ),
              ),
            );
          } else {
            return const Center(child: Text('Error accoured'));
          }
        },
      ),
    );
  }
}
