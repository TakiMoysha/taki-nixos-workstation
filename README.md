# Installation

```shell
cd ~
git clone <this-repository>
```

Copy `hardware-configuration.nix`, file unique for pc.

```shell
sudo rm -rf /etc/nixos
sudo ln -sf <this-repository> /etc/nixos
```

Write you params in:
 - ./network.nix


Rebuild system

```shell
sudo nixos-rebuild switch
```

# References

1. [emptyflask / nixconfig / github.com](https://github.com/emptyflask/nixconfig)
2. [smravec / nixos / github.com](https://github.com/smravec/nixos)
