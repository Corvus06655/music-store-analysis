from pathlib import Path
import matplotlib.pyplot as plt
import pandas as pd

ROOT = Path('/home/ubuntu/github_review/clones/music-store-analysis')
DATA = ROOT / 'data'
out_dir = ROOT / 'images'
out_dir.mkdir(exist_ok=True)

invoice_line = pd.read_csv(DATA / 'invoice_line.csv')
track = pd.read_csv(DATA / 'track.csv')
genre = pd.read_csv(DATA / 'genre.csv')
merged = invoice_line.merge(track[['track_id', 'genre_id']], on='track_id', how='left').merge(genre, on='genre_id', how='left')
merged['line_revenue'] = merged['unit_price'] * merged['quantity']
top = merged.groupby('name')['line_revenue'].sum().sort_values(ascending=False).head(10).sort_values()

plt.style.use('seaborn-v0_8-whitegrid')
fig, ax = plt.subplots(figsize=(10, 5.5), dpi=160)
top.plot(kind='barh', ax=ax, color='#2f6f9f')
ax.set_title('Top 10 Genres by Invoice-Line Revenue')
ax.set_xlabel('Revenue from invoice lines')
ax.set_ylabel('Genre')
for spine in ['top', 'right']:
    ax.spines[spine].set_visible(False)
fig.tight_layout()
fig.savefig(out_dir / 'genre_revenue.png', bbox_inches='tight')
