# 🏆 Bolão da Isa — Copa do Mundo 2026

## Estrutura do Projeto

```
bolao/
├── backend/               ← API Python/Flask
│   ├── app.py             ← Ponto de entrada
│   ├── config.py          ← Configurações
│   ├── database.py        ← Models SQLAlchemy
│   ├── utils.py           ← JWT e helpers
│   ├── routes/
│   │   ├── auth.py        ← Login/Cadastro
│   │   ├── jogos.py       ← Jogos da Copa
│   │   ├── palpites.py    ← Palpites dos usuários
│   │   ├── ranking.py     ← Classificação
│   │   └── admin.py       ← Painel admin
│   ├── requirements.txt
│   └── .env.example
├── frontend/              ← Site HTML/CSS/JS
│   ├── index.html
│   ├── css/style.css
│   └── js/
│       ├── assets.js      ← Imagens em base64
│       ├── api.js         ← Chamadas à API
│       └── app.js         ← Lógica e páginas
├── database/
│   ├── schema.sql         ← Cria as tabelas
│   └── seed.sql           ← Jogos iniciais
├── start.bat              ← Iniciar no Windows
└── README.md
```

---

## ⚙️ Setup no Windows (VM ou PC)

### 1. Instale os pré-requisitos
- [Python 3.11+](https://python.org) — marque "Add to PATH"
- [PostgreSQL 16](https://postgresql.org/download/windows) — anote a senha do postgres

### 2. Crie o banco de dados
Abra o **pgAdmin** ou **psql** e execute:
```sql
CREATE DATABASE bolao;
```
Depois execute o schema e o seed:
```bash
psql -U postgres -d bolao -f database/schema.sql
psql -U postgres -d bolao -f database/seed.sql
```

### 3. Configure o .env
```bash
cd backend
copy .env.example .env
```
Edite o `.env` com a senha do seu PostgreSQL:
```
DATABASE_URL=postgresql://postgres:SUA_SENHA@localhost:5432/bolao
```

### 4. Inicie o servidor
Dê um duplo clique em `start.bat` — ele cria o ambiente virtual, instala as dependências e sobe o Flask automaticamente.

### 5. Abra o frontend
Abra o arquivo `frontend/index.html` no navegador.

> **Dica:** Para acessar de outros dispositivos na rede, use o IP da VM no lugar de `localhost` em `frontend/js/api.js`.

---

## 🌐 Acesso externo (família e amigos)

Para que amigos fora da sua rede acessem o bolão:

1. Instale o [ngrok](https://ngrok.com)
2. Com o Flask rodando, execute:
   ```bash
   ngrok http 5000
   ```
3. Copie o link `https://xxxx.ngrok-free.app` e cole em `api.js` na variável `BASE`
4. Compartilhe o `index.html` (ou suba num servidor estático)

---

## 📋 Regras do Bolão

| Acerto | Pontos |
|--------|--------|
| Placar exato | +3 pts |
| Só o vencedor | +1 pt |
| Palpite campeão | +100 pts |

- **Taxa:** R$ 50,00 por palpiteiro
- **Premiação:** 75% ao 1º lugar · 25% ao 2º
- **Prazo de inscrição:** 11/06/2026
- **Desempate:** Proporcional ao total de pontos

---

## 🔑 Primeiro usuário = Admin

O primeiro cadastro no sistema recebe poderes de admin automaticamente:
- Adicionar jogos
- Atualizar resultados
- Ver lista de participantes e prêmio total
