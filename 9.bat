@echo off
title backup de arquivos 
set origem = C:\Users\24114290042\Documents\tarefas
set destino = C:\Users\24114290042\Downloads
echo processo de backup em andamento
xcopy %origem%\*.*%destino%/C

echo backup realizado
pause