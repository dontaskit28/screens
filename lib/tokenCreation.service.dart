import 'dart:convert';
import 'package:web3dart/web3dart.dart';
import 'network.dart';
import 'evm.service.dart' as evm;

Future<String> deployErc20Contract(
    Web3Client client,
    Network network,
    Credentials credentials,
    String name,
    String symbol,
    String totalSupply) async {
  var contract = DeployedContract(
    ContractAbi.fromJson(jsonEncode(tokenFacotryAbi), "Token Factory"),
    EthereumAddress.fromHex("0x65a4ee9cCC47b1D4eCf93E37C6c4BEe89700DCc3"),
  );
  var deployFunc = contract.function('deployToken');
  var gasOptions = await evm.getGasFee(client);
  var deployTx = evm.createContractTransaction(
      contract,
      deployFunc,
      [name, symbol, BigInt.parse(totalSupply)],
      gasOptions[1].maxFeePerGas,
      gasOptions[1].maxPriorityFeePerGas);
  return await evm.sendTransaction(client, network, credentials, deployTx);
}

var tokenFacotryAbi = [
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": false,
        "internalType": "address",
        "name": "tokenAddress",
        "type": "address"
      }
    ],
    "name": "TokenDeployed",
    "type": "event"
  },
  {
    "inputs": [
      {"internalType": "string", "name": "_name", "type": "string"},
      {"internalType": "string", "name": "_symbol", "type": "string"},
      {"internalType": "uint256", "name": "_supply", "type": "uint256"}
    ],
    "name": "deployToken",
    "outputs": [
      {"internalType": "address", "name": "", "type": "address"}
    ],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [],
    "name": "tokenCount",
    "outputs": [
      {"internalType": "uint256", "name": "", "type": "uint256"}
    ],
    "stateMutability": "view",
    "type": "function"
  },
  {
    "inputs": [
      {"internalType": "uint256", "name": "", "type": "uint256"}
    ],
    "name": "tokens",
    "outputs": [
      {"internalType": "address", "name": "", "type": "address"}
    ],
    "stateMutability": "view",
    "type": "function"
  }
];
