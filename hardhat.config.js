/**
 * @type import('hardhat/config').HardhatUserConfig
 */

 require('@nomiclabs/hardhat-truffle5');

 module.exports = {
   solidity: "0.6.9",
 
   networks: {
     rinkeby: {
       url: 'https://rinkeby.infura.io/v3/8aa2106d23d8414eaa44ba4cc0a07267',
       accounts: ['64f1f2acaf2de8aaf1b707ae82b00f1618679b19829b2112d03f127749a31c53'],
     },
   }
 };
 