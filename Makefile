NAME=cloud-1
INVENTORY_FILE=inventory.ini

$(NAME):
	ansible-playbook -i $(INVENTORY_FILE) main.yml

start:
	ansible servers -i $(INVENTORY_FILE) -m shell -a "cd /home/cloud-1/data/Inception/srcs && docker compose up -d --build"

stop:
	ansible servers -i $(INVENTORY_FILE) -m shell -a "cd /home/cloud-1/data/Inception/srcs && docker compose stop"

reboot:
	ansible servers -i $(INVENTORY_FILE) -m reboot -a reboot_timeout=3600 -b