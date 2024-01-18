for %%f in (*.pio) do (
    echo "PIOASMing"
    echo %%f
    %~dp0pioasm.exe -o "c-sdk" "%%f" "%%f.h"
)