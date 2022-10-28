import React, { useState, useEffect } from 'react';
import logo from "./logo.svg";
import "./App.css";
import ConnectWallet from "./components/ConnectWallet";
import ContractCallVote from "./components/ContractCallVote";
import MintTicketButton from "./components/MintTicketButton";

const App = () => {
  const [showMintButton, setShowMintButton] = useState(true);
  const [showTicket, setShowTicket] = useState(false);

  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />

        <h2>React + Stacks.js 👋</h2>

        {/* ConnectWallet file: `./src/components/ConnectWallet.js` */}
        <ConnectWallet />

        {/* ContractCallVote file: `./src/components/ContractCallVote.js` */}
        <ContractCallVote />

        {/* Will either display mint button or the user's ticket */}
        <MintTicketButton />

        <p>
          Edit <code>src/App.js</code> and save to reload.
        </p>
        <a
          className="App-link"
          href="https://docs.hiro.so/intro"
          rel="noopener noreferrer"
          target="_blank"
        >
          Learn Stacks
        </a>
        <a
            className="App-link"
            href="https://docs.hiro.so/build-apps/overview"
            rel="noopener noreferrer"
            target="_blank"
        >
          Learn to Build on Stacks
        </a>
        <a
          className="App-link"
          href="https://reactjs.org"
          rel="noopener noreferrer"
          target="_blank"
        >
          Learn React
        </a>
      </header>
    </div>
  );
}

export default App;
