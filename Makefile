all:
	if [ -d ./dist ]; then rm -rd ./dist; fi
	mkdir ./dist
	cp ./node_modules/todomvc-app-css/index.css ./dist/style.css