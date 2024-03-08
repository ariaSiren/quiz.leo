// The 'quiz' program.
program Quiz.aleo {

  // Структура вопроса
  struct Question {
    text: String,
    answer: String,
  }

  // Список вопросов
  questions: [Question] = [
    Question {
      text: "What is the capital of France?",
      answer: "Paris",
    },
    Question {
      text: "What is the tallest mountain in the world?",
      answer: "Everest",
    },
    // ...
  ];

  // Функция для генерации случайного вопроса
  fn get_random_question() -> Question {
    return questions.random();
  }

  // Функция для проверки ответа
  fn check_answer(question: Question, answer: String) -> bool {
    return question.answer.to_lowercase() == answer.to_lowercase();
  }

  // Функция для отображения результатов
  fn show_results(score: int, total_questions: int) {
    println!("Your result: {score} from {total_questions}");
  }

  // Запуск игры
  fn main() {
    // Количество вопросов
    let total_questions = questions.len();

    // Счетчик правильных ответов
    mut score: int = 0;

    // Цикл по всем вопросам
    for question in questions {
      // Отображение вопроса
      println!("{}", question.text);

      // Ввод ответа
      let answer = input();

      // Проверка ответа
      if check_answer(question, answer) {
        score += 1;
      }
    }

    // Отображение результатов
    show_results(score, total_questions);
  }
}

// Запуск игры
Quiz::main();
