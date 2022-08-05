require "./lib/deck.rb"
require "./lib/setGame.rb"
require "./lib/player.rb"
require "./lib/hintGen.rb"

#players -> hashmap with key: player name of type string, value: instance object of type Player
players = {}
totalPlayers = 0

#First loop gets total player number
loop do
    puts "How many people are playing?"
    totalPlayers = gets.to_i
    #Check to make sure user input is valid. If its not valid, loop continues
    if totalPlayers > 0
        break
    else
        puts "Error: Must have atleast 1 player!" + "\n"
    end
end

#Get each player name and assign name as key with a player object as the value
for i in 0..totalPlayers-1
    puts "What is player " + (i+1).to_s + "'s name? "
    newName = gets.chomp
    players[newName.to_sym] = Player.new newName 
end

#call setGame constructor to start the game
game = SetGame.new

#Continually loops until game_end function is true
loop do
    game.print_hand
    playerName = ""
    #Adds three cards if there isn't a possible set
    unless game.pair_exists?
        puts "No possible set available! Adding 3 cards.\n"
        game.add_cards
        game.print_hand
    end
    #Variable to keep track if the player finds a set in time
    inTime = false

    #Sets up two threads. One waiting for user input and the other having a two minute timer
    while !inTime do
        gameThread = Thread.new do
            loop do
                sleep 2
                puts "\nEnter Your Name When You Have Found A Set.\nEnter 'HINT' for a hint.\nEnter 'EXIT' to quit the game."
                puts "If no one can find a set in 2 minutes the cards will be reshuffled. However, everyone will lose 1 point! GO!"
                playerName = gets.chomp
                #Checks if player input is valid and breaks out of inner loop 
                if players.has_key? playerName.to_sym
                    inTime = true
                    break
                elsif playerName == "HINT" #calls hint generator class 
                    hintGenerator = HintGen.new game.hand
                    puts "There are " + hintGenerator.num_pairs.to_s + " sets in the hand!\n"
                elsif playerName == "EXIT" #terminates the program if user wants to end game
                    puts "Congrats! You have finished the game! Here are the stats. \n"
                    game.display_scores players
                    exit true
                else
                    puts "Error: Not a valid name or instruction!\n"
                end
            end
        end
        #Second thread ongoing
        timer = Thread.new do
            sleep 120
            gameThread.kill
        end
        gameThread.join
        #If player ran out of time, everyone loses one point
        if !inTime
            puts "Out of time! Everyone loses one point! Reshuffling the hand...\n"
            game.decrement_scores players
            puts "Scores: \n"
            game.display_scores players
            sleep 3
            game.shuffle_hand
            game.print_hand
        end
    end
    #Get choice values for each card
    choice1, choice2, choice3 = 0,0,0
    loop do
        puts "Enter first card number (Example: '5'): "
        choice1 = gets.chomp.to_i
        puts "Enter second card number: "
        choice2 = gets.chomp.to_i
        puts "Enter third card number: "
        choice3 = gets.chomp.to_i
        if game.valid_choices? choice1, choice2, choice3
            break
        else
            puts "Error: Choices must be within the range of the hand!"
        end
    end
    #update scores depending on whether choices are a set or not
    players[playerName.to_sym].update_score game.deal? choice1, choice2, choice3
    break if game.game_end?
end
#Wrap up game
puts "Congrats! You have finished the game! Here are the stats. \n"
game.display_scores players