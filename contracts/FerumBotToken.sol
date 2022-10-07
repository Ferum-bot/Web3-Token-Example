// SPDX-License-Identifier: <SPDX-License>
// contracts/FerumBotToken.sol
pragma solidity ^0.8.5;

import '@openzeppelin/contracts/token/ERC20/ERC20.sol';

contract FerumBotToken is ERC20 {

    address public adminAddress;

    constructor() ERC20("FerumBotToken", "FBOT") {
        _mint(msg.sender, 10000 * 10 ** 18);
        adminAddress = msg.sender;
    }

    function helloWorld() external pure returns (string memory) {
        return 'Hello world from FerumBot Token!';
    }
}