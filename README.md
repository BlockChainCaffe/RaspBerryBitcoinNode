# RaspBerryBitcoinNode

Script e procedure per la realizzazione del nodo raspberry
Parte sistemistica

## I files :

  * **Procedura.sh** : file contenente tutti i comandi suddivisi in fasi per l'installazione del software necessario
  * **Comandi.sh**: esempi di comandi per far partire il nodo
  * **bitcoin.conf**: esempio di file di configurazione funzionante
  * **bitcoind.servive**: file di service utile a far partire il nodo in automatico

## Come usarli:
Potrebbe convenire fare il clone del progetto sul raspberry con:
```
git clone https://github.com/BlockChainCaffe/RaspBerryBitcoinNode.git
```
oppure scaricando il pacchetto zip dal pulsante in alto a destra su questa pagina

## Copia-incolla da altra macchina

Un'altra alternatica consiste nel connettersi in SSH al raspberry da un'altra macchina e usare quella per fare copia-incolla del testo sulla shell del raspberry

Per fare questo è necessario conoscere l'indirizzo IP del raspberry sulla vostra rete.
Per farlo potete lanciare da shell uno dei seguenti comandi:

```
ifconfig
```

oppure 

```
ip a
```

In alternativa potete cercare anche nella schermata di configurazione del vostro router di casa.

Ottenuto l'indirizzo IP si usa il comando SSH (o un tool come putty).
Il comando è:

```
ssh pi@<INDIRIZZO_IP>
```


