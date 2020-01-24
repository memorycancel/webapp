docker run -d \
 --name db \
 -p 8080:8080 \
 -p 1521:1521 \
 -v /Users/memorycancel/Desktop/oracle_data:/u01/app/oracle \
 quay.io/maksymbilenko/oracle-12c
