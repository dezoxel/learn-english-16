# encoding: utf-8

class Sentence
  def self.tenses
    [:past, :present, :future]
  end

  def self.expression_forms
    [:statement, :question, :negation]
  end

  def self.is_he_she_it?(pronoun)
    ["he", "she", "it"].include? pronoun
  end

  def initialize
    @pronouns = YAML.load_file('./db/pronouns.yml')
  end

  def self.pronouns(person = nil, lang = "eng")
    raise "Unknown language. Allowable are 'eng', 'rus'" unless @@pronouns[lang]

    if person.nil?
      return @@pronouns[lang]
    end

    raise "Unknown person for pronoun. Allowable are 'first', 'second', 'third'" unless @@pronouns[lang][person]
    @@pronouns[lang][person]
  end

  @@pronouns = {
    "eng" => {
      "first"  => ["i",  "you",  "we",  "they",  "he",  "she", "it"],
      "second" => ["me", "you",  "us",  "them",  "him", "her", "it"],
      "third"  => ["my", "your", "our", "their", "his", "her", "its"],
    },
    "rus" => {
      "first"  => ["я",        "вы",   "мы",       "они",   "он",      "она",   "оно"],
      "second" => ["мне/меня", "вас",  "нас/нам",  "им/их", "ему/его", "ее/ей", "этому"],
      "third"  => ["мое/мои",  "ваше", "наш/наше", "их",    "его",     "ее",    "этого"],
    },
  }

end
