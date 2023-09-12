import yfinance as yf
import pandas as pd

# Define the symbols for sector ETFs (Technology, Healthcare, Finance)
symbols = ["XLK", "XLV", "XLF"]

# Define start and end dates for data
start_date = "2010-01-01"
end_date = "2021-01-01"

# Create an empty DataFrame to store the data
data = pd.DataFrame()

# Download historical stock price data for each symbol
for symbol in symbols:
    df = yf.download(symbol, start=start_date, end=end_date)
    df['Symbol'] = symbol  # Add a column for the symbol
    data = data.append(df)

# Save the downloaded data to a CSV file
data.to_csv("historical_stock_data.csv", index=False)
