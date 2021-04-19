// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Use only for testing purposes

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "./ERC677TransferReceiver.sol";
import "./IERC677.sol";

contract ERC677 is IERC677, ERC20 {
    constructor(
        address initialAccount,
        uint256 initialBalance,
        string memory name,
        string memory symbol
    ) ERC20(name, symbol) {
        _mint(initialAccount, initialBalance);
    }

    /**
     * ERC-677's only method implementation
     * See https://github.com/ethereum/EIPs/issues/677 for details
     */
    function transferAndCall(address _to, uint _value, bytes memory _data) public override returns (bool) {
        bool result = super.transfer(_to, _value);
        if (!result) return false;

        emit Transfer(msg.sender, _to, _value, _data);

        ERC677TransferReceiver receiver = ERC677TransferReceiver(_to);
        receiver.tokenFallback(msg.sender, _value, _data);

        // IMPORTANT: the ERC-677 specification does not say
        // anything about the use of the receiver contract's
        // tokenFallback method return value. Given
        // its return type matches with this method's return
        // type, returning it could be a possibility.
        // We here take the more conservative approach and
        // ignore the return value, returning true
        // to signal a succesful transfer despite tokenFallback's
        // return value -- fact being tokens are transferred
        // in any case.
        return true;
    }
}
