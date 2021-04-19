// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./IERC677TransferReceiver.sol";

/*
 * Contract interface for receivers of tokens that
 * comply with ERC-677.
 * See https://github.com/ethereum/EIPs/issues/677 for details.
 */
contract ERC677TransferReceiverTest is IERC677TransferReceiver {
    event Test(address from, uint256 amount, bytes data);

    function tokenFallback(address from, uint256 amount, bytes calldata data) external override returns (bool) {
        emit Test(from, amount, data);
        return true;
    }
}
