# xltransactioncheck
xl bulk transaction check 

bash script to check xl transaction status.

# Run Script
bash xltransactioncheck.sh ccidlist.txt wso2carbon.log.2019-08-24.gz output.xlsx

# example
ccidlist.txt file

C-d02f94c1-7d5c-4096-b60a-b2def141c6ed
C-3373b6a6-b0e2-4adc-999e-5436a3fb3b9c
C-849b09f7-2edd-4278-8dfc-932dc974ecc1
C-bb059070-1918-45ba-bc4f-9e5d27e93bbc
C-88cea9df-023c-436d-8206-0ace5a1f1099
C-a1fbaa5f-3661-406b-8312-e02bab621020
C-fa5644a5-4dc1-46cc-b925-15059f92531e
C-05f632fb-5a90-4a8d-8403-0d056113cf51
C-51d35791-868d-462a-94de-622aec2c34e5
C-cbfb6264-2c05-4bc7-968f-1ee819f43943


# output.xlsx

C-8eb8421c-7b95-4f12-b38a-e0b7aeee7d50	Request has been execute successfully	Charged
C-0d8d0c36-50df-4bb2-be96-8cb6b9a44e52	Insufficient Balance	Not Charged
C-807f2607-9290-49e7-898e-ccb6afc6fae7	Request has been execute successfully	Charged
C-edeac461-bc6b-4405-bb22-5193bcfd4ea6	Insufficient Balance	Not Charged
C-858b9f8b-48fb-4cb5-bc51-33539d896042	Request has been execute successfully	Charged
C-22ddf47a-8231-4822-92aa-831b368bb2ef	CCID Not Present	No Status
