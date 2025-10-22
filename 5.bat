@echo off
set senha=1234
set /p usarioSenha=Digite a senha:
if NOT %usarioSenha%==%senha% (
    echo +++++++++++
    echo senha incorreta!!!
    echo +++++++++++
    pause 
    exit
    
)

:menu
cls 
echo 1-Abrir o google
echo 2-Abrir o calculadora
echo 3-Sair do terminal
set /p opcao=Escolha uma opcao:
if %opcao%==1 start https://www.google.com
if %opcao%==2 start calc.exe
if %opcao%==3 exit
goto menu