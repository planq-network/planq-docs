---
meta:
  - name: title
    content: Planq | Planq EVM Chain | Running Nodes On Mainnet
  - name: description
    content: >-
      Learn how to setup a Validator or a full node on Planq Mainnet
      Beta planq_7070-2 in this technical documentation.
  - name: og:title
    content: Planq | Planq EVM Chain | Running Nodes On Mainnet
  - name: og:type
    content: Website
  - name: og:description
    content: >-
      Learn how to setup a Validator or a full node on Planq Mainnet
      Beta planq_7070-2 in this technical documentation.
  - name: og:image
    content: https://raw.githubusercontent.com/cosmos/chain-registry/master/planq/images/planq.png
  - name: twitter:title
    content: Planq | Planq EVM Chain | Running Nodes On Mainnet
  - name: twitter:site
    content: '@planqfoundation'
  - name: twitter:card
    content: summary_large_image
  - name: twitter:description
    content: >-
      Learn how to setup a Validator or a full node on Planq Mainnet
      Beta planq_7070-2 in this technical documentation.
  - name: twitter:image
    content: https://raw.githubusercontent.com/cosmos/chain-registry/master/planq/images/planq.png
canonicalUrl: https://docs.planq.network/getting-started/planq-mainnet.html
---

# Planq Mainnet

This is a detailed documentation for setting up a full node on Planq mainnet `planq_7070-2`.

## Pre-requisites

### Supported OS

We officially support macOS, Windows, and Linux only. Other platforms may work but there is no guarantee. We will extend our support to other operating systems after we have stabilised our current architecture.

### Prepare your machine

To run Planq Mainnet nodes, you will need a machine with the following minimum requirements to run different types of nodes:

* Pruned node (setting pruning=everything)&#x20;
  * Storage: \~25G\*&#x20;
  * RAM: 4 GB (LevelDB) or 64G RAM (RocksDB)\*\*\*&#x20;
  * CPU: 4-core
* Default full node (setting pruning=default)&#x20;
  * Storage: \~1.5T\*\*&#x20;
  * RAM: 4 GB (LevelDB) or 64G RAM (RocksDB)\*\*\*&#x20;
  * CPU: 4-core
* Archive node (setting pruning=nothing)&#x20;
  * Storage: \~2.8T\*\*&#x20;
  * RAM: 4 GB (LevelDB) or 64G RAM (RocksDB)\*\*\*&#x20;
  * CPU: 4-core

_\*Only in case state-sync enabled._ \
_\*\* e.g. Note that size of snapshots from Snapshot will keep growing._ \
_\*\*\* Note that during a state-sync the node might require higher RAM than 3GB but, returns to normal after state-sync has finished._

{% hint style="info" %}
Note that all depends on the type of node you are running and settings will vary depending on your usage.
{% endhint %}

