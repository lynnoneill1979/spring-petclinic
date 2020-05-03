docker run -ti --rm  -p 3306:3306 -e MYSQL_ROOT_PASSWORD=demo -e MYSQL_DATABASE=petclinic --name pet-mysql petclinic-db
