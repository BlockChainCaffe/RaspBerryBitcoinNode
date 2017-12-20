#
# Procedura di installazione di un nodo bitcoin core
#
# Usare i comandi sottostanti come root
#
# NB: meglio NON usarlo come script ma lanciare le sezioni
# una ad una ed osservare l'output finale di un blocco 
# prima di passare a successivo
#


### Update generale

  sudo apt-get update
  sudo apt-get upgrade -y


### Installazione dipendenze

  sudo apt-get install -y build-essential autoconf libssl-dev \
  		libboost-dev libboost-chrono-dev libboost-filesystem-dev \
  		libboost-program-options-dev libboost-test-dev libboost-thread-dev \
  		libboost-system-dev libtool libminiupnpc-dev libevent-dev \
  		git \
  		qt4-dev-tools libprotobuf-dev protobuf-compiler libqrencode-dev


### Installazione disco

	# Col disco USB NON connesso:
	mkdir /opt/bitcoinData
	sudo nano /etc/fstab	
	# aggiungere la riga sottostante al file
	# /dev/sda1	/opt/bitcoinData	ext4	defaults	0	0

	# Connettere il disco: formattazione ed aggiunta
	mkfs ext4 /dev/sda1
	mount -a

	# Verifica:
	df -h
	# deve comparire una riga simile a:
	# /dev/sdb1       'XG'  '0'    'X'G  1% /opt/bitcoinData



### Ampliamento swap
	
	nano /etc/dphys-swapfile
	# portare CONF_SWAPSIZE=100  --> CONF_SWAPSIZE=1000
	dphys-swapfile setup
	dphys-swapfile swapon


### Installare e compilare Berkeley-DB (per il wallet locale)

	cd /opt
	wget http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz
	tar -xzvf db-4.8.30.NC.tar.gz
	cd db-4.8.30.NC/build_unix/
	../dist/configure --enable-cxx
	make 
	make install
	make clean


### Installare e compilare Bitcoin Core

	cd opt
	git clone https://github.com/bitcoin/bitcoin.git
	cd bitcoin/
	./autogen.sh
	./configure CPPFLAGS="-I/usr/local/BerkeleyDB.4.8/include -O2" LDFLAGS="-L/usr/local/BerkeleyDB.4.8/lib" --disable-wallet  --with-gui
	make
	make install
	make clean


