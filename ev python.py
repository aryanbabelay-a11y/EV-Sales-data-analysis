import pandas as pd


df = pd.read_csv("D:/ev.csv")

from sqlalchemy import create_engine
engine = create_engine('postgresql://postgres:aryan@localhost:5432/postgres')
# Store DataFrame to SQL table
df.to_sql(
    name='ev_sales',        # Table name
    con=engine,             # Database connection
    if_exists='replace',    # Options: 'fail', 'replace', 'append'
    index=False             # Don't write DataFrame index as a column
)
df.head()
df.info()
df.describe(include='all')
df.isnull().sum()
df.columns=df.columns.str.lower()
df.columns=df.columns.str.replace(' ','_')
df.columns


#charts
import matplotlib.pyplot as plt

plt.figure(figsize=(10,5))
plt.plot(yearly_sales['Year'], yearly_sales['EV_Sales_Quantity'], marker='o')
plt.title('Year-wise EV Sales Trend')
plt.xlabel('Year')
plt.ylabel('EV Sales Quantity')
plt.grid(True)
plt.show()

top_states = state_sales.head(10)

plt.figure(figsize=(10,5))
plt.bar(top_states['State'], top_states['EV_Sales_Quantity'])
plt.title('Top 10 States by EV Sales')
plt.xlabel('State')
plt.ylabel('Total EV Sales')
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()

plt.figure(figsize=(8,5))
plt.bar(category_sales['Vehicle_Category'], category_sales['EV_Sales_Quantity'])
plt.title('EV Sales by Vehicle Category')
plt.xlabel('Vehicle Category')
plt.ylabel('Total EV Sales')
plt.tight_layout()
plt.show()

plt.figure(figsize=(10,5))
plt.bar(type_sales['Vehicle_Type'].head(10), type_sales['EV_Sales_Quantity'].head(10))
plt.title('Top Vehicle Types by EV Sales')
plt.xlabel('Vehicle Type')
plt.ylabel('Total EV Sales')
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()

plt.figure(figsize=(10,5))
plt.bar(month_sales['Month_Name'].astype(str), month_sales['EV_Sales_Quantity'])
plt.title('Month-wise EV Sales')
plt.xlabel('Month')
plt.ylabel('Total EV Sales')
plt.tight_layout()
plt.show()

yearly_sales['YoY_Growth_%'] = yearly_sales['EV_Sales_Quantity'].pct_change() * 100
print(yearly_sales)

category_sales['Share_%'] = (category_sales['EV_Sales_Quantity'] / df['EV_Sales_Quantity'].sum()) * 100
print(category_sales)

state_sales['Share_%'] = (state_sales['EV_Sales_Quantity'] / df['EV_Sales_Quantity'].sum()) * 100
print(state_sales.head(10))