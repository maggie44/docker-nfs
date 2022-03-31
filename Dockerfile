FROM alpine:3.15

# Install required packages
RUN apk --no-cache add bash nfs-utils rsync && \
    # Remove the default config files
    rm -v /etc/idmapd.conf /etc/exports

RUN mkdir -p /var/lib/nfs/rpc_pipefs /var/lib/nfs/v4recovery /nfs && \                                        
    echo "rpc_pipefs  /var/lib/nfs/rpc_pipefs  rpc_pipefs  defaults  0  0" >> /etc/fstab && \
    echo "nfsd        /proc/fs/nfsd            nfsd        defaults  0  0" >> /etc/fstab

# Set file permissions for host folder
RUN chmod -R 777 /nfs

# Insert config files
WORKDIR /build
COPY src .

# Insert users development build
COPY share share/

# Used to identify whether a new build has been pushed and updates are required. Otherwise
# a container reinstall could overwrite your changes to the files when the container
# being installed hasn't changed. 
RUN echo $(date +%s) > share/.build_timestamp

CMD ["sh", "start.sh"]
