# 🎵 Music Store Data Analysis (SQL)


> End-to-end SQL analysis on a relational music retail database (Chinook-style schema), answering 11 real-world business questions across easy, moderate, and advanced difficulty tiers using joins, subqueries, window functions, and CTEs.

## 📌 Project Overview

This project simulates a business analytics engagement for a digital music store. Using a normalized 11-table relational database (customers, invoices, tracks, albums, artists, genres, employees, playlists), it answers the kind of questions stakeholders actually ask — from *"who is our best customer?"* to *"which genre is most popular in each country?"*

| | |
|---|---|
| **Database** | 11-table relational schema (Chinook-style) |
| **Queries** | 20+ SQL queries — aggregations, multi-table joins, subqueries, window functions, CTEs |
| **Scope** | 11 business questions across 3 difficulty tiers (Easy → Moderate → Advanced) |
| **Tool** | MySQL |

## 🗂️ Repository Structure
```
music-store-analysis/
├── README.md            # Project documentation
├── queries.sql           # All SQL queries, organized by question
├── questions.pdf          # Business questions the project answers
├── schema_diagram.png      # Database ER diagram
└── data/                  # Raw CSV source data (12 tables)
```

## ❓ Business Questions Answered

**Set 1 — Easy**
| # | Question |
|---|---|
| 1 | Who is the most senior employee based on job title? |
| 2 | Which countries have the most invoices? |
| 3 | What are the top 3 values of total invoice? |
| 4 | Which city generated the highest total revenue (for a promotional music festival)? |
| 5 | Who is the best customer (highest total spend)? |

**Set 2 — Moderate**
| # | Question |
|---|---|
| 6 | Email, first name, last name & genre of all Rock Music listeners (alphabetical by email) |
| 7 | Top 10 rock bands by track count |
| 8 | Tracks longer than the average song length, ordered by length |

**Set 3 — Advanced**
| # | Question |
|---|---|
| 9 | Amount spent by each customer per artist |
| 10 | Most popular music genre per country, by purchase count (ties included) |
| 11 | Top-spending customer per country, handling ties |

## 🛠️ Tech Stack
`MySQL` · `Window Functions` · `CTEs` · `Subqueries` · `Multi-table Joins`

## 🔑 Key Techniques Used
- **Common Table Expressions (CTEs)** to break complex logic into readable, layered steps
- **Window functions** (`ROW_NUMBER() OVER (PARTITION BY ...)`) to rank customers within each country
- **Correlated & scalar subqueries** — e.g., filtering tracks longer than the dataset average
- **Multi-table joins** across a normalized 11-table schema (customer → invoice → invoice_line → track → album → artist → genre)
- **Tie-handling logic** so questions like "top customer per country" correctly return every customer sharing the maximum spend, not just one

## 📈 Key Insights
- **USA leads in order volume** — 131 invoices, ahead of Canada (76) and Brazil (61)
- **Prague is the top revenue city** — $273.24 in total invoice value, ahead of Mountain View and London — the recommended location for a promotional music festival
- **Best customer by lifetime spend:** František Wichterlová at $144.54
- **Rock dominates the catalog** — 1,297 of 3,503 tracks (37%) are tagged Rock
- **Led Zeppelin is the top Rock artist by track count** (114 tracks), ahead of U2 (112) and Deep Purple (92)

## 📊 Approach
1. Explored the schema (`schema_diagram.png`) to map relationships across customers, invoices, tracks, albums, artists, and genres
2. Answered Easy-tier questions with straightforward aggregations and sorting
3. Moved to Moderate-tier questions requiring multi-table joins and subqueries on genre/track data
4. Solved Advanced-tier questions with CTEs and window functions to rank spend/genre popularity per country, correctly handling ties

## 📁 Dataset
Chinook-style music store database with 12 related tables (customers, invoices, tracks, albums, artists, genres, employees, playlists). Full ER diagram included as `schema_diagram.png`.

## 🚀 How to Run
1. Import the CSVs in `data/` into a MySQL database (or use the Chinook schema directly)
2. Run the queries in `queries.sql` against the `music` database

---
*Part of a Data Analyst project portfolio — feedback and suggestions welcome.*
