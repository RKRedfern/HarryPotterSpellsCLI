
class CLI
    def initialize
        @first_greeting = true
        start
    end

    def start
        puts
        puts
        puts "Good evening! You've got a good reason to be out of bed at this hour I'm sure!"
        puts
        sleep(1)
        menu
    end

    def menu
        greeting = (@first_greeting ? "Tell me, are you perhaps interested in doing some less-than-permissible wandwork tonight?" : "Would you like to see more?")
        response = $prompt.select(greeting, ["Yes", "No"])
        
        @first_greeting = false
        
        clear_screen
        
        if response == "Yes"
            display_spell_menu
        else
            puts 
            puts
            puts "Well then I see no reason that you shouldn't get back to your dormitory immediately! A pleasant evening to you!"
            sleep(1)
            puts 
            puts "Off you go!"
            puts
        end
    end

    def exit_menu
        response = $prompt.select("\nWould you like to see more?", ["Yes", "No"])
        if response == "Yes"
            display_spell_menu
        elsif 
            response == "No"
        else 
            exit_menu
        end
        
    end

    def display_spell_menu
        
        
        chosen_type = $prompt.select("\nSplendid! Now which type of spells are you having trouble with?", Spell.spell_types)

        clear_screen
        
        spells = Spell.retrieve_by_type(chosen_type)
        
        chosen_spell_name = $prompt.select("\nAh certainly, I'd be happy to tell you more about these!", spells)

        clear_screen
        
        effect = Spell.retrieve_effect(chosen_spell_name)
        
        messages = {"Charm" => "\nRemember, a lot of the work here is going to come from the motion of your wand, each charm relies on how it is cast not only it's incantation!\n",
            "Spell" => "\nI personally don't think you can ever review the basics enough! A clear picture in the mind will render clear results!\n",
            "Curse" => "\nI would be remiss if I didn't say... you've really got to mean it when you cast a spell like this! Use with exreme caution... if ever!\n",
            "Hex" => "\nTricky little spells, these are! A couple of good hexes are key in any young wizards arsenal for the occasional duel!\n",
            "Jinx" => "\nHaha! Oh I remember fondly the days when I used to cast these on friends! A lot of wizards underestimate how hard it is to reverse a well-cast jinx.\n",
            "Enchantment" => "\nOhhh mysterious and wonderful incantations, these. The mind must be set and you must be full of intention to make an enchatment last. Don't be discouraged if they don't stick at first!\n"}
        
        clear_screen

        message = "\nThe effect of the #{chosen_spell_name} incantation is that it #{effect}.\n#{messages[chosen_type]}"
        $prompt.select(message, ["continue"])
        
        menu
    end

    
    def clear_screen
        system "clear"
    end
        
end