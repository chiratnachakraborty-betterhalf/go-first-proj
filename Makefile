createdb: 
	docker exec -it postgres15 createdb --username=root --owner=root simple_bank

dropdb: 
	docker exec -it postgres15 dropdb  simple_bank

migrateup:
	 migrate -path db/migration -database "postgresql://root:root@localhost:5432/simple_bank?sslmode=disable"  -verbose up

migratedown:
	 migrate -path db/migration -database "postgresql://root:root@localhost:5432/simple_bank?sslmode=disable"  -verbose down


sqlc:
	sqlc generate

test:
	go test -v -cover ./...

.PHONY: createdb dropdb migrateup migratedown sqlc test