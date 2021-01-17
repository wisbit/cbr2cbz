#!/bin/bash
#count=0
for folder in *
do
	dir="${folder}/"
	#dir="6 Jours et mourir/"
	if [[ ${folder} != *".sh" ]]; then
		sudo mkdir "${dir}"temp
		sudo chown $USER:$USER "${dir}"temp
	
	for f in "${dir}"*
		do

			if [[ ${f} == *".cbr" ]]; then

			#echo "${f}";
			filefull=$(readlink -f "${f}");
			echo "Filepath : ${filefull}";
			
			foldernamefullpath=$(dirname "${filefull}");
			echo "Folder Name Full Path : ${foldernamefullpath}";
			
			foldername=$(basename "${foldernamefullpath}");
			echo "Folder Name : ${foldername}";
			
			filename=$(basename "${filefull}");
			echo "filename : ${filename}";
			filename_noext="${filename%.*}"
			
			ark -b -o "${foldernamefullpath}/temp/" "${filefull}" &&

			count=$(find "${foldernamefullpath}"/temp/ -maxdepth 1 | wc -l) &&
			echo $count;
			if (( ${count} < 5 )); then			
				zip "${foldernamefullpath}"/"${filename_noext}" "${foldername}"/temp/*/* 
			else
				zip "${foldernamefullpath}"/"${filename_noext}" "${foldername}"/temp/* 
				
			fi 
			#sleep 15;
			mv "${foldernamefullpath}"/"${filename_noext}".zip "${foldernamefullpath}"/"${filename_noext}".cbz			
			sudo rm "${foldernamefullpath}"/"${filename_noext}".cbr
			sudo rm -r "${foldernamefullpath}"/temp/* &&

			echo " ";
			echo " ";
			fi

	done
	
	sudo rm -dr "${dir}"temp
	fi
done