class Spell

    attr_accessor :name, :type, :effect

    @@all = []

    def initialize(name, type, effect)
        @name = name 
        @type = type
        @effect = effect
        @@all << self
    end

    def self.all
        @@all
    end

    def self.spell_types
        @@spell_types
    end
    
    def self.sort_data
        @@spell_types = self.all.map {|spell| spell.type}.uniq
    end

    def self.retrieve_by_type(type)
        selected_spells = self.all.filter{|spell| spell.type == type}
        selected_spells.map{|spell| spell.name}
    end

    def self.retrieve_effect(name)
        found_spell = self.all.find{|spell| spell.name == name}
        found_spell.effect
    end
        
end