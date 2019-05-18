const path = require("path");
const HDWalletProvider = require('truffle-hdwallet-provider');
const fs = require('fs');

let secrets;

if (fs.existsSync('secrets.json')) {
 secrets = JSON.parse(fs.readFileSync('secrets.json', 'utf8'));
}


module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // for more about customizing your Truffle configuration!
  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*" // Match any network id
    },
    ropsten:
    { 
      provider: new HDWalletProvider(secrets.mnemnoic, "https://ropsten.infura.io/v3/"+secrets.infuraApiKey),
      network_id: "3",
      host: 'localhost',
      port: 7545,
      gas: 4000000,
      gasPrice: 21
    },

  }
};
