# Snapshot

## Introduction

{% hint style="info" %}
IMPORTANT

In order to use Snapshot you need to first complete [Step 3-2](./#step-3-2.-run-everything) with the latest binary.

\
{% endhint %}

Syncing Planq could be a time-consuming process, that's why the Planq Chain team has partnered with Chainlayer to provide the “**Snapshot**” service and make the process more efficient for our users.

Users can visit [Snapshot Planq page](https://polkachu.com/tendermint_snapshots/planq) and download the snapshots for Planq Chain with different pruning settings.

### Step 1: Snapshot Download

After executing the command `./planqd` start at [Step 3-2](./#step-3-2.-run-everything) Run everything, it starts the node and syncs the blockchain data. When you see it starts to sync from 0, you can terminate the terminal.

Users can visit [Snapshot Planq page](https://polkachu.com/tendermint_snapshots/planq) and download the snapshots for Planq Chain with different pruning settings. \
\
Both RocksDB and LevelDB snapshots are now available for Planq Chain.

### Step 2: Snapshot Extract

To start with Snapshot, you need to run `brew install lz4` to install lz4 in a new terminal.\
Then download the file with preferred pruning settings directly from [Snapshot](https://polkachu.com/tendermint_snapshots/planq).

**planq\_7070-2-pruned**

* Pruned snapshot is the quickest way to get a node running. If you just would like to give it a shot, use it for a validator or sentry node, the pruned snapshot will be a good choice. Pruned snapshots have tx index disabled to save disk/download size, which also will make API queries not work backward in time. If you still want to use a pruned snapshot to start an API node, then you can enable tx index on your end to start indexing blocks from when you startup your node. But you will not be able to query anything earlier than that.

**planq\_7070-2-default**

* Default is a good middle choice between everything. It will work in most use cases, validator, sentry node, API nodes. It has tx index enabled, so you can query block back in time. The only thing that default nodes do not have is the full history from the start of the chain or chain upgrade.

**planq\_7070-2-archive**

* For the users who would like to query the old block, you may pick the archive one for complete blockchain data. The archive node will have all the blocks from the chain start or chain upgrade with full indexing. So this is a good option for API nodes if you need to have access to the whole chain history. Archives grow fast in size and might be more sluggish to run, so if you need something simpler default or a pruned kickstarted API node might solve most of the needs out there.

### Step 3: Snapshot Setup

In the following steps, we will take as an example the version\
`planq_5976211.tar.lz4`.

* (Optional) you can [download an addressbook](https://raw.githubusercontent.com/planq-network/networks/main/mainnet/addrbook.json) to get connected to peers faster. After downloading it, place the new `addrbook.json` under `.planqd/config` folder and restart your node to take effect.
* Now add the `planq_5976211.tar.lz4` inside `.planqd`

Then perform the following steps:

* Change the path under `.planqd` with `cd .planqd`
* Decompress with `lz4` and `tar` by `lz4 -d /Users/<username>/.planqd/planq_5976211.tar.lz4 | tar -xv`, as below:

{% hint style="info" %}
Example: Decompress the QuickSync pack with `lz4`

```bash
  x data/
  x data/application.db/
  x data/application.db/84856034.ldb
  x data/application.db/83264153.ldb
  ...
  x data/snapshots/metadata.db/CURRENT.bak
  x data/snapshots/metadata.db/MANIFEST-000107
  x data/snapshots/metadata.db/LOG
```
{% endhint %}

The original data folder under `.planqd` is overwritten with this step (it takes around 5-7 mins to decompress the pruned version \~50GB).

### Step 4: Sync with Snapshot

{% hint style="info" %}
Example: Restart `planqd start` with QuickSync

```bash
  $ ./planqd start
  6:59PM INF Unlocking keyring
  6:59PM INF starting ABCI with Tendermint
  6:59PM INF Starting multiAppConn service impl=multiAppConn module=proxy server=node
  6:59PM INF Starting localClient service connection=query impl=localClient module=abci-client server=node
  ...
  6:59PM INF ABCI Replay Blocks appHeight=1813707 module=consensus server=node stateHeight=1813707 storeHeight=1813707
```
{% endhint %}
