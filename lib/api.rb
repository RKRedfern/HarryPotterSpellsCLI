class API


    def self.gather_spells

        url = "https://donmallory.tech/spells.json"
        uri = URI(url)
        #surroud with a block
        spells = Net::HTTP.get(uri)
        #rescue from JSON Parser::Error
        spells_array = JSON.parse(spells)
        #try with new link
        spells_array.each do |spell|
            Spell.new(spell["spell"], spell["type"], spell["effect"])
        end

        Spell.sort_data
    end

end
