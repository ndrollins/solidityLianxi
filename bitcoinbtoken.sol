pragma solidity ^0.8.2;

contract bitcoinbToken {
    mapping(address => uint) public balances;
    uint public totalSupply 7_000_000_000_000;
    string name = "bitcoin b";
    string symbol = "BCB";
    uint public decimals = 7;
    
    event Transfer(address indexed from, address indexed to, uint value);
    
    constructor() {
        balances[msg.sender] = totalSupply;
    }
    function balanceOf(address owner) public view returns(uint) {
        return balances[owner]; 
    }
    function transfer(address to, uint value) public returns(bool) {
        require(balanceOf(msg.sender) >= value, "balance too low for transaction");
        balances[to] += value;
        balances[msg.sender] -= value;
        emit Transfer(msg.sender, to, value);
        return true;
    }
}
