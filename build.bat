@echo off
del /s /q build\*.*
for %%f in (src\*.elm) do (
    echo === %%~nf ===
    call elm make %%f --output=build\%%~nf.html --optimize
)