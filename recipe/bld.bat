:: check licenses
cargo-bundle-licenses --format yaml --output THIRDPARTY.yml || goto :error

:: build
cargo install --locked --root "%PREFIX%" typos-cli || goto :error

:: strip debug symbols
strip "%PREFIX%\bin\typos.exe" || goto :error

:: remove extra build file
del /F /Q "%PREFIX%\.crates.toml"

goto :EOF

:error
echo Failed with error #%errorlevel%.
exit 1
