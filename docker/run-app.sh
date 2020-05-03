docker run -ti --rm  -p 8080:8080 -p 8000:8000 --link pet-mysql:petclinic-db.default.svc.cluster.local petclinic
