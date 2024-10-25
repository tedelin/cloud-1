NAME=cloud-1
INVENTORY_FILE=inventory.ini

$(NAME):
	ansible-playbook -i $(INVENTORY_FILE) main.yml

start:
	ansible all -m shell -a "cd ~/data/Inception && make"

stop:
	ansible all -m shell -a "cd ~/data/Inception && docker compose stop"

check:
	ansible-playbook -i $(INVENTORY_FILE) main.yml --check