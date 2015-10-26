subl_path="$(sudo find / -name subl)"
if ! [ -z "${subl_path}" ]
	echo "alias subl=\"${subl_path}\"" >> ~/.bashrc
	source ~/.bashrc
	echo "subl command setup completed."
else
	echo "Couldn't find sublime binary. Have you installed the Sublime?"
fi
