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

## JS

```js
const Web3 = require('web3');
const ERC677Data = require('@rsksmart/rns-erc677/ERC677Data.json');
const web3 = new Web3('https://public-node.rsk.co')
const ERC677 = new web3.eth.Contract(ERC677Data.abi, ERC677Data.address.rskMainnet);
```

## Types

There are TypeScript typing definitions of the contracts published together with the original contracts. 
Supported contract's libraries are: 

* `web3` version 1.* - `web3-v1-contracts`
* `web3` version 2.* - `web3-v2-contracts`
* `truffle` - `truffle-contracts`
* `ethers` - `ethers-contracts`

You can use them as follow:

```typescript
import Web3 from 'web3'
import ERC677 from '@rsksmart/rns-erc677/types/web3-v1-contracts/ERC677Data.d.ts'
import ERC677Data from '@rsksmart/rns-erc677/ERC677Data.json'

const web3 = new Web3('https://public-node.rsk.co')
const rif = new web3.eth.Contract(ERC677Data.abi, ERC677Data.address.rskMainnet) as ERC677
```

Replace `web3-v1-contracts` with the proper library version.

---

---

RIF Token:
- [Docs](https://developers.rsk.co/rif/token/)
- RSK Mainnet: [0x2acc95758f8b5f583470ba265eb685a8f45fc9d5](https://explorer.rsk.co/address/0x2acc95758f8b5f583470ba265eb685a8f45fc9d5)
- RSK Testnet: [0x19F64674D8A5B4E652319F5e239eFd3bc969A1fE](https://explorer.testnet.rsk.co/address/0x19F64674D8A5B4E652319F5e239eFd3bc969A1fE)
