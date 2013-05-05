require 'yaml'
require_relative 'russian_sentence'
require_relative 'english_sentence'


class Conversation

  def initialize
    @verbs = YAML.load_file('./db/verbs.yml')
  end

  def waiting_for_answer
    STDOUT.print "> "
    STDIN.gets.chop
  end

  def want_to_exit?(answer)
    answer == "exit"
  end

  def start
    loop do
      tense, form, pronoun, verb = generate_rand_data_for_sentence
      sentence_rus = construct_russian_sentence_by tense, form, pronoun, verb
      sentence_eng = construct_english_sentence_by tense, form, pronoun, verb

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

  def construct_russian_sentence_by(tense, form, pronoun, verb)
    index = Sentence.pronouns(:first).index(pronoun)
    rus_pronoun = Sentence.pronouns(:first, :rus)[index]
    rus_verb = @verbs[verb]
    Russian_Sentence.new.send("#{tense}_#{form}_for", rus_pronoun, rus_verb)
  end

  def construct_english_sentence_by(tense, form, pronoun, verb)
    English_Sentence.new.tense(tense).expression_form(form).pronoun(pronoun).verb(verb).assemble!
  end

  def generate_rand_data_for_sentence
    @first_person_pronouns ||= Sentence.pronouns(:first)
    @verbs_list ||= @verbs.keys
    [
      Sentence.tenses[rand(Sentence.tenses.length)],
      Sentence.expression_forms[rand(Sentence.expression_forms.length)],
      @first_person_pronouns[rand(@first_person_pronouns.length)],
      @verbs_list[rand(@verbs_list.length)],
    ]
  end

  def show_to_companion(message)
    STDOUT.puts "< " + message
  end

  def congrats
    # Nothing showing when competitor answers right
  end

  def upset(expected_sentence)
    STDOUT.puts "BAD: No, you are wrong! Right is: '#{expected_sentence}'"
  end
end

