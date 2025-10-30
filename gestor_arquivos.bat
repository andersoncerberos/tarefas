@echo off
s

echo ------------------------
echo SISTEMA DE GERENCIAMENTO
echo ------------------------
echo.

:: Criar estrutura de diretórios
echo Criando estrutura de diretorios...

if not exist "GestorArquivos" (
    mkdir "GestorArquivos"
    echo %date% %time% - CRIAR_PASTA - Sucesso: GestorArquivos
) else (
    echo %date% %time% - CRIAR_PASTA - Ja_existia: GestorArquivos
)

if not exist "GestorArquivos\Documentos" (
    mkdir "GestorArquivos\Documentos"
    echo %date% %time% - CRIAR_PASTA - Sucesso: GestorArquivos\Documentos
) else (
    echo %date% %time% - CRIAR_PASTA - Ja_existia: GestorArquivos\Documentos
)

if not exist "GestorArquivos\Logs" (
    mkdir "GestorArquivos\Logs"
    echo %date% %time% - CRIAR_PASTA - Sucesso: GestorArquivos\Logs
) else (
    echo %date% %time% - CRIAR_PASTA - Ja_existia: GestorArquivos\Logs
)

if not exist "GestorArquivos\Backups" (
    mkdir "GestorArquivos\Backups"
    echo %date% %time% - CRIAR_PASTA - Sucesso: GestorArquivos\Backups
) else (
    echo %date% %time% - CRIAR_PASTA - Ja_existia: GestorArquivos\Backups
)

:: Registrar criação de pastas no log
echo %date% %time% - CRIAR_PASTA - Sucesso: GestorArquivos > "GestorArquivos\Logs\atividade.log"
echo %date% %time% - CRIAR_PASTA - Sucesso: GestorArquivos\Documentos >> "GestorArquivos\Logs\atividade.log"
echo %date% %time% - CRIAR_PASTA - Sucesso: GestorArquivos\Logs >> "GestorArquivos\Logs\atividade.log"
echo %date% %time% - CRIAR_PASTA - Sucesso: GestorArquivos\Backups >> "GestorArquivos\Logs\atividade.log"

:: Criar arquivos na pasta Documentos
echo.
echo Criando arquivos de texto...

echo RELATORIO MENSAL DE ATIVIDADES > "GestorArquivos\Documentos\relatorio.txt"
echo ================================ >> "GestorArquivos\Documentos\relatorio.txt"
echo Data de geracao: %date% >> "GestorArquivos\Documentos\relatorio.txt"
echo Total de projetos: 15 >> "GestorArquivos\Documentos\relatorio.txt"
echo Status: EM ANDAMENTO >> "GestorArquivos\Documentos\relatorio.txt"
echo %date% %time% - CRIAR_ARQUIVO - Sucesso: relatorio.txt >> "GestorArquivos\Logs\atividade.log"

echo ID;NOME;IDADE;CIDADE > "GestorArquivos\Documentos\dados.csv"
echo 1;Joao Silva;30;Sao Paulo >> "GestorArquivos\Documentos\dados.csv"
echo 2;Maria Santos;25;Rio de Janeiro >> "GestorArquivos\Documentos\dados.csv"
echo 3;Pedro Oliveira;35;Belo Horizonte >> "GestorArquivos\Documentos\dados.csv"
echo %date% %time% - CRIAR_ARQUIVO - Sucesso: dados.csv >> "GestorArquivos\Logs\atividade.log"

echo [CONFIGURACOES_GERAIS] > "GestorArquivos\Documentos\config.ini"
echo servidor=localhost >> "GestorArquivos\Documentos\config.ini"
echo porta=8080 >> "GestorArquivos\Documentos\config.ini"
echo usuario=admin >> "GestorArquivos\Documentos\config.ini"
echo backup_automatico=sim >> "GestorArquivos\Documentos\config.ini"
echo %date% %time% - CRIAR_ARQUIVO - Sucesso: config.ini >> "GestorArquivos\Logs\atividade.log"

:: Fazer backup dos arquivos
echo.
echo Realizando backup dos arquivos...
set "DATA_BACKUP=%date% %time%"

copy "GestorArquivos\Documentos\relatorio.txt" "GestorArquivos\Backups\" >nul
if %errorlevel% equ 0 (
    echo %date% %time% - BACKUP - Sucesso: relatorio.txt >> "GestorArquivos\Logs\atividade.log"
) else (
    echo %date% %time% - BACKUP - Falha: relatorio.txt >> "GestorArquivos\Logs\atividade.log"
)

copy "GestorArquivos\Documentos\dados.csv" "GestorArquivos\Backups\" >nul
if %errorlevel% equ 0 (
    echo %date% %time% - BACKUP - Sucesso: dados.csv >> "GestorArquivos\Logs\atividade.log"
) else (
    echo %date% %time% - BACKUP - Falha: dados.csv >> "GestorArquivos\Logs\atividade.log"
)

copy "GestorArquivos\Documentos\config.ini" "GestorArquivos\Backups\" >nul
if %errorlevel% equ 0 (
    echo %date% %time% - BACKUP - Sucesso: config.ini >> "GestorArquivos\Logs\atividade.log"
) else (
    echo %date% %time% - BACKUP - Falha: config.ini >> "GestorArquivos\Logs\atividade.log"
)

:: Criar arquivo de backup completo
echo BACKUP REALIZADO COM SUCESSO > "GestorArquivos\Backups\backup_completo.bak"
echo Data: %DATA_BACKUP% >> "GestorArquivos\Backups\backup_completo.bak"
echo Arquivos incluidos: >> "GestorArquivos\Backups\backup_completo.bak"
echo - relatorio.txt >> "GestorArquivos\Backups\backup_completo.bak"
echo - dados.csv >> "GestorArquivos\Backups\backup_completo.bak"
echo - config.ini >> "GestorArquivos\Backups\backup_completo.bak"
echo %date% %time% - BACKUP_COMPLETO - Sucesso: backup_completo.bak >> "GestorArquivos\Logs\atividade.log"

:: Gerar relatório final
echo.
echo Gerando relatorio de execucao...
echo RELATORIO DE EXECUCAO > "GestorArquivos\resumo_execucao.txt"
echo ---------------------- >> "GestorArquivos\resumo_execucao.txt"
echo Total de arquivos criados: 7 >> "GestorArquivos\resumo_execucao.txt"
echo Total de pastas criadas: 4 >> "GestorArquivos\resumo_execucao.txt"

if "%DATA_BACKUP%"=="" (
    echo Data/Hora do backup: %date% %time% >> "GestorArquivos\resumo_execucao.txt"
) else (
    echo Data/Hora do backup: %DATA_BACKUP% >> "GestorArquivos\resumo_execucao.txt"
)

echo %date% %time% - RELATORIO - Sucesso: resumo_execucao.txt >> "GestorArquivos\Logs\atividade.log"

:: Exibir resumo final
echo ------------------------
echo ESTRUTURA CRIADA COM SUCESSO
echo ------------------------
echo Local: %CD%\GestorArquivos
echo Pastas criadas: 4
echo Arquivos criados: 7
echo Log: GestorArquivos\Logs\atividade.log
echo Relatorio: GestorArquivos\resumo_execucao.txt
echo ------------------------

:: Mostrar conteúdo do log
echo.
echo CONTEUDO DO LOG:
type "GestorArquivos\Logs\atividade.log"
echo ------------------------

pause