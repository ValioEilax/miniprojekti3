from flask import session
from sqlalchemy.sql import text
# import app
#from db import db


def add_book(title, author, year, publisher, url, db):
    sql = text(
        '''INSERT INTO books (title, author, b_year, publisher, b_url)
        VALUES (:title, :author, :year, :publisher, :url)''')
    db.session.execute(sql, {
        "title": title,
        "author": author,
        "year": year,
        "publisher": publisher,
        "url": url
    })
    db.session.commit()

def get_books(db):
    sql = text(
        '''SELECT title, author, b_year, publisher, b_url FROM books''')
    result = db.session.execute(sql)
    books = result.fetchall()
    return books

def add_article(title, author, year, journal, url,db):
    sql = text(
        '''INSERT INTO articles (title, author, a_year, journal, a_url)
        VALUES (:title, :author, :year, :journal, :url)''')
    db.session.execute(sql, {
        "title": title,
        "author": author,
        "year": year,
        "journal": journal,
        "url": url
    })
    db.session.commit()

def get_articles(db):
    sql = text(
        '''SELECT title, author, a_year, journal, a_url FROM articles''')
    result = db.session.execute(sql)
    articles = result.fetchall()
    return articles

def add_inproceeding(title, author, year, url,db):
    sql = text(
        '''INSERT INTO inproceedings (title, author, i_year, i_url)
        VALUES (:title, :author, :year, :url)''')
    db.session.execute(sql, {
        "title": title,
        "author": author,
        "year": year,
        "url": url
    })
    db.session.commit()

def get_inproceedings(db):
    sql = text(
        '''SELECT title, author, i_year, i_url FROM inproceedings''')
    result = db.session.execute(sql)
    inproceedings = result.fetchall()
    return inproceedings


# def drop_em_all(db):
#     sql = text('''
#         DROP TABLE IF EXISTS books;
#         DROP TABLE IF EXISTS articles;
#         DROP TABLE IF EXISTS inproceedings;
#     ''')
#     db.session.execute(sql)
#     db.session.commit()