'use strict';

var sauceConnectLauncher = require('sauce-connect-launcher');

var proxy;

function cleanup() {
    console.log('\nClosing proxy...');
    proxy.close(function () {
      console.log("Closed Sauce Connect process.");
      process.exit();
    });
}

function createProxy(cb) {
  console.log('Starting Sauce Connect proxy...');
  const options = {
    /* THESE GO IN USER CONFIG
    username: '',
    accessKey: '',
    */

    //verbose: true,
    //verboseDebugging: true,
    logger: console.log,
  };
  sauceConnectLauncher(options, function (err, sauceConnectProcess) {
    if (err) {
      throw err;
    }
    proxy = sauceConnectProcess;
    console.log('Sauce Connect ready.');
  });
}

function main() {

}



createProxy();
require('http-server/bin/http-server')

//catches ctrl+c event
process.removeAllListeners('SIGINT');
process.on('SIGINT', cleanup);
