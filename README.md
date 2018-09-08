# docker-unbound

This is a docker container that implements unbound on the local host. By default, it listens for queries on 127.0.0.1#3535 so you can run it on your pihole host and have it as the upstream server. Unbound will traverse authoritative nameservers to find the answer to queries, as well as maintain a cache.

I chose port 3535 because 5353 would be preferred but it conflicts with Avahi on the docker host and I still want that to run.

# How To Use:

One-off: `docker run -d -p 3535:3535/udp airbornelamb/pihole-unbound` and then input `127.0.0.1#3535` as your pihole upstream DNS provider

In a swarm stack: Checkout my full pihole-unbound config here https://raw.githubusercontent.com/airbornelamb/rpi/master/pihole-stack.yml
