# Setting up Windows -> WSL -> Ubuntu - Cmder -> zsh

This a short collection of script(s) to get a baseline environment up and running. 

## Getting Started

By following the steps below, you will have a working Linux (Ubuntu) shell, that can be accessed using Cmder.

### Installing

Run the PowerShell script as admin, you may need to set the execution policy on your system to enable the use of scripts
```
Powershell.exe > .\setup.ps1
```

Once the PS script is completed, and you have your Bash prompt running, you can launch Cmder now and download and run the script below

```
curl https://raw.githubusercontent.com/infraninjjas/zsh-windows-wsl-cmder/master/setup.sh
chmod +x setup.sh
sudo ./setup.sh
```

## Contributing

This project is completely open source and is currently used as a baseline setup for myself and a few others.

## Versioning

Version 1.0.1

## Authors

* **Jonathan Laberge** - *Initial work* - [InfraNinjjas](https://github.com/infraninjjas)

See also the list of [contributors](https://github.com/infraninjjas/zsh-windows-wsl-cmder/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
