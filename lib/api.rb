class API


    def self.gather_spells
        url = "https://donmallory.tech/rkSpells.json"
        uri = URI(url)
        spells = Net::HTTP.get(uri)
        spells_array = JSON.parse(spells)
        spells_array.each do |spell|
            Spell.new(spell["spell"], spell["type"], spell["effect"])
        end

    end

end
