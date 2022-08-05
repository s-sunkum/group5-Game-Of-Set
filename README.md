# Project 2
### Game-Of-Set
Welcome to the Game Of Set! Here's how the game works: 
* The deck consists of 81 unique cards that vary in four features with three possibilities for each feature. 
Number of shapes (one, two, or three), shape (diamond, squiggle, oval), shading (solid, striped, or open), and color (red, green, or purple). In the game, certain combinations of three cards make up a set. So what defines a set? Of the three cards chosen, each category must be all the same or all different. To clarify this, we can see an example. 3 solid red diamonds, 2 solid green squiggles, and 1 solid purple oval forms a set because the numbers in each card are all different, the shading in each card is all the same, the color in each card is all the same, and the shape in each card is all different. 
* In this implementation of the game, there are multiple players racing with each other and the clock. Each player has a score and gains points by identifying a correct set (+3 points) and loses points by incorrectly identifying a set or running out of time (-1 point). If a player successfully identifies a set, the three cards chosen are taken out of the hand and replaced by three new cards. The game ends when the deck runs out or the players choose to quit.
* That's all there is to the game! Have fun!


### Running The Program
* This project utilizes the Colorize gem. This MUST be properly installed for the game to work.
  * To run the program, type ```$ bundle install``` and enter.
  * To run the game, type ```$ ruby main.rb``` and enter.
* Enter the number of players and the names of each player
* The game will now start and the players will see 12 cards drawn from the deck.
* Since everyone is competing against each other, whoever finds a set will type their name in the terminal. The players can also type ```HINT``` to help them find a set.
* If a player finds a set, he/she enters the card indices from the cards shown.
* Continue until the game ends or manually exit by entering in ```EXIT``` in the terminal.

### Functionality
* Multiple Players - Multiple players can play at the same time
* Timer - If players can't find a set in 2 minutes, the hand is reshuffled, all players lose 1 point, and new cards are displayed
* Color - Terminal outputs cards with colors depending on card attributes
* Scores - Keeps track of each player's score and displays all of them at the end of the game
* Hint Generator - Tells the players how many sets are in the hand
* Exit - Players are allowed to exit the game at any time

### Contributors 
* Shravun Sunkum
* Suyash Talekar
* Yusen Zhang
* Thomas Liu
