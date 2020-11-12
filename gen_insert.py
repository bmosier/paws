# Script to generate SQL insert statements
#   note: does not validate SQL statements
#
import csv

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
        with open(f"{table}.csv") as csvfile:
            # The first row will be used as the schema
            schema = csvfile.readline()
             
            # We may need to wrap values in quotes for our insert statements
            for row in csvfile:
                row_values = ""
                for value in row:
                    # if it's a boolean or a number, don't change it
                    if value == "TRUE" or "FALSE" or isinstance(value, int) or isinstance(value, float):
                        row_values = row_values + "\"" + value
                    # if it is a properly quoted string, don't change it
                    if value.find("\""):
                        row_values = row_values.append(value)
                    else: # wrap it with quotes
                        row_values = row_values.append("\"" + value + "\"")


                outfile.write(f"INSERT INTO {table}({schema}) VALUES ({row_values});")
                print("\n");
            csvfile.close()
    except FileNotFoundError:
        print(f"{table}.csv not found, skipping...")

outfile.close()
