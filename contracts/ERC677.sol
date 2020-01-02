pragma solidity ^0.5.0;

// Use only for testing reasons

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20Detailed.sol";
import "./ERC677TransferReceiver.sol";
import "./IERC677.sol";

contract ERC677 is IERC677, ERC20, ERC20Detailed {
    constructor(
        address initialAccount,
        uint256 initialBalance,
        string memory name,
        string memory symbol,
        uint8 decimals
    ) ERC20Detailed(name, symbol, decimals) public {
        _mint(initialAccount, initialBalance);
    }

    /**
     * ERC-677's only method implementation
     * See https://github.com/ethereum/EIPs/issues/677 for details
     */
    function transferAndCall(address _to, uint _value, bytes memory _data) public returns (bool) {
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