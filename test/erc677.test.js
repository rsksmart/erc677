const ERC677 = artifacts.require('ERC677');
const ERC677TransferReceiverTest = artifacts.require('ERC677TransferReceiverTest');

const { expectEvent } = require('@openzeppelin/test-helpers');

contract('ERC677', async accounts => {
  let erc677, receiver;

  beforeEach(async () => {
    erc677 = await ERC677.new(
      accounts[0],
      web3.utils.toBN('1000000000000000000000'),
      'RIFOS',
      'RIF',
    );

    receiver = await ERC677TransferReceiverTest.new();
  });

  it('should emit received data', async () => {
    const from = accounts[0];
    const to = receiver.address;
    const amount = web3.utils.toBN('10');
    const data = '0x0011223344556677';

    const { tx } = await erc677.transferAndCall(
      to,
      amount,
      data,
    );

    expectEvent.inTransaction(
      tx,
      receiver,
      'Test',
      { from, amount, data },
    );
  });
});
