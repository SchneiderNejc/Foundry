pragma solidity 0.8.27;

contract Event {
    event Transfer(address indexed from, address indexed to, uint amount);

    function transfer(address from, address to, uint amount) external {
        emit Transfer(from, to, amount);
    }

    function transferMany(
        address from,
        address[] calldata to,
        uint[] calldata amount
    ) external {
        for (uint i; i < to.length; i++) {
            emit Transfer(from, to[i], amount[i]);
        }
    }
}
