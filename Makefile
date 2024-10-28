NAME=cloud-1
INVENTORY_FILE=inventory.ini

$(NAME):
	ansible-playbook -i $(INVENTORY_FILE) main.yml

start:
	ansible servers -i $(INVENTORY_FILE) -m shell -a "cd ~/data/Inception && make"

stop:
	ansible servers -i $(INVENTORY_FILE) -m shell -a "cd ~/data/Inception && docker compose stop"

reboot:
	ansible servers -i $(INVENTORY_FILE) -m shell -a "sudo reboot"

check:
	ansible-playbook -i $(INVENTORY_FILE) main.yml --check