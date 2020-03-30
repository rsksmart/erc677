const fs = require('fs');

const addresses = require('./addresses');

const erc677Build = require('./build/contracts/ERC677');

const erc677Data = {
  abi: erc677Build.abi,
  bytecode: erc677Build.bytecode,
  address: {
    rskMainnet: addresses.RIFToken.rskMainnet,
    rskTestnet: addresses.RIFToken.rskTestnet,
  },
};

fs.writeFileSync('./ERC677Data.json', JSON.stringify(erc677Data));
