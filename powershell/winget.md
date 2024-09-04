## Just some stuff I install on Windows using [WinGet](https://github.com/microsoft/winget-cli) package manager.

```powershell
winget install -e --id Microsoft.PowerShell
winget install -e --id 7zip.7zip
winget install -e --id Git.Git
winget install -e --id JGraph.Draw  # diagrams.net
winget install -e --id Mozilla.Firefox
winget install -e --id Notepad++.Notepad++
winget install -e --id GitHub.cli
winget install -e --id GoLang.Go
winget install -e --id Oracle.JavaRuntimeEnvironment
winget install -e --id Google.Chrome
winget install -e --id RevoUninstaller.RevoUninstaller
winget install -e --id Microsoft.AzureCLI
winget install -e --id Starship.Starship # https://starship.rs/
winget install -e --id OpenVPNTechnologies.OpenVPNConnect
winget install -e --id Postman.Postman
winget install -e --id Zoom.Zoom.EXE
winget install -e --id wagoodman.dive
winget install -e --id Ollama.Ollama
winget install -e --id Python.Python.3.12  # check if newer version exists and change here
winget install -e --id Anaconda.Miniconda3
winget install -e --id Microsoft.VisualStudioCode
winget install -e --id Ghisler.TotalCommander
winget install -e --id Microsoft.Sysinternals.Autoruns
winget install -e --id CPUID.HWMonitor
winget install -e --id CPUID.CPU-Z
winget install -e --id Balena.Etcher
```

To update everything all at once, run in an elevated command window:
```powershell
winget upgrade --all
```
