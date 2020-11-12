# Script to generate SQL insert statements
#   note: does not validate SQL statements
#
import csv
import os

# PAWS Schema (and csv filenames)
tables = [
    "Animal",
    "Adoption",
    "FosterHome_Animal",
    "Shelter",
    "StaffMember",
    "Intake",
    "StaffMember_Shelter",
    "Customer",
    "FosterHome",
    "Volunteer",
    "Volunteer_Shelter"
]

# Create and open outfile, write over existing

outfile = open("outfile.sql", "w")


# Generate insert statements
for table in tables:
    try:
        # Note: first row of the csv file must contain headers
        with open(f"../sample_data/{table}.csv") as csvfile:
            # The first row will be used for the keys
            myreader = csv.DictReader(csvfile)
            for row in myreader:

                schema = ", ".join((*row.keys(),)).replace("\'", '')
                values = *row.values(),
                #clean_values = list()
                # for value in values:
                #     _value = None
                #     if isinstance(value, int):
                #        _value = int(value)
                #     if isinstance(value, float):
                #         _value = float(value)
                #     clean_values.append(_value)
                
                # clean_values = *clean_values,

                outfile.write(f"INSERT INTO {table}({schema}) VALUES {values};")
                outfile.write("\n")

            csvfile.close()
    except FileNotFoundError:
        print(f"{table}.csv not found, skipping...")
outfile.close()