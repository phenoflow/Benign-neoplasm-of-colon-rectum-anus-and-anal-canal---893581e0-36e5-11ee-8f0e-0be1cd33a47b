# Kuan V, Denaxas S, Gonzalez-Izquierdo A, Direk K, Bhatti O, Husain S, Sutaria S, Hingorani M, Nitsch D, Parisinos C, Lumbers T, Mathur R, Sofat R, Casas JP, Wong I, Hemingway H, Hingorani A, 2023.

import sys, csv, re

codes = [{"code":"771G400","system":"readv2"},{"code":"7722.11","system":"readv2"},{"code":"7722.12","system":"readv2"},{"code":"7726112.0","system":"readv2"},{"code":"7726212.0","system":"readv2"},{"code":"B713.11","system":"readv2"},{"code":"J570.00","system":"readv2"},{"code":"J570000","system":"readv2"},{"code":"J570100","system":"readv2"},{"code":"J570z00","system":"readv2"},{"code":"J578.00","system":"readv2"},{"code":"J578.11","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('benign-neoplasm-of-colon-rectum-anus-and-anal-canal-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["benign-neoplasm-of-colon-rectum-anus-and-anal-canal-polypectomy---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["benign-neoplasm-of-colon-rectum-anus-and-anal-canal-polypectomy---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["benign-neoplasm-of-colon-rectum-anus-and-anal-canal-polypectomy---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
