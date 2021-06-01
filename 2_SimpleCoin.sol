pragma solidity >= 0.7.0 <0.9.0;

contract Coin {
    address public minter;
    mapping (address => uint) public balances;
    
    event Sent(address from, address to, uint amount);
    
    constructor() {
        minter = msg.sender;
    }
    
    function mint(address receiver, uint amount) public {
        require(msg.sender == minter);
        require(amount < 1e60);
        balances[receiver] += amount;
    }
    
    function send(address receiver, uint amount) public {
        require(amount <= balances[msg.sender], "Insufficient balance.");
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }
}

// Address: Every account and smart contract has an address. I is used to send and receive Ther from one account to another. You can consider it your public identity on the Blockchain
// Mapping: Data type used to store associations. Similar to a list but holding 2 values, and allow you to quickly get the value corresponing to a key
// Event: When you call an event, it causes the arguments to be stored in the transaction's log
// Emit: Keyword used to call Events
// Constructor: function that is run directly when the contract is created
// Msg: Keyword that allows us to access some special variables that are available for us from the blockchain
// Require: Convenience function in solidity. It guarantees validity of conditions that cannot be detected before execution