Cassandra in Docker
===

This repository provides everything you need to run Cassandra in Docker, and is tuned for fast
container startup.

Why?
---
While naive Cassandra images take around 30 seconds to start, our containers take only a few seconds.
Optimizations include:

* Disabling vnodes. We don't use them at Spotify, and Cassandra starts much faster without them
  (~10 sec).
* Disabling something called "waiting for gossip to settle down" because there is no gossip in a
  one-node cluster (another ~10 sec).

In the box
---
* **cassandra-singlenode:** This is probably the image you want, it runs a one-node Cassandra cluster.

Notes
---
Things are still under heavy development:
* Only Cassandra 2.0 with almost-generic config (miles away from what we actually run Cassandra
  with) is supported so far.
* There's nothing to help you with tokens and stuff.
