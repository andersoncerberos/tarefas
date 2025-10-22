@echo off
title limpeza de arquivos temporario
echo limpando arquivos ...
del /s /q %temp%\*
rd /s /q %temp%
echo limpesa concluida
pause

 
