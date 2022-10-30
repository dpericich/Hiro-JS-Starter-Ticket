import React, { useState} from 'react';
import { StacksMocknet } from '@stacks/network';
import {
  makeContractCall,
  broadcastTransaction,
  AnchorMode,
  FungibleConditionCode,
  makeStandardSTXPostCondition,
  standardPrincipalCV,
  bufferCVFromString,
} from '@stacks/transactions';

const TransferTicket = () => {
  const [recipientAddress, setRecipientAddress] = useState('');
  //  Need to be able to get the current

  // Will use this when I specify the network
  const mocknet = new StacksMocknet();

  const transfer = () => {
    const txOptions = {
      contractAddress: 'ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM',
      contractName: 'ticket-nft',
      functionName: 'transfer',
      functionArgs: [standardPrincipalCV(recipientAddress)],
      validateWithAbi: true,
      network: mocknet,
      anchorMode: AnchorMode.any,
    }

    const transaction = makeContractCall(txOptions);

    console.log(transaction);
  }

  return(
    <div>
      <label>Enter New Ticket Owner's Address: </label>
      <input type="text" value={recipientAddress} onChange={(e) => setRecipientAddress(e.target.value)} />
      <div onClick={transfer}>Transfer Ticket</div>
    </div>
  )
};

export default TransferTicket;
