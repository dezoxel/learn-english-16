class Conversation
  def waiting_for_answer
    STDOUT.print ">"
    STDIN.gets.chop
  end

  def want_to_exit?(answer)
    answer == "exit"
  end

  def start
    loop do
      tense, form, pronoun, verb = generate_rand_parts_of_sentence
      sentence_rus = generate_russian_sentence_by tense, form, pronoun, verb
      sentence_eng = generate_english_sentence_by tense, form, pronoun, verb

      show_to_companion sentence_rus
      answer = waiting_for_answer
      break if want_to_exit? answer

      if answer == sentence_eng
        congrats
      else
        upset sentence_eng
      end
    end
  end

  def generate_russian_sentence_by(tense, form, pronoun, verb)
    ""
  end

  def generate_english_sentence_by(tense, form, pronoun, verb)
    ""
  end

  def generate_rand_data_for_sentence
    [
      Sentence.tenses[rand(Sentence.tenses.length)],
      Sentence.expression_forms[rand(Sentence.expression_forms.length)],
      Sentence.pronouns[rand(Sentence.pronouns.length)],
      Sentence.verbs[rand(Sentence.verbs.length)],
    ]
  end

  def show_to_companion(message)
    STDOUT.puts "< " + message
  end

  def congrats
    STDOUT.puts "You are right!"
  end

  def upset(expected_sentence)
    STDOUT.puts "No, you are wrong! Right is: '#{expected_sentence}'"
  end
end

