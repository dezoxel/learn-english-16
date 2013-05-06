# coding: utf-8
require_relative 'sentence'
require_relative 'string'

class Russian_Sentence < Sentence

  def initialize
    super
    @russian_verbs = YAML.load_file("./db/russian_verbs.yml")
    @lang = :rus
  end

  def assemble!
    pronoun_index = @parts.find_index{ |part| part[:type] == :pronoun }
    verb_index = @parts.find_index{ |part| part[:type] == :verb }
    pronoun = @parts[pronoun_index][:value]
    verb = @parts[verb_index][:value]

    send("#{@expression_form}_modificator", @tense, pronoun_index, verb_index, pronoun, verb)

    @parts.map { |part| part[:value] }.join(" ")
  end

  def statement_modificator(tense, pronoun_index, verb_index, pronoun, verb)
    verb = @russian_verbs[verb][convert_tense_to_russian(tense).to_s][pronoun]
    @parts[verb_index][:value] = verb 
  end

  def question_modificator(tense, pronoun_index, verb_index, pronoun, verb)
    verb = @russian_verbs[verb][convert_tense_to_russian(tense).to_s][pronoun]
    @parts[verb_index][:value] = verb 
    @parts.push(:value => "?", :type => :punctuation)
  end

  def negation_modificator(tense, pronoun_index, verb_index, pronoun, verb)
    verb = @russian_verbs[verb][convert_tense_to_russian(tense).to_s][pronoun]
    @parts[verb_index][:value] = verb 
    @parts.insert(verb_index, :value => "не", :type => :auxiliary_verb)
  end

  def self.database_verbs_diff
    map_verbs = YAML.load_file("./db/verbs.yml").values
    russian_verbs = YAML.load_file("./db/russian_verbs.yml").keys
    diff1 = map_verbs - russian_verbs
    return diff1 unless diff1.empty?
    russian_verbs - map_verbs
  end

protected

  def convert_tense_to_russian(tense)
    Sentence.rus_tenses[Sentence.tenses.index(tense)]
  end

end