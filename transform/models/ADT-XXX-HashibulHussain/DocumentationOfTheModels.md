-- transform/models/ADT-HashibulHussain/DocumentationOfTheModels.md

# Q1

This model calculates the total GMV by country. The total gmv is rounded off to the nearest two decimals. 

## Columns Used from the Dataset

- `country_name` Name of country.
- `total_gmv` GMV calculated for each country.

# Q2

This model calculates the GMV of vendors in Taiwan, ordered by their customer count. Two datasets are joined using 'Join'. The total gmv is rounded off to the nearest two decimals. 

## Columns Used from the Dataset

- `vendor_name` Name of the Vendor.
- `customer_count `Number of customer
- `total_gmv `  GMV calculated for vendor.

# Q3

This model calculates the top active vendor by GMV in each country. Two datasets are joined using 'Join'. The total gmv is rounded off to the nearest two decimals. 

## Columns Used from the Dataset

- `country_name` Name of the Country.
- `vendor_name` Number of the vendor.
- `total_gmv` GMV calculated for top active vendor of each country.

# Q4

This model calculates the top 2 vendors of each country, per year.

## Columns Used from the Dataset

- `year` Year of the record.
- `country_name` Name of the Country.
- `vendor_name` Number of the vendor.
- `total_gmv` GMV calculated for top two vendors of each country.
