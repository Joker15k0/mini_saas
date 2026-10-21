
from flask import Flask, render_template, request, redirect, flash
import sqlite3
from pathlib import Path

app = Flask(__name__)
app.secret_key = "mini-saas-chave-local"

PASTA = Path(__file__).resolve().parent
BANCO = PASTA / "produtos.db"


def conectar():
    conexao = sqlite3.connect(BANCO)
    conexao.row_factory = sqlite3.Row
    return conexao


def criar_banco():
    with conectar() as conexao:
        conexao.execute("""
            CREATE TABLE IF NOT EXISTS produtos (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                nome TEXT NOT NULL,
                descricao TEXT,
                preco REAL NOT NULL
            )
        """)


@app.route("/")
def inicio():
    with conectar() as conexao:
        produtos = conexao.execute(
            "SELECT * FROM produtos ORDER BY id DESC"
        ).fetchall()

    return render_template("index.html", produtos=produtos)


@app.route("/cadastrar", methods=["POST"])
def cadastrar():
    nome = request.form.get("nome", "").strip()
    descricao = request.form.get("descricao", "").strip()

    try:
        preco = float(request.form.get("preco", ""))
        if preco < 0:
            raise ValueError
    except ValueError:
        flash("Digite um preço válido.")
        return redirect("/")

    if not nome:
        flash("O nome do produto é obrigatório.")
        return redirect("/")

    with conectar() as conexao:
        conexao.execute(
            "INSERT INTO produtos (nome, descricao, preco) VALUES (?, ?, ?)",
            (nome, descricao, preco)
        )

    flash("Produto cadastrado com sucesso!")
    return redirect("/")


@app.route("/excluir/<int:produto_id>", methods=["POST"])
def excluir(produto_id):
    with conectar() as conexao:
        conexao.execute(
            "DELETE FROM produtos WHERE id = ?",
            (produto_id,)
        )

    flash("Produto excluído.")
    return redirect("/")


if __name__ == "__main__":
    criar_banco()
    app.run(host="127.0.0.1", port=5000, debug=False)
