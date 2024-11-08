-- (i) EXPLAIN output of any query of your choice that involves the “postalCode” of the “customers” relation in the WHERE clause and that does not use any index to retrieve its results.

id|select_type|table    |partitions|type|possible_keys           |key|key_len|ref|rows|filtered|Extra      |
--+-----------+---------+----------+----+------------------------+---+-------+---+----+--------+-----------+
 1|SIMPLE     |customers|          |ALL |IDX_customers_postalCode|   |       |   |   6|   33.33|Using where|

-- (ii) Code to create a B+ Tree index on the column “postalCode” in the table “customers”. 

CREATE INDEX `IDX_for_customers_postalCode`
USING BTREE ON
customers (postalCode ASC)

-- (iii) EXPLAIN output of the same query showing that it is using the created index to retrieve the results.

id|select_type|table    |partitions|type|possible_keys                                        |key|key_len|ref|rows|filtered|Extra      |
--+-----------+---------+----------+----+-----------------------------------------------------+---+-------+---+----+--------+-----------+
 1|SIMPLE     |customers|          |ALL |IDX_customers_postalCode,IDX_for_customers_postalCode|   |       |   |   6|   33.33|Using where|