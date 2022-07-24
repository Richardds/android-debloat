# Android debloat utilities

## Uninstall package
The script attempts to eliminate the package with the following steps:
- Suspends the package's running processes
- Resets package permissions
- Deletes the package's data and cache
- Disables the package
- Uninstalls the package
```
./uninstall.sh <package>
```

## Uninstall multiple packages
The script uninstalls packages contained in the `delete.txt` or optionally file given by the first parameter. To make the process more efficient, it first checks for the packages installed on the device and invokes the uninstallation only for those installed.
```
./uninstall_batch.sh [list_path]
```

## Install package
The script installs the package located in the `install` directory. Specifying `version_code` argument selects an APK file suffixed with `@version_code`.
```
./install.sh <package> [version_code]
```

## Install multiple packages
The script installs packages contained in the `install.txt` or optionally file given by the first parameter.
```
./install_batch.sh [list_path]
```

## Fetch APK file from F-Droid repository
The script fetches a package of a specific version from the F-Droid repository. The latest package version is selected if the version is not specified. Please note that this script operates with version instead of version code.
```
./fetch_fdroid.sh <package> [version]
```

## Backup
The script backups packages and their data. The backup might ask for an encryption key that needs to be entered on the device for each package.
```
./backup.sh
```
