#!/bin/bash

cd /media/sf_Condivisa #go to mounted share drive of master if running on virtual machine
sudo service mongod start
mongo --eval "use autoscout_scraping" #crea database

#import 1mo json in mongo
mongoimport --db autoscout_scraping --collection ds_main_offers_page --file export_output_scraping.json --jsonArray
mongo --eval "db.sc_main_offers_page.find({})" autoscout_scraping
	
#import 2ndo json in mongo
mongoimport --db autoscout_scraping --collection ds_single_offers_page --file export_output_single_offers_scraping.json --jsonArray

mongo --eval "db.sc_single_offers_page.find({})" autoscout_scraping
#the i use Mongodb compass to export to csv to process with OpenRefine as it is lengthy to specify all fields in bash