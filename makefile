
ROOT = ${abspath .}
RUNTIME = ${ROOT}/runtime
IMAGES = ${ROOT}/config/images
COMPOSITIONS = ${ROOT}/config/compositions
SCRIPTS = ${ROOT}/scripts

INSTANCE = ${abspath ${RUNTIME}/apps/}
VOLUMES = ${abspath ${RUNTIME}/volumes}

DATABASE_VOLUME = ${abspath ${VOLUMES}/database}

IONIC_IMAGE_DIR = ${IMAGES}/ionic
BASERAILS_IMAGE_DIR = ${IMAGES}/base_rails
DB_IMAGE_DIR = ${IMAGES}/db

export PATH := ${abspath ${ROOT}/bin/}:${PATH}

default: images instance

images: ionic_image base_rails_image db_image

ionic_image: ${IONIC_IMAGE_DIR}/Dockerfile 
	docker build --tag gs/ionic ${IONIC_IMAGE_DIR}

base_rails_image: ${BASERAILS_IMAGE_DIR}/Dockerfile 
	docker build --tag gs/base_rails ${BASERAILS_IMAGE_DIR}

db_image: ${DB_IMAGE_DIR}/Dockerfile 
	docker build --tag gs/db ${DB_IMAGE_DIR}

instance: entry workspace_link database_link compositions 

entry:
	mkdir -p ${INSTANCE}
	cp -rvf ${SCRIPTS}/* ${INSTANCE}

workspace_link:  
	ln -sfn ${INSTANCE} ${RUNTIME}/workspace_volume

database_link: ${DATABASE_VOLUME}  
	ln -sfn ${DATABASE_VOLUME} ${RUNTIME}/database_volume

${DATABASE_VOLUME}:
	mkdir -p ${DATABASE_VOLUME}

compositions:
	cp -rvf ${COMPOSITIONS}/ionic_dev.yml ${RUNTIME}
	cp -rvf ${COMPOSITIONS}/ionic_gen.yml ${RUNTIME}
	cp -rvf ${COMPOSITIONS}/application.yml ${RUNTIME}/web_run.yml
	cp -rvf ${COMPOSITIONS}/web_dev.yml ${RUNTIME}/web_dev.yml
	cp -rvf ${COMPOSITIONS}/database.yml ${RUNTIME}/db.yml

#clean will remove running containers and server config
#sterile will clean, then remove ALL volumes and ALL images- even unrelated ones

clean:
	exec docker-clean

cleaner: clean
	rm -rf ${VOLUMES}/*

sterile: cleaner
	exec docker-rmi

