<h1 align="center">
  Doc's (Totally Legal) Implants
</h1>

## 📝 Descrição

Doc's (Totally Legal) Implants é um sistema web interativo de visualização e gerenciamento de implantes corporais inspirados no universo de CyberPunk 2077. O projeto oferece uma experiência imersiva com informações sobre a franquia, carrossel de personagens, cards de corporações, catálogo de implantes corporais e sistema completo de autenticação e cadastro de usuários.

**Observação:** O projeto está em desenvolvimento contínuo com novas funcionalidades sendo adicionadas de tempos em tempos. Fique atento às atualizações!

## 🚀 Funcionalidades

- **Homepage Interativa**: Cards de informação junto de um Carrossel dinâmico de personagens com navegação fluida
- **Catálogo de Implantes**: Visualização detalhada de implantes corporais a instalar e já instalados
- **Sistema de Autenticação**: Login e cadastro de usuários com persistência de dados em banco de dados
- **Dashboard Personalizado**: Visualização de estado corporal do usuário, registrando as partes com peças robóticas
- **Interface Temática**: Design futurista inspirado no universo CyberPunk

## 💻 Tecnologias

**Front-End:**
- HTML5
- CSS3
- JavaScript (Vanilla)
- Font Awesome Icons

**Back-End:**
- Node.js
- Express
- MySQL (Banco de Dados)


## ⚙️ Pré-requisitos

Antes de executar o projeto, certifique-se de que você tenha instalado:

- **Node.js** (recomendado versão 14.x ou superior)
- **npm** (gerenciador de pacotes do Node.js)
- **MySQL** (servidor de banco de dados)

Para verificar se você tem o Node.js e o npm instalados, execute:

```bash
node -v
npm -v
```

Se você não tiver o Node.js instalado, você pode baixá-lo aqui: [https://nodejs.org](https://nodejs.org)

## 🛠️ Como Executar o Projeto

1. Clone o projeto:

```bash
git clone https://github.com/seu-usuario/CyberPunk.git
cd CyberPunk/web-data-viz
```

2. Instale as dependências:

```bash
npm install
```

3. Crie um arquivo `.env` em caso de ambiente de produção e `.env.dev` para ambiente de desenvolvimento e configure o banco de dados MySQL com as credenciais corretas, assim como o arquivo `.env.example`. 

4. Crie as tabelas necessárias no banco:

```sql
CREATE TABLE Usuario (
    idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    email VARCHAR(45) UNIQUE NOT NULL,
    genero CHAR (1) NOT NULL
	CONSTRAINT chk_genero
    CHECK (genero IN ('M', 'F')),
    CPF CHAR(12) UNIQUE,
    dtNasc DATE,
    senha VARCHAR(25) NOT NULL
);

CREATE TABLE Modificacoes (
    idModificacao INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    categoria VARCHAR(45),
    descricao VARCHAR(100),
    preco VARCHAR(7),
    localizacao VARCHAR(45),
    fabricante VARCHAR(45),
    condicao VARCHAR(45)
);

CREATE TABLE ParteCorpo (
    idParteCorpo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL
);

CREATE TABLE EstadoCorpo (
    fkUsuario INT,
    fkParteCorpo INT,
    fkModificacao INT,
    estado TINYINT
		CONSTRAINT estado_chk
			CHECK (estado IN ('0', '1')),
    dtModificacao VARCHAR(45),
    PRIMARY KEY (fkUsuario, fkParteCorpo),
    CONSTRAINT fk_estado_usuario
        FOREIGN KEY (fkUsuario) REFERENCES Usuario(idUsuario),
    CONSTRAINT fk_estado_parte
        FOREIGN KEY (fkParteCorpo) REFERENCES ParteCorpo(idParteCorpo),
    CONSTRAINT fk_estado_modificacao
        FOREIGN KEY (fkModificacao) REFERENCES Modificacoes(idModificacao)
);
```

5. Execute o servidor:

```bash
npm start
```

6. Acesse [http://localhost:3333](http://localhost:3333) no seu navegador.

## 🐛 Problemas Conhecidos

- Validação de CPF não está implementada
- Script MySQL necessita de polimento
- Sistema de economia na dashboard necessita de implementação

## 📬 Contato

Caso tenha alguma dúvida, entre em contato pelo GitHub ou entre neste email: [vinicius.guedes@sptech.school](mailto:vinicius.guedes@sptech.school)

## 📄 Licença

Esse projeto está licenciado sob a Licença MIT - veja o arquivo [LICENSE](./web-data-viz/LICENSE) para detalhes.

<br>

⭐ Se esse projeto te ajudou de alguma forma, considere deixar uma estrela!