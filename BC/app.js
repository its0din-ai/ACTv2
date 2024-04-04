const EthAbi = require('ethereumjs-abi');

const listTypes = ['string[]', 'string[]', 'string[]', 'string[]'];
const listData = [
  ['331770116042534380717949', 'loremp', 'ipsum'],
  ['dolor', 'sit', 'jamet'],
  ['BUY PYTH!', '32456809444505316195694471678759906459727114549144383490340245190408093865024294353854333', 'BTC DUMP TO 20K!'],
  ['1995824280294682652899677336163472917762514596627805222698285675053295904616049533', 'awikwokpisannn', '112964323471989320165877939192028265186207957097427361995906941']
];
const encodedData = EthAbi.rawEncode(listTypes, listData);
console.log(encodedData.toString('hex')); 
