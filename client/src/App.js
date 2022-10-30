import React, { useState, useEffect } from 'react';
import logo from "./logo.svg";
import "./App.css";
import ConnectWallet from "./components/ConnectWallet";
import ContractCallVote from "./components/ContractCallVote";
import MintTicketButton from "./components/MintTicketButton";
import TransferTicket from "./components/TransferTicket";

import Ticket from "./components/Ticket";

const App = () => {
  // These will be set by a read-only call to see if the current user has a ticket
  const [showMintButton, setShowMintButton] = useState(false);
  const [showTicket, setShowTicket] = useState(false);

  return (
    <div className="App">
      <header className="App-header">
        {/* ConnectWallet file: `./src/components/ConnectWallet.js` */}
        <ConnectWallet />

        <Ticket />

        {/* Will either display mint button or the user's ticket */}
        {/* Want to group the transfer ticket with the ticket itself */}
        { showMintButton ? <MintTicketButton /> : <TransferTicket /> }
      </header>
    </div>
  );
}

export default App;
