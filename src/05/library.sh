#!/bin/bash
# Library with support functions

function printInfo {
    total_dirs_quantity=$(find $file_name -type d 2>/dev/null | wc -l); 
    total_files_quantity=$(find $file_name -type f 2>/dev/null | wc -l);
    conf_files_quantity=$(find $file_name -type f 2>/dev/null | grep '.conf$' | wc -l);
    text_files_quantity=$(find $file_name -type f 2>/dev/null | grep '.txt$' | wc -l);
    executable_files_quantity=$(find $file_name -type f -executable 2>/dev/null | wc -l);
    log_files_quantity=$(find $file_name -type f 2>/dev/null | grep '.log$' | wc -l);
    archive_files_quantity=$(find $file_name -type f 2>/dev/null | grep -E "(.7z|.ace|.cab|.cbr|.deb|.gz|.gzip|.jar|.pkg|.rar|.rpm|.tar|.tar-gz|.tgz|.xar|.zip|.zipx)" | wc -l);
    symbolic_links_quantity=$(find $file_name -type l 2>/dev/null | wc -l);

    echo "Total number of folders (including all nested ones) = $(( $total_dirs_quantity-1 ))";
    printMaxSizeDirs;
    echo "Total number of files = $total_files_quantity";
    echo "Number of:"
    echo "Configuration files (with the .conf extension) = $conf_files_quantity"
    echo "Text files = $text_files_quantity"
    echo "Executable files = $executable_files_quantity"
    echo "Log files = $log_files_quantity"
    echo "Archive files = $archive_files_quantity"
    echo "Symbolic links = $symbolic_links_quantity"
    printMaxSizeFiles;
    printExecutableFiles;
}

function makeNormalFileName {
    if [[ $1 != "/" ]]; then
        echo ${1%?};
    else
        echo $1;
    fi;
}

function printMaxSizeDirs {
    count=0;
    IFS=$'\n';
    echo "TOP 5 folders of maximum size arranged in descending order (path and size):";
    for entry in $(du -h $file_name 2>/dev/null | sort -hr | head -n 6);
    do
        if [[ $count -ne 0 ]]; then
            echo "$count - $(echo $entry | awk '{printf $2 "/, " $1}')";
        fi
        count=$(( $count + 1 ));
    done;
}

function printMaxSizeFiles {
    count=1;
    IFS=$'\n';
    echo "TOP 10 files of maximum size arranged in descending order (path, size and type):";
    for entry in $(find $file_name -type f 2>/dev/null | xargs -r -d '\n' du -h 2>/dev/null | sort -hr | head -n 10 | sort -h);
    do
        file=$(echo $entry | awk '{printf $2}');
        file_size=$(echo $entry | awk '{printf $1}');
        file_ext=$(file -b $file);
        echo "$count - $file, $file_size, $file_ext";
        count=$(( $count + 1 ));
    done;
}

function printExecutableFiles {
    count=1;
    IFS=$'\n';
    echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file)";
    for entry in $(find $file_name -type f 2>/dev/null -executable | xargs -r -d '\n' du -h 2>/dev/null | sort -hr | head -n 10 | sort -h);
    do
        file=$(echo $entry | awk '{printf $2}');
        file_size=$(echo $entry | awk '{printf $1}');
        file_hash=$(md5sum $file | awk '{printf $1}');
        echo "$count - $file, $file_size, $file_hash";
        count=$(( $count + 1 ));
    done;
}