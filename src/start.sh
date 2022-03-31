#!/usr/bin/env
destination=/nfs/
source=share/

destination_timestamp=$destination.build_timestamp
source_timestamp=$source.build_timestamp

if [ "$SYNC" = true ]
then
    echo "=================================================================="
    echo "----> Setting up the development environment..."
    
    if [ -e "$destination_timestamp" ] && [ "$(cat ${destination_timestamp})" = "$(cat ${source_timestamp})" ]; then
        echo "----> App is up to date."
    else
        # Update volume with latest UI files
        rsync --archive --delete --inplace $source $destination
        echo "----> App updated."
    fi
    
    echo "----> Starting NFS Server..."
    echo "=================================================================="
fi

# Start Supervisor
exec ./nfs.sh
