@echo off
echo ==========================================
echo    BOLAO DA ISA - Copa 2026
echo ==========================================
echo.

cd /d "%~dp0backend"

IF NOT EXIST ".env" (
    echo [AVISO] Arquivo .env nao encontrado!
    echo Copie .env.example para .env e configure o banco.
    pause
    exit /b 1
)

IF NOT EXIST "venv\Scripts\activate.bat" (
    echo [INFO] Criando ambiente virtual Python...
    python -m venv venv
)

echo [INFO] Ativando ambiente virtual...
call venv\Scripts\activate.bat

echo [INFO] Instalando dependencias...
pip install -r requirements.txt --quiet

echo [INFO] Iniciando servidor Flask...
echo [OK] Acesse: http://localhost:5000
echo [OK] Abra o frontend: frontend\index.html
echo.
python app.py
pause
