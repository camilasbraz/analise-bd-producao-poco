--
-- File generated with SQLiteStudio v3.4.4 on ter mai 9 15:31:45 2023
--
-- Text encoding used: System
--
PRAGMA foreign_keys = ON;
BEGIN TRANSACTION;

-- Table: Campos
CREATE TABLE IF NOT EXISTS Campos (id_campo INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL, nome_campo TEXT (20) UNIQUE NOT NULL, estado TEXT (2), bacia TEXT (20));

-- Table: Operadores
CREATE TABLE IF NOT EXISTS Operadores (id_operador INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL, nome_operador TEXT (20));

-- Table: Concessao
CREATE TABLE IF NOT EXISTS Concessoes (
    id_concessao INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL,
    numero_contrato TEXT (20), 
    id_operador INTEGER, 
    id_campo INTEGER, 
    FOREIGN KEY (id_operador) REFERENCES Operadores (id_operador),
    FOREIGN KEY (id_campo) REFERENCES Campos (id_campo)
);

-- Table: Pocos
CREATE TABLE IF NOT EXISTS Pocos (id_poco INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL, nome_poco_anp TEXT (15) UNIQUE NOT NULL, nome_poco_operador TEXT (15), id_operador INTEGER, FOREIGN KEY (id_operador) REFERENCES Operadores (id_operador));

-- Table: Instalacoes
CREATE TABLE IF NOT EXISTS Instalacoes (id_instalacao INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL, nome_instalacao TEXT (25) UNIQUE, tipo_instalacao TEXT (2));

-- Table: Producao
CREATE TABLE IF NOT EXISTS Producoes (
    id_producao INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL,
    periodo TEXT (7),
    oleo REAL,
    condensado REAL,
    petroleo REAL,
    gas_natural_associado REAL,
    gas_natural_nao_associado REAL,
    gas_natural_total REAL,
    volume_gas_royalties REAL,
    agua REAL,
    tempo_producao INTEGER,
    periodo_da_carga TEXT (7),
    corrente TEXT (30),
    grau_api REAL,
    fp_lc TEXT (20),
    fp_lv TEXT (20),
    fp_mc TEXT (20),
    fp_mv TEXT (20),
    fp_pc TEXT (20),
    fp_pv TEXT (20),
    metano REAL,
    etano REAL,
    propano REAL,
    isobutano REAL,
    butano REAL,
    isopentano REAL,
    npentano REAL,
    hexanos REAL,
    heptanos REAL,
    octanos REAL,
    nonanos REAL,
    decanos REAL,
    undecanos REAL,
    oxigenio REAL,
    nitrogenio REAL,
    gas_carbonico REAL,
    densidade_glp_gas REAL,
    densidade_glp_liquido REAL,
    pcs_gp REAL,
    instalacao_destino INTEGER, 
    id_poco INTEGER, 
    id_campo INTEGER,
    FOREIGN KEY (instalacao_destino) REFERENCES Instalacoes (id_instalacao), 
    FOREIGN KEY (id_poco) REFERENCES Pocos (id_poco),
    FOREIGN KEY (id_campo) REFERENCES Campos (id_campo)
);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;