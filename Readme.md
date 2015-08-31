# find-open-port

Find an open port for a new Docker container.


### Supported platforms

- CoreOS


### Installation

Copy `find_open_port.sh` and include it in a bash script.

```bash
source find_open_port.sh
```


### Usage

```bash
open_port=$(find_open_port)

echo "Open port: $open_port"
```


### License

MIT © [Vadym Demedes](http://vadimdemedes.com)
