=begin
Player class keeps track of a player's name and score
The score is updated depending upon if the player chose a valid set or not
A valid set gets +3 points while an invalid one gets -1 point
=end
class Player
    attr_reader :name, :score
=begin
    Initializes the player object with a name and initial score

    @param name
        The name of the player
=end
    def initialize(name)
        @name = name
        @score = 0
    end

=begin
    Adds 3 points to the player's score

    @return
        the player's updated score
=end
    def add_score
        @score += 3
    end 
=begin
    Subtracts 1 point from the player's score

    @return
        the player's updated score
=end
    def subtract_score
        @score -= 1
    end
    
=begin
    Updates the player's score depending on if his chosen set is valid

    @param isSet
        the validity of the player's set (true or false)
=end
    def update_score(isSet)
        if isSet 
            add_score     #valid set
            puts "You correctly identified a set!" + "\n"
        else
            subtract_score     #invalid set
            puts "Shoot! That's not a set. You get -1 points :(" + "\n"
        end
        puts @name + ": " + @score.to_s + " points" + "\n"
        puts "Loading...\n"
        loadingTime = 3
        sleep(loadingTime)
    end

end