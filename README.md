
The repo for the Edifyq Gaming Token DAO.

The token address is: 0xE442aa99d9b37D5229Cafce4B48CE32414e8Df40

Check at: https://etherscan.io/address/0xE442aa99d9b37D5229Cafce4B48CE32414e8Df40

The vendor contract can be seen at:
https://etherscan.io/address/0xbFcBB3ABba1FB67D30b2226d33ed40F2E22CBB99


## Setup

After cloning the repo, navigate to the directory and run:

`yarn`

This will install all the libraries needed for the project.

Once that is done, run:

`npx hardhat compile`

Make sure there is no errors compiling the project.


## Environment

Sign up for an account at https://www.alchemy.com/

Then populate the variables in .env

After this has been done, the contracts can be deployed to Sepolia using:

`npx hardhat run scrips/deploy.js --network sepolia`


## Local development

We use hardhat to run the project locally.

To start your private blockchain instance, run:

`npx hardhat node`

This will give you 20 test accounts to play around with. Setup your variables using one of these accounts, then deploy locally using:

`npx hardhat run scripts/deploy.js --network hardhat`