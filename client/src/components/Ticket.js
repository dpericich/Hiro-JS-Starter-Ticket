import React from 'react';
import styled from 'styled-components';

const TicketContainer = styled.div`
  background-color: white;
  color: black;
  display: flex;
  flex-direction: column;
  justify-content: center
  align-items: center;
  padding: 1rem;
  margin: 1rem;
  width: 80%;
  border-radius: 5px;
  border: 1px dotted;
  box-shadow: 3px 3px 2px rgba(255,255,255,0.7);
`

const Ticket = () => {
  // Show the currently authenticated user -> only if a ticket has been minted
  return(
    <TicketContainer>
      <h3>Stacks Rails</h3>
      <p>August 31st, 2023 - 6:00 PM</p>
      <p>Rider: {"Rider's Name"}</p>
      <p>Price: 35 STX</p>
    </TicketContainer>
  )
};

export default Ticket;
