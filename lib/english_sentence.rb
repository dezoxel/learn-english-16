require_relative 'sentence'
require_relative 'string'
require 'yaml'

class English_Sentence < Sentence

  def initialize
    super
    @irregular_verbs = YAML.load_file("./db/irregular_verbs.yml")
  end

  def assemble!
    pronoun_index = @parts.find_index{ |part| part[:type] == :pronoun }
    verb_index = @parts.find_index{ |part| part[:type] == :verb }
    pronoun = @parts[pronoun_index][:value]
    @parts[verb_index][:value] = @parts[verb_index][:value].sub("to ", "")
    verb = @parts[verb_index][:value]

    send("#{@tense}_#{@expression_form}_modificator", pronoun_index, verb_index, pronoun, verb)

    @parts.map { |part| part[:value] }.join(" ")
  end

  def present_statement_modificator(pronoun_index, verb_index, pronoun, verb)
    endings = ["s", "ss", "ch", "sh", "x", "o"]
    if Sentence.is_he_she_it? pronoun
      ending1 = verb[-2, 2]
      ending2 = verb[-1, 1]
      verb = (endings.include?(ending1) || endings.include?(ending2)) ? verb + "es" : verb + "s"
    end
    @parts[verb_index][:value] = verb 
  end

  def present_question_modificator(pronoun_index, verb_index, pronoun, verb)
    do_does = "do"
    do_does += "es" if Sentence.is_he_she_it? pronoun
    @parts.insert(pronoun_index, :value => do_does, :type => :auxiliary_verb)
    @parts.push(:value => "?", :type => :punctuation)
  end

  def present_negation_modificator(pronoun_index, verb_index, pronoun, verb)
    do_does = "do"
    do_does += "es" if Sentence.is_he_she_it? pronoun
    do_does += "n't"
    @parts.insert(verb_index, :value => do_does, :type => :auxiliary_verb)
  end

  def past_statement_modificator(pronoun_index, verb_index, pronoun, verb)
    verb = if @irregular_verbs[verb] 
      @irregular_verbs[verb]["second"]
    else
      verb.ends_with?("e") ? verb[0..-2] + "ed" : verb + "ed"
    end
    @parts[verb_index][:value] = verb 
  end

  def past_question_modificator(pronoun_index, verb_index, pronoun, verb)
    @parts.insert(pronoun_index, :value => "did", :type => :auxiliary_verb)
    @parts.push(:value => "?", :type => :punctuation)
  end

  def past_negation_modificator(pronoun_index, verb_index, pronoun, verb)
    @parts.insert(verb_index, :value => "didn't", :type => :auxiliary_verb)
  end

  def future_statement_modificator(pronoun_index, verb_index, pronoun, verb)
    @parts.insert(verb_index, :value => "will", :type => :auxiliary_verb)
  end

  def future_question_modificator(pronoun_index, verb_index, pronoun, verb)
    @parts.insert(pronoun_index, :value => "will", :type => :auxiliary_verb)
    @parts.push(:value => "?", :type => :punctuation)
  end

  def future_negation_modificator(pronoun_index, verb_index, pronoun, verb)
    @parts.insert(verb_index, :value => "won't", :type => :auxiliary_verb)
  end

end