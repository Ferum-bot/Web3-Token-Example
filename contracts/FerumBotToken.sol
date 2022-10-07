// contracts/Counter.sol
pragma solidity ^0.8.5;

import '@openzeppelin/contracts/token/ERC20/ERC20.sol';

contract FerumBotToken is ERC20 {

    address public adminAddress;

    constructor() ERC20("FerumBotToken", "FBOT") {
        _mint(msg.sender, 10000 * 10 ** 18);
        adminAddress = msg.sender;
    }
}