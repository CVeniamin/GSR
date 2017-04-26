# GSR

Para apenas fazer `lstart` de uma pequena parte da rede (por exemplo servidores privados) é possível usando:

`$ lstart routerSede switchPrivado monitor fileServer`

**Test slave server**

`dig @10.0.2.82 -t SOA contatudo.gsr +norecurs`

**Test MRTG**

Start de routerSede, routerISP, switchPrivado e monitor:

`lstart routerSede routerISP switchPrivado monitor`

Abrir o browser e ir para [http://192.168.100.2/](http://192.168.100.2/) 
