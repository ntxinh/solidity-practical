pragma solidity >= 0.7.0 <0.9.0;

contract MyGame {
    
    uint public playerCount = 0;
    Player[] public players;
    
    enum Level { Novice, Intermedia, Advanced } 
    
    struct Player {
        Level playerLevel;
        string firstName;
        string lastName;
    }
    
    function addPlayer(string memory firstName, string memory lastName) public {
        players.push(Player(Level.Novice, firstName, lastName));
        playerCount += 1;
    }
    
    function getPlayerLevel(uint index) public view returns (Level) {
        return players[index].playerLevel;
    }
}

// constant: keyword added to a variable that tells solidity it cannot be changed
// struct: Struct types are used to represent a record. They allow you to create your own data type.
// enum: Enums restruct a variable to have one of only a few predefined values. The values in this enumerated list are called enums
// array: Player[] public players;