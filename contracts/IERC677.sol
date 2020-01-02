pragma solidity ^0.5.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract IERC677 is IERC20 {
    function transferAndCall(address to, uint256 value, bytes memory data) public returns (bool ok);

    event Transfer(address indexed from, address indexed to, uint256 value, bytes data);
}
