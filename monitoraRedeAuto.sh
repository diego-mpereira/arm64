#!/bin/bash
# * * * * * sleep 10; sh ~/monitoraRede.sh    <<<<<<<<<<<<<<< inserir no `crontab -e`
echo "IP='api-order-sender.pedidos.vsd.appa'" >>~/monitoraRede.sh
echo "ping -c1 $IP 2>/dev/null 1>/dev/null" >>~/monitoraRede.sh
echo "if [ "$?" = 0 ]" >>~/monitoraRede.sh
echo "then" >>~/monitoraRede.sh
  echo "echo 'Host found'" >>~/monitoraRede.sh
echo "else" >>~/monitoraRede.sh
  echo "echo 'Host not found'" >>~/monitoraRede.sh
  echo "date >>/tmp/pedidosLog.log" >>~/monitoraRede.sh
  echo "echo 'erro ao conectar ao VS Pedidos' >>/tmp/pedidosLog.log" >>~/monitoraRede.sh
  echo "echo '____________________________________________________' >>/tmp/pedidosLog.log" >>~/monitoraRede.sh
  echo "while true; do ping -c1 api-order-sender.pedidos.vsd.app > /dev/null && break; done" >>~/monitoraRede.sh
  echo "echo 'conexão reestabelecida' >>/tmp/pedidosLog.log" >>~/monitoraRede.sh
  echo "date >>/tmp/pedidosLog.log" >>~/monitoraRede.sh
  echo "echo '____________________________________________________' >>/tmp/pedidosLog.log" >>~/monitoraRede.sh
echo "fi" >>~/monitoraRede.sh
chmod +x ~/monitoraRede.sh
line="* * * * * sleep 10; sh ~/monitoraRede.sh"
(crontab -u $(whoami) -l; echo "$line" ) | crontab -u $(whoami) -
