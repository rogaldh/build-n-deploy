# How to add swap

1. Check if swap exists and available space for it
```
$ free -m
$ df -h
```

2. Create swapfile
```
$ sudo fallocate -l 2G /swapfile
$ sudo chmod 600 /swapfile
```

3. Setup swapfile
```
$ sudo mkswap /swapfile
# Enable
$ sudo swapon /swapfile
# Check if everything is ok
$ free -m
# Make it permanent (paste `/swapfile   none    swap    sw    0   0` to the end of file)
$ sudo nano /etc/fstab
```

## Refs
- [Link](https://www.digitalocean.com/community/tutorials/how-to-add-swap-on-ubuntu-14-04)