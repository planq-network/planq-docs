# Devnet: Running Latest Development Node

::: warning caution
this page is for building and running the latest development version of the chain for testing purpose only. Please note that is under active development and is highly unstable and subject to breaking changes. You should expect a moderate amount of troubleshooting work is required.

For anyone interested in joining the Cronos testnet,
please refer to our public testnet documentation which will be released shortly.
:::

By following this tutorial, you can compile and run the latest development version of Cronos testnet from scratch. It is intended for testing purpose only.

### Install `ethermintd`

Install the binded version, which install chain-maind together, and find it by the absolute path:

```
git clone https://github.com/tharsis/ethermint
cd ethermint
make install
```

Afterward, you can verify that by

```bash
$ ethermintd -h
```

## Customize your devnet

_Note_: Yuo can skip this section and start a local devnet without customization.

You can customize your devnet based on `ethermint/init.sh`, for example:

```yaml
### customize the name of your key, the chain-id and moniker of the node ###
  KEY="mykey"
  CHAINID="ethermint-2"
  MONIKER="localtestnet"
.......
### specify the default keyring back-backend to be 'test' for convenience ###
  ethermintd config keyring-backend test
  ethermintd config chain-id $CHAINID
.......
# Allocate genesis accounts (cosmos formatted addresses)
  ethermintd add-genesis-account $KEY 100000000000000000000000000aphoton --keyring-backend test

# Sign genesis transaction
  ethermintd gentx $KEY 1000000000000000000000aphoton --keyring-backend test --chain-id $CHAINID
```

The default configuration will give us a single validators devnet with the chain-id `ethermint-2`; 1 accounts under the name of `mykey` with some allocated funds at the genesis.

## Start the devnet

Once we finish with the configuration, we are ready to start the chain: in the repository root directory, run

```sh
$ ./init.sh
```

Blocks are now being generated! You can verify and visit the rpc port [http://localhost:26657/](http://localhost:26657/) to view the blockchain data.

## Interact with the chain

After the chain has been started, we may open up another terminal and start interacting with the chain by `ethermind`.

### Keys management

A key will be generated according to the configuration specified in `init.sh`. By default, the key will be stored in the `--keyring-backend test` and the name of the key will be `mykey` . In another terminal window or tab,

```
$ ethermintd keys list
```

You will be able to list the address with allocated initial funds, for example:

```bash
- name: mykey
  type: local
  address: eth14r2pnjm3v8sng8f9y9can4luykrltz36y6vcsp
  pubkey: ethpub17weu6qepq097dfma5sqz6myzw7swhk7rdljpuxu8nf358gfr2fa5up28x6lngxlk0zu
  mnemonic: ""
  threshold: 0
  pubkeys: []
```

### Check account balance

You can check the account balance by

```
ethermintd q bank balances eth14r2pnjm3v8sng8f9y9can4luykrltz36y6vcsp

```

For example:

```bash
balances:
- amount: "99999000000000000000000000"
  denom: aphoton
pagination:
  next_key: null
  total: "0"
```

We can see that there is `99999000000000000000000000` aphoton in this address.

### Transfer token to another address

- We are now ready to transfer token between different addresses; we can create another address with the key name `Bob`:

  ```
  $ ethermintd keys add Bob --keyring-backend test
  ```

  which gives, for example:

  ```

  - name: Bob
  type: local
  address: eth1xwxk09wds0u2k6l39sp0e8ajx3jkw6dm0z5c26
  pubkey: ethpub17weu6qepqwaqek0we9a6ujsnmc3ke3xwkpl68qylcfkazv5tm04y80x004gy2uy3g8p
  mnemonic: ""
  threshold: 0
  pubkeys: []


  **Important** write this mnemonic phrase in a safe place.
  It is the only way to recover your account if you ever forget your password.

  refuse tray sauce area battle decide slot tilt position refuse blouse sauce mimic panic combine know stem section sustain reveal clever final assume flash
  ```

- Now we can transfer tokens to `Bob`, for example you can send `1aphoton` to Bob's address by

  ```
  $ ethermintd tx bank send mykey eth1xwxk09wds0u2k6l39sp0e8ajx3jkw6dm0z5c26 1aphoton --fees 20aphoton
  ```

- Lastly, check balance of Bob's address:
  ```
  $ ethermintd query bank balances eth1xwxk09wds0u2k6l39sp0e8ajx3jkw6dm0z5c26
  ```
  and we can see that 1 `aphoton` has already been transferred:
  ```
  balances:
  - amount: "1"
  denom: aphoton
  pagination:
  next_key: null
  total: "0"
  ```

Congratulations! You've successfully transferred tokens to Bob.

#### Check the current validator set

Firstly, we can check the details of the current validator set by the query command of chain-maind, for example:

```
$ chain-maind query staking validators -o json | jq
```

will result in

```json
{
  "validators": [
    {
      "operator_address": "ethvaloper1zwm45n5r3u3xcpsd00d3arwzhz7250rtsadv65",
      "consensus_pubkey": {
        "@type": "/cosmos.crypto.ed25519.PubKey",
        "key": "fD6cWVYv5rsNbXDw3hVIbB3nd9x57HsTyeMgwmH472U="
      },
      "jailed": false,
      "status": "BOND_STATUS_BONDED",
      "tokens": "1000000000000000000000",
      "delegator_shares": "1000000000000000000000.000000000000000000",
      "description": {
        "moniker": "localtestnet",
        "identity": "",
        "website": "",
        "security_contact": "",
        "details": ""
      },
      "unbonding_height": "0",
      "unbonding_time": "1970-01-01T00:00:00Z",
      "commission": {
        "commission_rates": {
          "rate": "0.100000000000000000",
          "max_rate": "0.200000000000000000",
          "max_change_rate": "0.010000000000000000"
        },
        "update_time": "2021-07-12T12:32:29.400973Z"
      },
      "min_self_delegation": "1"
    }
  ],
  "pagination": {
    "next_key": null,
    "total": "0"
  }
}
```

then we can see that there are two active validator `localtestnet` at the moment.

For the validator, we can see that it comes with an address and a public key:

- `"operator_address"` - The operator address, which is used for identifying the operators of validators;
- `"consensus_pubkey"` - The consensus public key, which is used for identifying the validator nodes participating in consensus.