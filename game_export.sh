read version < godot/version.txt 
file_name=Project_Darkness_v$version

if [ -e "exports/windows/$file_name" ]
then
    echo Version $version already exists for Windows. Nothing exported.
else
    mkdir -p exports/windows/$file_name
    echo Using Godot $(godot --version)
    godot --headless --quiet --path godot/ --export-release "Windows Desktop" ../exports/windows/$file_name/Project_Darkness.exe
    cp README.md exports/windows/$file_name
    cd exports/windows
    zip -r $file_name.zip $file_name
    cd ../..
fi

# if [ -e "exports/linux/$file_name" ]
# then
#     echo Version $version already exists for Linux. Nothing exported.
# else
#     mkdir -p exports/linux/$file_name
#     echo Using Godot $(godot --version)
#     godot --headless --quiet --path godot/ --export-release "Linux/X11" ../exports/linux/$file_name/Project_Darkness.x86_64
#     cp README.md exports/linux/$file_name
#     cd exports/linux
#     tar -czvf $file_name.tar.gz $file_name
# fi
