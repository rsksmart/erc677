# erc677

Simple implementation of ERC-677 token contract, compatible with RIF Token.

## Install

```
npm i @rsksmart/erc677
```

## Usage

```js
const ERC677 = artifacts.require('ERC677');

contract('My contract tests', async accounts => {
  let erc677;

  beforeEach(async () => {
    erc677 = await ERC677.new(
      accounts[0],
      web3.utils.toBN('1000000000000000000000'),
      'RIFOS',
      'RIF',
      web3.utils.toBN('18'),
    );
  });
});
```

---

RIF Token:
- [Docs](https://developers.rsk.co/rif/token/)
- RSK Mainnet: [0x2acc95758f8b5f583470ba265eb685a8f45fc9d5](https://explorer.rsk.co/address/0x2acc95758f8b5f583470ba265eb685a8f45fc9d5)
- RSK Testnet: [0x19F64674D8A5B4E652319F5e239eFd3bc969A1fE](https://explorer.testnet.rsk.co/address/0x19F64674D8A5B4E652319F5e239eFd3bc969A1fE)
