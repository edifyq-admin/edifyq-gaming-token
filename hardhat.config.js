/** @type import('hardhat/config').HardhatUserConfig */

require('dotenv').config();
require('@nomiclabs/hardhat-ethers');

const { MAINNET_API_URL, MAINNET_PRIVATE_KEY, SEPOLIA_API_URL, SEPOLIA_PRIVATE_KEY } = process.env;

module.exports = {
  solidity: {
    version: "0.8.24",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200
      }
    }
  },
  defaultNetwork: "hardhat",
  networks: {
    hardhat: {},
  sepolia: {
      gas: 24677785280,
      url: SEPOLIA_API_URL,
      accounts: [ `0x${SEPOLIA_PRIVATE_KEY}`]
    }, 
    mainnet: {
      url: MAINNET_API_URL,
      accounts: [ `0x${MAINNET_PRIVATE_KEY}` ]
    }
  }
};
