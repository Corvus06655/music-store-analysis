from pathlib import Path
import pandas as pd

ROOT = Path(__file__).resolve().parents[1]
DATA = ROOT / 'data'
checks = {
    'invoice.csv': 614,
    'invoice_line.csv': 4757,
    'track.csv': 3503,
    'artist.csv': 275,
    'genre.csv': 25,
    'customer.csv': 59,
}
for filename, expected_rows in checks.items():
    df = pd.read_csv(DATA / filename)
    assert len(df) == expected_rows, f'{filename}: expected {expected_rows} rows, found {len(df)}'

invoice = pd.read_csv(DATA / 'invoice.csv')
line = pd.read_csv(DATA / 'invoice_line.csv')
assert int(invoice['invoice_id'].duplicated().sum()) == 0, 'Duplicate invoice IDs found.'
assert int(line['invoice_line_id'].duplicated().sum()) == 0, 'Duplicate invoice-line IDs found.'
assert (invoice['total'] >= 0).all(), 'Invoice totals contain negative values.'
assert (line['quantity'] > 0).all(), 'Invoice-line quantities must be positive.'
print('Music Store validation passed')
print(f'invoices={len(invoice)} invoice_lines={len(line)} invoice_revenue={invoice["total"].sum():.2f}')
