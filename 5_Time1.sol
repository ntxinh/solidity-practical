pragma solidity >= 0.7.0 <0.9.0;

contract MyGame {
    
    uint public playerCount = 0;
    Player[] public players;
    
    enum Level { Novice, Intermedia, Advanced } 
    
    struct Player {
        Level playerLevel;
        string firstName;
        string lastName;
        uint createdTime;
    }
    
    function addPlayer(string memory firstName, string memory lastName) public {
        players.push(Player(Level.Novice, firstName, lastName, block.timestamp));
        playerCount += 1;
    }
    
    function getPlayerLevel(uint index) public view returns (Level) {
        Player storage player = players[index];
        return player.playerLevel;
    }
    
    function changePlayerLevel(uint index) public {
        Player storage player = players[index];
        if (block.timestamp >= player.createdTime + 20) {
            player.playerLevel = Level.Intermedia;
        }
    }
}