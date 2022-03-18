# Docker NFS Server

Serves the volume specified in the docker-compose file over [NFS](https://linux.die.net/man/5/nfs).

## Usage
This container is designed for Linux operating systems. Run `docker-compose up` to start. It will share the content of a volume called `volume1` ready for connections from an NFS client.

Here is a command that can be used to connect to the shared volume from MacOS:

`mount_nfs ip_address_of_NFS_server:/nfs /directory/where/you/want/it/locally`

Customisation to the volumes it serves can be done by mounting different volumes in to the `/NFS` folder through the docker-compose file. 

Customisation of the read/write permissions and other [mounted related options](https://linux.die.net/man/5/exports) can be set through the environment variables in the docker-compose file.

## Acknowledgements

This work was based on prior projects:

- [f-u-z-z-l-e/docker-nfs-server](https://github.com/f-u-z-z-l-e/docker-nfs-server)
- [sjiveson/nfs-server-alpine](https://github.com/sjiveson/nfs-server-alpine)
- [ehough/docker-nfs-server](https://github.com/ehough/docker-nfs-server)
