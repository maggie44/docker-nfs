# Docker NFS Server

Serves the volume specified in the docker-compose file over [NFS](https://linux.die.net/man/5/nfs).

You can add content to the volume by dropping it in to the `share` directory before deployment and ensuring `SYNC: True` is set in the docker-compose file.

## Usage

This container is designed for Linux operating systems. Run `docker-compose up` to start. It will share the content of a volume called `nfs` ready for connections from an NFS client.

Here is a command that can be used to connect to the shared volume from MacOS:

`mount_nfs ip_or_hostname_of_NFS_server:/nfs /local/directory`

Customisation of the read/write permissions and other [mount related options](https://linux.die.net/man/5/exports) can be set through the environment variables in the docker-compose file.

## Acknowledgements

This work was based on prior projects:

- [f-u-z-z-l-e/docker-nfs-server](https://github.com/f-u-z-z-l-e/docker-nfs-server)
- [sjiveson/nfs-server-alpine](https://github.com/sjiveson/nfs-server-alpine)
- [ehough/docker-nfs-server](https://github.com/ehough/docker-nfs-server)
