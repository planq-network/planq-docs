# State-sync

## Pre-requisites

### Supported OS

Linux x86\_64 is confirmed to work. Other platforms may work but there is no guarantee. We will extend our support to other operating systems after we have stabilised our current architecture.

### Prepare your machine

To run Planq Mainnet nodes, you will need a machine with the following minimum requirements:

* 4-core, x86\_64 / ARM architecture processor
* 16 GB RAM
* 1 TB of storage space.

## Introduction

The fastest way to get a node synced to the latest block-height, is by using [State-sync](https://docs.tendermint.com/v0.34/tendermint-core/state-sync.html). With state-sync your node downloads a data snapshot near the head of the chain and verifies this data. This leads to drastically shorter times to join the network.

Keep in mind that the blocks before state-sync trust height will not be queryable. \
So, in order to run a full node, it is better not to use state-sync, but use [Snapshot](quicksync.md)'s archive snapshot instead.&#x20;

{% hint style="info" %}
IMPORTANT

State-sync depends on the ability to pull a snapshot from its persistent-peers, so there is some amount of timing and luck involved with this method. Although it is the fastest way, it is not always going to work, in case state-sync is not syncing, we recommend using [quicksync](quicksync.md), although it takes a longer time to download the snapshot, this method is more guaranteed to work.
{% endhint %}

## Step 1. Get the latest planqd binary

{% hint style="info" %}
The latest Planqd [version](https://github.com/planq-network/planq/releases) release is `planqd v1.0.9`
{% endhint %}

* Install the **Planq Mainnet** binaries from GitHub:

<pre class="language-bash"><code class="lang-bash"><strong>curl -LOJ https://github.com/planq-network/planq/releases/download/v1.0.8/planq_1.0.8_Linux_x86_64.tar.gz
</strong>tar -zxvf planq_1.0.8_Linux_x86_64.tar.gz
</code></pre>

* Check that **`planqd`** is effectively installed:

```bash
./bin/planqd version
1.0.9
```



## Step 2. Configure planqd

* Initialize **planqd.** Replace the **\[moniker]** with an ID for your node. &#x20;

```bash
./bin/planqd init [moniker] --chain-id planq_7070-2
```

* Download and replace the Planq Mainnet `genesis.json` by:

```bash
curl https://raw.githubusercontent.com/planq-network/networks/main/mainnet/genesis.json > ~/.planqd/config/genesis.json
```

* Verify the sha256sum checksum of the`genesis.json`. You should see `OK!` if the sha256sum checksum matches.

```bash
if [[ $(sha256sum ~/.planqd/config/genesis.json | awk '{print $1}') = "a4bca4e9d4de3ee747452aa5dcd80acebb6a69e99dd19b5ce0af1c6606d847f7" ]]; then echo "OK"; else echo "MISMATCHED"; fi;
OK!
```

* Replace the following parameters in the `~/.planqd/config/config.toml` file, by executing:

```bash
LATEST_HEIGHT=$(curl -s https://rpc.planq.network/block | jq -r .result.block.header.height); \
BLOCK_HEIGHT=$((LATEST_HEIGHT - 1000)); \
TRUST_HASH=$(curl -s "https://rpc.planq.network/block?height=$BLOCK_HEIGHT" | jq -r .result.block_id.hash)

sed -i.bak -E "s|^(enable[[:space:]]+=[[:space:]]+).*$|\1true| ; \
s|^(rpc_servers[[:space:]]+=[[:space:]]+).*$|\1\"https://rpc.planq.network,https://rpc.planq.network\"| ; \
s|^(trust_height[[:space:]]+=[[:space:]]+).*$|\1$BLOCK_HEIGHT| ; \
s|^(trust_hash[[:space:]]+=[[:space:]]+).*$|\1\"$TRUST_HASH\"| ; \
s|^(seeds[[:space:]]+=[[:space:]]+).*$|\1\"\"|" ~/.planqd/config/config.toml
```

## Step 3. Run everything

* Now that `planqd` has been configured, we are ready to start the node:

```bash
./bin/planqd start

1:40AM INF Unlocking keyring
1:40AM INF starting ABCI with Tendermint
1:40AM INF service start impl=multiAppConn module=proxy msg={} server=node
1:40AM INF service start connection=query impl=localClient module=abci-client msg={} server=node
1:40AM INF service start connection=snapshot impl=localClient module=abci-client msg={} server=node
1:40AM INF service start connection=mempool impl=localClient module=abci-client msg={} server=node
1:40AM INF service start connection=consensus impl=localClient module=abci-client msg={} server=node
1:40AM INF service start impl=EventBus module=events msg={} server=node
1:40AM INF service start impl=PubSub module=pubsub msg={} server=node
1:40AM INF service start impl=IndexerService module=txindex msg={} server=node
1:40AM INF Version info block=11 p2p=8 server=node tendermint_version=0.34.20
1:40AM INF This node is not a validator addr=DB03363D854BA491F280177BE33DE527F7542094 module=consensus pubKey=/L3Qe1oaNfrDael3QAmILSz5bLre9NAmKd48wd4eW8w= server=node
1:40AM INF P2P Node ID ID=d799c596250f27b5435775fdabb86d469dc5a784 file=/home/ubuntu/.planqd/config/node_key.json module=p2p server=node
1:40AM INF Adding persistent peers
```

This will take a couple of minutes, if your node manages to state-sync, you should see that snapshot chunks are being downloaded, and your node starts signing blocks.

To check the current node syncing status:

```bash
./bin/planqd status 2>&1 | jq '.SyncInfo.catching_up'
```



That's it! You are now running a synced node on **Planq Mainnet**!
