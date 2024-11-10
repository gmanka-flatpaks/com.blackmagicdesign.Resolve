#!/bin/bash

headers=$(cat headers.txt)
post_data_json=$(cat post_data.json)
release_info_url="https://blackmagicdesign.com/api/support/latest-stable-version/davinci-resolve/linux"
release_info=$(curl --connect-timeout 10 -s -H "$headers" "$release_info_url")
download_id=$(echo "$release_info" | jq -r '.linux.downloadId')
first_download_url="https://blackmagicdesign.com/api/register/us/download/${download_id}"
second_download_url=$(curl --connect-timeout 10 -s -H "$headers" -d "$post_data_json" "$first_download_url")
curl -L -o resolve.zip "$second_download_url"

