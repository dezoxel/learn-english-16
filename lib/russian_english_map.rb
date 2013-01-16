# encoding: utf-8
class RussianEnglishMap
  attr_accessor :translate_to_language

  def initialize
    @verbs = {
      :program => :программировать,
      :love => :любить,
      :live => :жить,
    }

    @russian_verbs_by_pronoun = {
      :программировать => {:я => :программирую, :вы => :программируете, :мы => :программируем, :они => :программируют, :он => :программирует, :она => :программирует, :это => :программирует},
      :любить          => {:я => :люблю,        :вы => :любите,         :мы => :любим,         :они => :любят,         :он => :любит,         :она => :любит,         :это => :любит},
      :жить            => {:я => :живу,         :вы => :живете,         :мы => :живем,         :они => :живут,         :он => :живет,         :она => :живет,         :это => :живет},
    }

    @pronouns = {
      :i => :я,
      :you => :вы,
      :we => :мы,
      :they => :они,
      :he => :он,
      :she => :она,
      :it => :это,
    }

    self.translate_to_language = :russian
  end

  def [](type, word)
    collection = case type
      when :pronoun
        @pronouns
      when :verb
        @verbs
    end

    case self.translate_to_language
      when :russian
        collection[word]
      when :english
        collection.invert[word]
    end
  end

  def russian_verb_by_pronoun(verb, pronoun)
    infinitive_verb = self[:verb, verb]
    russian_pronoun = self[:pronoun, pronoun]
    @russian_verbs_by_pronoun[infinitive_verb][russian_pronoun]
  end
end