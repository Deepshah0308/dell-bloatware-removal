# Dell Bloatware Removal Script

This is a PowerShell script that will uninstall all Dell bloatware except Dell Command | Update for Windows. It uses the Commonstuff module to get the list of installed software and run the uninstallers.

## Requirements

- PowerShell 5.1 or higher
- Commonstuff module (will be installed automatically if not present)

## Usage

- Download or copy the script to your local machine
- Open PowerShell as an administrator
- Navigate to the folder where the script is located
- Run the following command to allow the script to run:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```

- Run the script by typing its name:

```powershell
.\Script.ps1
```

-The script will scan your system for any Dell bloatware and try to uninstall it. You may see some prompts or messages from the uninstallers. Wait until the script finishes and check the output for any errors or warnings.

## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

This script is licensed under the  [MIT](https://choosealicense.com/licenses/mit/). See the [LICENSE] file for more details.

## Disclaimer

- This script is provided “as is” without any warranty of any kind. Use it at your own risk. The author is not responsible for any damage or loss that may occur as a result of using this script. Always backup your data before running any scripts.

  [![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/A0A8PC5LC)
