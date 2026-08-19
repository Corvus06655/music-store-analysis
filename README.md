# Music Store Data Analysis — Advanced SQL

An end-to-end SQL analysis of an 11-table music retail database. The project answers 11 business questions using multi-table joins, CTEs, subqueries, window functions, ranking, and tie-aware logic.

> **Portfolio focus:** relational data modeling, advanced SQL, customer analytics, revenue analysis, and business storytelling.

## Business objective

A digital music store needs to understand customer value, geographic demand, artist and genre performance, and purchasing behavior. This project translates a normalized relational schema into decision-oriented SQL analysis.

## Data model

The repository includes CSV tables for customers, invoices, invoice lines, tracks, albums, artists, genres, employees, playlists, and media types. The schema diagram documents the relationships used to move from customer and invoice activity to artist and genre insights.

customer to invoice to invoice_line to track to album to artist, with genre connected through track.

## Business questions

The analysis covers employee seniority, invoice volume by country, top invoice values, city revenue, highest-spending customer, Rock listeners, top Rock artists, above-average track length, spend by customer and artist, most popular genre per country, and top-spending customer per country with ties included.

## SQL techniques demonstrated

The queries use multi-table joins, CTEs, correlated and scalar subqueries, aggregations, window functions, ranking, and tie-handling logic. The result is a practical SQL portfolio project rather than an isolated syntax exercise.

## Verified headline insights

The USA leads invoice volume with 131 invoices. Prague is the highest-revenue city in the supplied analysis with 273.24 dollars in invoice value. The highest-spending customer is František Wichterlová with 144.54 dollars in lifetime spend. Rock is the largest catalog genre with 1,297 of 3,503 tracks, and Led Zeppelin is the top Rock artist by track count in the supplied analysis.

## Tools and repository contents

MySQL · Window Functions · CTEs · Subqueries · Multi-table Joins

The repository contains queries.sql, the source CSV tables in data, questions.pdf, and schema_diagram.png.

## How to review locally

Clone the repository, import the CSV tables into MySQL or another compatible relational database, and run queries.sql. Review schema_diagram.png first to understand the relationships used by the query logic.

## Limitations and next steps

This is a static relational case study. A production extension would add a data dictionary, automated SQL tests, a reproducible database-loading script, customer cohorts, and a small dashboard showing the most important commercial outputs. The duplicate album file should also be explained or removed if it is not intentionally preserved for comparison.

---

*Part of Mayank Srivastava's Data Analyst portfolio.*
