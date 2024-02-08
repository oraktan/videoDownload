#!/bin/bash

clear
echo "------------------"
echo "     Firstly you need create a file that include your video list"
echo "     Your Videos will download in webm format  "
echo " "


#firstly install utulities

sudo apt install curl git mpv jq fzf yt-dlp -y > /dev/null 2>&1




# Check if installation was successful
if [ $? -eq 0 ]; then
  echo "✅ Packages installed successfully."
else
  echo "❌ Error: Package installation failed."
  exit 1
fi


# Get the file name from the user
echo "Please enter the file name (e.g., remix.txt):"
read file_name

# Check if the file exists
if [ ! -f "$file_name" ]; then
  echo "Error: $file_name not found!"
  exit 1
fi


while read line;
do
  ytfzf -a -d "$line"
  echo "$line";
done < "$file_name"
clear


echo " "
echo " "
echo " ✨ Script completed successfully. "
