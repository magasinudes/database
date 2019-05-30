# MagasinUdes database
This is a repo containing scripts for:
* Database creation/drop
* Database seed

## How to build
You can run `docker build -t justin2997/database .`

## How to start
You can run `docker run --rm   --name justin2997/database -e POSTGRES_PASSWORD=docker -d -p 5432:5432 -v $HOME/docker/volumes/postgres:/var/lib/postgresql/data postgres`
