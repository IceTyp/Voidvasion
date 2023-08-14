read version < godot/version.txt 
file_name=Voidvasion$version

if [ -e "exports/windows/$file_name" ]
then
    echo Version $version already exists for Windows. Nothing exported.
else
    mkdir -p exports/windows/$file_name
    echo Using Godot $(godot --version)
    godot --headless --quiet --path godot/ --export-release "Windows Desktop" ../exports/windows/$file_name/Voidvasion.exe
    cp README.md exports/windows/$file_name
    cd exports/windows
    zip -r ../${file_name}_windows.zip $file_name
    cd ../..
fi

if [ -e "exports/linux/$file_name" ]
then
    echo Version $version already exists for Linux. Nothing exported.
else
    mkdir -p exports/linux/$file_name
    echo Using Godot $(godot --version)
    godot --headless --quiet --path godot/ --export-release "Linux/X11" ../exports/linux/$file_name/Voidvasion.x86_64
    cp README.md exports/linux/$file_name
    cd exports/linux
    tar -czvf ../${file_name}_linux.tar.gz $file_name
    cd ../..
fi

if [ -e "exports/web/$file_name" ]
then
    echo Version $version already exists for Web. Nothing exported.
else
    mkdir -p exports/web/$file_name
    echo Using Godot $(godot --version)
    godot --headless --quiet --path godot/ --export-release "Web" ../exports/web/$file_name/index.html
    cp README.md exports/web/$file_name
    cd exports/web
    zip -r ../${file_name}_web.zip $file_name
    cd ../..
fi
