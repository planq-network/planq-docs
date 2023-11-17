---
meta:
  - name: title
    content: Planq | planqd
  - name: description
    content: >-
      planqd is the all-in-one command-line interface. It supports wallet
      management, funds transfer and staking operations.
  - name: og:title
    content: Planq | planqd
  - name: og:type
    content: Website
  - name: og:description
    content: >-
      planqd is the all-in-one command-line interface. It supports wallet
      management, funds transfer and staking operations.
  - name: og:image
    content: https://raw.githubusercontent.com/cosmos/chain-registry/master/planq/images/planq.png
  - name: twitter:title
    content: Planq | planqd
  - name: twitter:site
    content: '@planqfoundation'
  - name: twitter:card
    content: summary_large_image
  - name: twitter:description
    content: >-
      planqd is the all-in-one command-line interface. It supports wallet
      management, funds transfer and staking operations.
  - name: twitter:image
    content: https://raw.githubusercontent.com/cosmos/chain-registry/master/planq/images/planq.png
canonicalUrl: https://docs.planq.network/wallets/cli.html
---

# Planqd

`planqd` is an all-in-one command-line interface. It supports wallet management, funds transfers and staking operations.

## Build and configurations

### Build Prerequisites

* You can get the latest `planqd` binary here from the [release page](https://github.com/planq-network/planq/releases);

### Using `planqd`

`planqd`is bundled with the Planq Chain code. After you have obtained the latest `planqd` binary, run

```bash
$ planqd [command]
```

There is also a `-h, --help` command available

```bash
$ planqd -h
```

### Config and data directory

By default, your configuration and data are stored in the folder located in the `~/.planqd` directory.\
\
Ensure that you have backed up your wallet after creating it. Otherwise, your funds may be inaccessible in the event of an accident.

#### Configure planqd config and data directory

To specify the planqd config and data storage directory; you can add a global flag `--home <directory>`

## Configuration Setting

We can view the default config setting by using `planqd config` command:

```bash
$ planqd config
{
	"chain-id": "",
	"keyring-backend": "os",
	"output": "text",
	"node": "tcp://localhost:26657",
	"broadcast-mode": "sync"
}
```

We can make changes to the default settings upon our choices, so it allows users to set the configuration beforehand all at once, so it would be ready with the same config afterward.

For example, the `chain-id` can be changed to `planq_7077-1` from a blank name by

```bash
$ planqd config "chain-id" planq_7077-1
$ planqd config
{
	"chain-id": "planq_7077-1",
	"keyring-backend": "os",
	"output": "text",
	"node": "tcp://localhost:26657",
	"broadcast-mode": "sync"
}
```

Other values can be changed in the same way.

Alternatively, we can directly make the changes to the config values in one place at client.toml. It is under the path of `.ethermint/config/client.toml` in the folder where we installed ethermint:

```bash
############################################################################
###                         Client Configuration                         ###
############################################################################

# The network chain ID
chain-id = "planq_7077-1"
# The keyring's backend, where the keys are stored (os|file|kwallet|pass|test|memory)
keyring-backend = "os"
# CLI output format (text|json)
output = "number"
# <host>:<port> to Tendermint RPC interface for this chain
node = "tcp://localhost:26657"
# Transaction broadcasting mode (sync|async|block)
broadcast-mode = "sync"
```

After the necessary changes are made in the `client.toml`, then save. For example, if we directly change the `chain-id` from `ethermint0` to ethermint-test1, and output to number, it would change instantly as shown below.

```bash
$ planqd config
{
	"chain-id": "ethermint-test1",
	"keyring-backend": "os",
	"output": "number",
	"node": "tcp://localhost:26657",
	"broadcast-mode": "sync"
}
```

### Options

A list of commonly used flags of planqd is listed below:

| Option              | Description                   | Type         | Default Value |
| ------------------- | ----------------------------- | ------------ | ------------- |
| `--home`            | Directory for config and data | string       | `~/.planqd`   |
| `--chain-id`        | Full Chain ID                 | String       | ---           |
| `--output`          | Output format                 | string       | "text"        |
| `--keyring-backend` | Select keyring's backend      | os/file/test | os            |

## Command list

A list of commonly used `planqd` commands.

<table><thead><tr><th width="185.33333333333331">Command</th><th width="270">Description</th><th>List</th></tr></thead><tbody><tr><td><code>keys</code></td><td><a href="cli.md#keys-management-planqd-keys">Key management</a></td><td><a href="cli.md#keys-add-wallet-name-create-a-new-key"><code>add &#x3C;wallet_name></code></a><br><br><a href="cli.md#keys-add-key-name-recover-restore-existing-key-by-seed-phrase"><code>add &#x3C;key_name> --recover</code></a><br><br><a href="cli.md#keys-list-list-your-keys"><code>list</code></a><br><br><a href="cli.md#keys-show-key-name-retrieve-key-information"><code>show &#x3C;key_name></code></a><br><br><a href="cli.md#keys-delete-key-name-delete-a-key"><code>delete &#x3C;key_name></code></a><br><br><a href="cli.md#keys-export-key-name-export-private-keys"><code>export &#x3C;key_name></code></a></td></tr><tr><td><code>tx</code></td><td><a href="cli.md#transactions-subcommands-planqd-tx">Transaction subcommands</a></td><td><a href="cli.md#tx-bank-send-transfer-operation"><code>bank send</code></a><br><br><a href="cli.md#delegate-you-funds-to-a-validator-tx-staking-delegate-validator-addr-amount"><code>staking delegate</code></a><br><br><a href="cli.md#unbond-your-delegated-funds-tx-staking-unbond-validator-addr-amount"><code>staking unbond</code></a><br><br><a href="cli.md#tx-staking-create-validator-joining-the-network-as-a-validator"><code>staking create-validator</code></a><br><br><a href="cli.md#tx-slashing-unjail-unjail-a-validator"><code>slashing unjail</code></a></td></tr><tr><td><code>query</code></td><td><a href="cli.md#balance-and-transaction-history">Query subcommands</a></td><td><a href="cli.md#query-bank-balances-check-your-transferable-balance"><code>query bank balance</code></a></td></tr></tbody></table>

You may also add the flag `-h, --help` on `planqd [command]` to get more available commands and details.

{% hint style="info" %}
Example: More details of subcommand - tx staking

```bash
$ planqd tx staking --help
Staking transaction subcommands

Usage:
  planqd tx staking [flags]
  planqd tx staking [command]

Available Commands:
  create-validator create new validator initialized with a self-delegation to it
  delegate         Delegate liquid tokens to a validator
  edit-validator   edit an existing validator account
  redelegate       Redelegate illiquid tokens from one validator to another
  unbond           Unbond shares from a validator

Flags:
  -h, --help   help for staking

Global Flags:
      --chain-id string     The network chain ID
      --home string         directory for config and data (default "/Users/.planqd")
      --log_format string   The logging format (json|plain) (default "plain")
      --log_level string    The logging level (trace|debug|info|warn|error|fatal|panic) (default "info")
      --trace
```
{% endhint %}

## Key management - `planqd keys`

First of all, you will need an address to store and spend your PLQ.

### `keys add <wallet_name>` - Create a new key

You can create a new key with the name `Default` as in the following example:

{% hint style="info" %}
Example: Create a new address

```bash
$ planqd keys add Default
- name: Default
  type: local
  address: plq1c47uszfujup3ax0d5p4ges3pxa4ne9zqc20pgf
  pubkey: '{"@type":"/ethermint.crypto.v1alpha1.ethsecp256k1.PubKey","key":"A4KKhRCbnMr3mSqBfeeMPp3svRlPhnKlmxh6MmZ+AoR5"}'
  mnemonic: ""


**Important** write this mnemonic phrase in a safe place.
It is the only way to recover your account if you ever forget your password.

farm surround surround hunt shop glory fringe bag mountain clerk arch ankle announce turtle slide brisk carbon album immense drop example speed grain dutch
```
{% endhint %}

The key comes with a "mnemonic phrase", which is serialized into a human-readable 24-word mnemonic. User can recover their associated addresses with the mnemonic phrase.

{% hint style="danger" %}
It is important that you keep the mnemonic for address secure, as there is **no way** to recover it. You would not be able to recover and access the funds in the wallet if you forget the mnemonic phrase.
{% endhint %}

### `keys add <key_name> --recover` - Restore existing key by seed phrase

You can restore an existing key with the mnemonic.

{% hint style="info" %}
Example: Restore an existing key

```bash
$ planqd keys add Default_restore --recover
> Enter your bip39 mnemonic
## Enter your 24-word mnemonic here ##
```
{% endhint %}

### `keys list` - List your keys

Multiple keys can be created when needed. You can list all keys saved under the storage path.

{% hint style="info" %}
Example: List all of your keys

```bash
$ planqd keys list
    - name: Default
    type: local
    address: ## Address of "Default" ##
    pubkey: ## Pubkey of "Default" ##
    mnemonic: ""
    threshold: 0
    pubkeys: []
  - name: Default_restore
    type: local
    address: ## Address of "Default_restore" ##
    pubkey: ## Pubkey of "Default_restore" ##
    mnemonic: ""
    threshold: 0
    pubkeys: []
```
{% endhint %}

### `keys show <key_name>` - Retrieve key information

You can retrieve key information by its name:

{% hint style="info" %}
Example: Retrieve key information - Account Address and its public key

```bash
$ planqd keys show mykey --bech acc
- name: mykey
  type: local
  address: plq1c47uszfujup3ax0d5p4ges3pxa4ne9zqc20pgf
  pubkey: '{"@type":"/ethermint.crypto.v1alpha1.ethsecp256k1.PubKey","key":"A4KKhRCbnMr3mSqBfeeMPp3svRlPhnKlmxh6MmZ+AoR5"}'
  mnemonic: ""
```
{% endhint %}

{% hint style="info" %}
Example: Retrieve key information - Validator Address and its public key

```bash
$ planqd keys show Default --bech val
$ planqd keys show test --bech val
- name: mykey
  type: local
  address: plqvaloper1c47uszfujup3ax0d5p4ges3pxa4ne9zqx5zmwc
  pubkey: '{"@type":"/ethermint.crypto.v1alpha1.ethsecp256k1.PubKey","key":"A4KKhRCbnMr3mSqBfeeMPp3svRlPhnKlmxh6MmZ+AoR5"}'
  mnemonic: ""
```
{% endhint %}

{% hint style="info" %}
Example: Retrieve key information - Consensus nodes Address and its public key

```bash
$ planqd keys show Default --bech cons
$ planqd keys show test --bech cons
- name: mykey
  type: local
  address: plqvalcons1c47uszfujup3ax0d5p4ges3pxa4ne9zqj838ze
  pubkey: '{"@type":"/ethermint.crypto.v1alpha1.ethsecp256k1.PubKey","key":"A4KKhRCbnMr3mSqBfeeMPp3svRlPhnKlmxh6MmZ+AoR5"}'
  mnemonic: ""
```
{% endhint %}

### `keys delete <key_name>` - Delete a key

You can delete a key in your storage path.

{% hint style="danger" %}
Make sure you have backed up the key mnemonic before removing any of your keys, as there will be no way to recover your key without the mnemonic.
{% endhint %}

{% hint style="info" %}
Example: Remove a key

```bash
$ planqd keys delete Default_restore1
Key reference will be deleted. Continue? [y/N]: y
Key deleted forever (uh oh!)
```
{% endhint %}

### `keys export <key_name>` - Export private keys

You can export and backup your key by using the `export` subcommand:

{% hint style="info" %}
Example: Export your keys Exporting the key _Default_ :

```bash
$ planqd keys export Default
Enter passphrase to encrypt the exported key: ## Insert passphrase (must be at least 8 characters)##
-----BEGIN TENDERMINT PRIVATE KEY-----
kdf: bcrypt
salt: ## Salt of the key ##
type: secp256k1

## Tendermint private key ##
-----END TENDERMINT PRIVATE KEY-----
```
{% endhint %}

### The keyring `--keyring-backend` option

Interacting with a node requires a public-private key pair. Keyring is the place holding the keys. The keys can be stored in different locations with specified backend type.

```bash
$ planqd keys [subcommands] --keyring-backend [backend type]
```

#### `1. os` backend

The default `os` backend stores the keys in operating system's credential sub-system, which are comfortable to most users, yet without compromising on security.

Here is a list of the corresponding password managers in different operating systems:

* macOS (since Mac OS 8.6): [Keychain](https://support.apple.com/en-gb/guide/keychain-access/welcome/mac)
* Windows: [Credentials Management API](https://docs.microsoft.com/en-us/windows/win32/secauthn/credentials-management)
* GNU/Linux:
  * [libsecret](https://gitlab.gnome.org/GNOME/libsecret)
  * [kwallet](https://api.kde.org/frameworks/kwallet/html/index.html)

#### `2. file` backend

The `file` backend stores the encrypted keys inside the app's configuration directory. A password entry is required every time a user access it, which may also occur multiple times of repeated password prompts in one single command.

#### `3. test` backend

The `test` backend is a password-less variation of the `file` backend. It stores unencrypted keys inside the app's configuration directory. It should only be used in testing environments and never be used in production.

## Transaction subcommands - `planqd tx`

### `tx bank send` - Transfer operation

Transfer operation involves the transfer of tokens between two addresses.

#### **Send Funds** \[`tx bank send <from_key_or_address> <to_address> <amount> <network_id>`]

{% hint style="info" %}
Example: Send 10tcro from one address to another.

```bash
$ planqd tx bank send Default plq1c47uszfujup3ax0d5p4ges3pxa4ne9zqc20pgf 10plq --chain-id planq_7070-2
  ## Transaction payload##
  {"body":{"messages":[{"@type":"/cosmos.bank.v1beta1.MsgSend","from_address"....}
confirm transaction before signing and broadcasting [y/N]: y
```
{% endhint %}

### `tx staking` - Staking operations

Staking operations involve the interaction between an address and a validator. It allows you to create a validator and lock/unlocking funds for staking purposes.

#### **Delegate your funds to a validator** \[`tx staking delegate <validator-addr> <amount>`]

To bond funds for staking, you can delegate funds to a validator by the `delegate` command

{% hint style="info" %}
Example: Delegate funds from `mykey` to a validator under the address `ethvaloper...lq`

```bash
$ planqd tx staking delegate plqvaloper1c47uszfujup3ax0d5p4ges3pxa4ne9zqx5zmwc 100plq --from mykey --chain-id planq_7070-2
## Transactions payload##
{"body":{"messages":[{"@type":"/cosmos.staking.v1beta1.MsgDelegate"....}
confirm transaction before signing and broadcasting [y/N]: y
```
{% endhint %}

#### **Unbond your delegated funds** \[`tx staking unbond <validator-addr> <amount>`]

On the other hand, we can create a `Unbond` transaction to unbond the delegated funds

{% hint style="info" %}
Example: Unbond funds from a validator under the address `ethvaloper...lq`

```bash
$ planqd tx staking unbond plqvaloper1c47uszfujup3ax0d5p4ges3pxa4ne9zqx5zmwc 100plq --from mykey --chain-id planq_7070-2
## Transaction payload##
{"body":{"messages":[{"@type":"/cosmos.staking.v1beta1.MsgUndelegate"...}
confirm transaction before signing and broadcasting [y/N]: y
```
{% endhint %}

{% hint style="info" %}
Once your funds are unbonded, it will be locked until the`unbonding_time`has passed.
{% endhint %}

## Balance & transaction history - planqd query

### `query bank balances` - Check your transferable balance

You can check your _transferable_ balance with the `balances` command under the bank module.

{% hint style="info" %}
Example: Check your address balance

```bash
$ planqd query bank balances plq1c47uszfujup3ax0d5p4ges3pxa4ne9zqc20pgf --output json | jq

{
  "balances": [
    {
      "denom": "aplanq",
      "amount": "99999000000000000000000000"
    }
  ],
  "pagination": {
    "next_key": null,
    "total": "0"
  }
}
```
{% endhint %}

## Advanced operations and transactions

### rollback

To recover from an app-hash mismatch failure, it would take hours to re-run an archive node, \
a faster way to do it as of planqd v1.0.2 would be to use `rollback`.

<pre class="language-bash"><code class="lang-bash">planqd rollback
//rollback example at current height 6569206
Rolled back state to height <a data-footnote-ref href="#user-content-fn-1">6569205</a> and hash 5BFA3A9FA0C207B83D327330ADE77C46A5E688A24864614843C743FDFD968BCD%
</code></pre>



### index-eth-tx

{% hint style="danger" %}
Only use this command if you are solely using evm-level queries as evm JSON-RPC queries will remain available after re-indexing, however cosmos-level tx will not be available anymore. For example, this will no longer be possible: [https://rpc.planq.network/tx\_search?query=\_\&prove=\_\&page=\_\&per\_page=\_\&order\_by=\_](https://rpc.planq.network/tx\_search?query=\_\&prove=\_\&page=\_\&per\_page=\_\&order\_by=\_)
{% endhint %}

After `v1.0.2` nodes can now enable the custom transaction indexer to reduce disk size. \
The custom tx indexer can be enabled in `app.toml` by setting the `json-rpc.enable-indexer` to `true`. Usually, you will want to re-index previous indexed blocks by using the `--backward` field, e.g.:

```bash
planqd index-eth-tx backward
```

After running the re-index command you will notice in your `.planqd/data/` directory a new file called `evmindexer.db` from which you can see that the size is smaller than the original `tx_index.db` . You can now safely remove the `tx_index.db`file.



### `tx staking create-validator` - Joining the network as a validator

Anyone who wishes to become a validator can submit a `create-validator` transaction by

```bash
$ planqd tx staking create-validator [flags]
```

{% hint style="info" %}
Example: Joining the network as a validator

```bash
$ planqd tx staking create-validator \
  --amount=1000000aplanq \
  --pubkey=$(planqd tendermint show-validator) \
  --moniker="choose a moniker" \
  --chain-id=<chain_id> \
  --commission-rate="0.05" \
  --commission-max-rate="0.10" \
  --commission-max-change-rate="0.01" \
  --min-self-delegation="1000000" \
  --gas="1000000" \
  --gas-prices="30000000000aplanq" \
  --gas-adjustment="1.15" \
  --from=<key_name>
## Transactions payload##
{"body":{"messages":[{"@type":"/cosmos.staking.v1beta1.MsgCreateValidator"...}
confirm transaction before signing and broadcasting [y/N]: y
```
{% endhint %}

(TODO: details of each flag )

### `tx slashing unjail` - Unjail a validator

Validator could be punished and jailed due to network misbehaviour, for example, if we check the validator set:

```bash
$ planqd query staking validators -o json | jq
................................
    "operator_address": "plqvaloper1c47uszfujup3ax0d5p4ges3pxa4ne9zqx5zmwc",
    "consensus_pubkey": {
        "@type": "/cosmos.crypto.ed25519.PubKey",
        "key": "fD6cWVYv5rsNbXDw3hVIbB3nd9x57HsTyeMgwmH472U="
    },
    "jailed": false,
    "status": "BOND_STATUS_BONDED",
................................
```

After the jailing period has passed, one can broadcast a `unjail` transaction to unjail the validator and resume its normal operations by

```bash
$ planqd tx slashing unjail --from node1 --chain-id planq_7070-1
  {"body":{"messages":[{"@type":"/cosmos.slashing.v1beta1.MsgUnjail"...}]}
  confirm transaction before signing and broadcasting [y/N]: y
```

[^1]: 
