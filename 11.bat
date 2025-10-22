@echo off 
:menu 
cls
echo calculadora
echo 1-somar
echo 2-subitrair
echo 3-multiplica
echo 4-divitir
echo 5-sair
set /p opcao=escolha um numero
if %opcao%=="1" goto somar
if %opcao%=="2" goto subitrair
if %opcao%=="3" goto multiplica
if %opcao%=="4" goto divitir
if %opcao%==5 goto  exit

:somar
cls 
set /p a=digite o primeiro numero
set /p b=digite o segundo numero
set /a resuldato="%a%" + "%b%"

echo resultado: %resuldato%
pause
goto menu
