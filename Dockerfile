FROM alpine:latest

RUN apk --update --no-cache add bash nfs-utils && \
    # remove the default config files
    rm -v /etc/idmapd.conf /etc/exports

RUN mkdir -p /var/lib/nfs/rpc_pipefs /var/lib/nfs/v4recovery /nfs && \                                        
    echo "rpc_pipefs  /var/lib/nfs/rpc_pipefs  rpc_pipefs  defaults  0  0" >> /etc/fstab && \
    echo "nfsd        /proc/fs/nfsd            nfsd        defaults  0  0" >> /etc/fstab

RUN chmod -R 777 /nfs

COPY ./entrypoint.sh /usr/local/bin
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
