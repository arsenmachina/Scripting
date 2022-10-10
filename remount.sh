Клиент всячески отрицал что купил б/у nas и что диски отлетают по вине нашего софта, пришлось написать скрипт коорый детектит отвалившиеся раздел и маунтит обратно
Таких костылей у меня давольно много, но не по причине плохого софта(хотя не без этого) а по необходимост))


#!/bin/bash



date_msb=`date +"%H:%M %d/%m/%Y"`
for ((i=5;i<9;i++))
do

tmp_var=`mount -l | grep storage_$i | awk '{print $6}' | awk -F "," '{print $1}' | sed 's/^.//'`

  if [[ "$tmp_var" == "rw" ]]; then 
    echo "storage $i in $date_msb have good permissions =  $tmp_var" >> /home/packages/log_mount
  elif [[ "$tmp_var" == "ro" ]]; then
    echo "storage $i in $date_msb have WRONG permissions = $tmp_var" >> /home/packages/log_mount
    umount /home/telebreeze/media/vod/storage_5
    umount /home/telebreeze/media/vod/storage_6
    umount /home/telebreeze/media/vod/storage_7
    umount /home/telebreeze/media/vod/storage_8
    mount -a
    echo "success remount! problem in $date_msb for storage: $i" >> /home/packages/log_mount
  else 
    echo "exception perms for storage $i = $tmp_var at time: $date_msb" >> /home/packages/log_mount
  fi

done
echo -e "\n" >> /home/packages/log_mount

