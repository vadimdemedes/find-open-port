#!/bin/bash

# generate a random number
# within a local port range
random_number () {
  local lowerPort=
  local upperPort=

  # read lower and upper port
  read lowerPort upperPort < /proc/sys/net/ipv4/ip_local_port_range

  # generate a random number within boundaries
  shuf -i "$lowerPort-$upperPort" -n 1
}

# check if any docker container
# is listening to a port
is_port_available () {
  local port="$1"

  docker ps | grep -c "0.0.0.0:$port"
}

# loop and echo first open port
for i in $(seq 1 30); do
  port=$(random_number)
  is_available=$(is_port_available "$port")

  if [ "$is_available" -eq 0 ]; then
    echo "$port"
    exit 0
  fi
done

echo "Could not find an open port"
exit 1