{% tabs %}
{% tab title="Mainnet" %}
* [Seeds for Fullnode](https://raw.githubusercontent.com/planq-network/networks/main/mainnet/seeds.txt)
* [Genesis files](https://raw.githubusercontent.com/planq-network/networks/main/mainnet/genesis.json)
* Binaries for [Linux](https://github.com/planq-network/planq/releases/download/v1.0.8/planq_1.0.8_Linux_x86_64.tar.gz), Mac ([Intel x86](https://github.com/planq-network/planq/releases/download/v1.0.8/planq_1.0.8_Darwin_x86_64.tar.gz) / [M1](https://github.com/planq-network/planq/releases/download/v1.0.8/planq_1.0.8_Darwin_arm64.tar.gz)) and [Windows](https://github.com/planq-network/planq/releases/download/v1.0.8/planq_1.0.8_Windows_x86_64.zip)
{% endtab %}
{% endtabs %}

## Step 1. Get the Planq Mainnet binary

{% hint style="info" %}
Remarks:

The following is the minimal setup for a **validator node** / **full node**.
{% endhint %}

To simplify the following step, we will be using **Linux** (Intel x86) for illustration.\
Binaries for **Mac** ([Intel x86](https://github.com/planq-network/planq/releases/download/v1.0.8/planq_1.0.8_Darwin_x86_64.tar.gz) / [M1](https://github.com/planq-network/planq/releases/download/v1.0.8/planq_1.0.8_Darwin_arm64.tar.gz)) and [Windows](https://github.com/planq-network/planq/releases/download/v1.0.8/planq_1.0.8_Windows_x86_64.zip)

*   To install released **Planq Mainnet binaries** from github:

    ```bash
    $ curl -LOJ https://github.com/planq-network/planq/releases/download/v1.0.8/planq_1.0.8_Linux_x86_64.tar.gz
    $ tar -zxvf planq_1.0.8_Linux_x86_64.tar.gz
    ```

    Afterward, you can check the version of `planqd` by

    ```bash
    $ ./planqd version
    1.0.8
    ```

## Step 2. Configure `planqd`

### Step 2-0 (Optional) Clean up the old blockchain data

*   If you have joined `planq_7077-1` before, you would have to clean up the old blockchain data and start over again, it can be done by running:

    ```bash
    $ ./planqd tendermint unsafe-reset-all
    ```

    and remove the old genesis file by

    ```bash
    $ rm ~/.planqd/config/genesis.json
    ```

Before kick-starting your node, we will have to configure your node so that it connects to the Planq mainnet:

### Step 2-1 Initialize `planqd`

*   First of all, you can initialize planqd by:

    ```bash
      $ ./planqd init [moniker] --chain-id planq_7070-2
    ```

    This `moniker` will be the displayed id of your node when connected to Planq Chain network.

    When providing the moniker value, make sure you drop the square brackets since they are not needed. The example below shows how to initialize a node named `pegasus-node` :

    ```bash
      $ ./planqd init pegasus-node --chain-id planq_7070-2
    ```

{% hint style="info" %}
Note:

* Depending on your planqd home setting, the planqd configuration will be initialized to that home directory. To simply the following steps, we will use the default planqd home directory `~/.planqd/` for illustration.
* You can also put the `planqd` to your binary path and run it by `planqd`
{% endhint %}

### Step 2-2 Configure planqd

*   Download and replace the Planq Mainnet `genesis.json` by:

    ```bash
    $ curl https://raw.githubusercontent.com/planq-network/networks/main/mainnet/genesis.json > ~/.planqd/config/genesis.json
    ```
*   Verify sha256sum checksum of the downloaded `genesis.json`. You should see `OK!` if the sha256sum checksum matches.

    ```bash
    $ if [[ $(sha256sum ~/.planqd/config/genesis.json | awk '{print $1}') = "a4bca4e9d4de3ee747452aa5dcd80acebb6a69e99dd19b5ce0af1c6606d847f7" ]]; then echo "OK"; else echo "MISMATCHED"; fi;
    OK!
    ```

{% hint style="info" %}
NOTE

For Mac environment, `sha256sum` was not installed by default. In this case, you may setup `sha256sum` with this command:

```bash
function sha256sum() { shasum -a 256 "$@" ; } && export -f sha256sum
```
{% endhint %}

*   For network configuration, in `~/.planqd/config/config.toml`, validator nodes need to modify the configurations of `seed`, `create_empty_blocks_interval` and `timeout_commit`

    ```bash
    $ sed -i.bak -E 's#^(seeds[[:space:]]+=[[:space:]]+).*$#\1"dd2f0ceaa0b21491ecae17413b242d69916550ae@135.125.247.70:26656,0525de7e7640008d2a2e01d1a7f6456f28f3324c@51.79.142.6:26656,21432722b67540f6b366806dff295849738d7865@139.99.223.241:26656,7c10b1a106a512976e8d71effe5c086327458eef@35.200.183.35:26656,b76abe67188be594e17d6e25c7231b027c8bd324@34.175.12.246:26656"#' ~/.planqd/config/config.toml
    $ sed -i.bak -E 's#^(create_empty_blocks_interval[[:space:]]+=[[:space:]]+).*$#\1"5s"#' ~/.planqd/config/config.toml
    $ sed -i.bak -E 's#^(timeout_commit[[:space:]]+=[[:space:]]+).*$#\1"5s"#' ~/.planqd/config/config.toml
    ```
*   If you would like to build an **archive node** that allows you to query all the historical block data - kindly update the pruning setting to `"nothing"` by

    ```bash
    $ sed -i.bak -E 's#^(pruning[[:space:]]+=[[:space:]]+).*$#\1"nothing"#' ~/.planqd/config/app.toml
    ```

{% hint style="info" %}
NOTE

For Mac environment, if `jq` is missing, you may install it by: `brew install jq`
{% endhint %}

## Step 3. Run everything

{% hint style="warning" %}
CAUTION

This page only shows the minimal setup for validator / full node.

Furthermore, you may want to run full nodes as sentries (see [Tendermint](https://docs.tendermint.com/master/tendermint-core/running-in-production.html)), restrict your validator connections to only connect to your full nodes, test secure storage of validator keys etc.
{% endhint %}



Once `planqd` has been configured, we are ready to start the ode and sync the blockchain data:

* Start planqd, e.g.:

```bash
  $ ./planqd start
```

{% hint style="info" %}
Remarks:

If you see errors saying `too many files opened...`, then you need to set a higher number for maximum open file descriptors in your OS.

If you are on OSX or Linux, then the following could be useful:

```bash
# Check current max fd
$ ulimit -n

# Set a new max fd
$ ulimit -Sn [NEW_MAX_FILE_DESCRIPTOR]

# Example
$ ulimit -Sn 4096
```
{% endhint %}

* _(Optional for Linux)_ Start planqd with systemd service, e.g.:

```bash
  $ curl -s https://raw.githubusercontent.com/planq-network/planq-docs/master/systemd/create-service.sh -o create-service.sh && curl -s https://raw.githubusercontent.com/planq-network/planq-docs/master/systemd/planqd.service.template -o planqd.service.template

  $ chmod +x ./create-service.sh && ./create-service.sh

  $ sudo systemctl start planqd

  # view log

  $ journalctl -u planqd -f
```

{% hint style="info" %}
Example: /etc/systemd/system/planqd.service created by script

```bash
# /etc/systemd/system/planqd.service

[Unit]
Description=planqd
ConditionPathExists=/usr/local/bin/planqd
After=network.target


[Service]
Type=simple
User=ubuntu
WorkingDirectory=/usr/local/bin
ExecStart=/usr/local/bin/planqd start --home /home/ubuntu/.planqd
Restart=on-failure
RestartSec=10
LimitNOFILE=50000


[Install]
WantedBy=multi-user.target
```
{% endhint %}

It should begin fetching blocks from the other peers.

*   You can query the node syncing status by

    ```bash
    $ ./planqd status 2>&1 | jq '.SyncInfo.catching_up'
    ```

    If the above command returns `false`, It means that your node **is fully synced**; otherwise, it returns `true` and implies your node is still catching up.
*   One can check the current block height by querying the public full node by:

    ```bash
    curl -s https://rpc.planqd.org/commit | jq "{height: .result.signed_header.header.height}"
    ```

    and you can check your node's progress (in terms of block height) by

    ```bash
    $ ./planqd status 2>&1 | jq '.SyncInfo.latest_block_height'
    ```
