# MAPS: 
## Single Join
```
SELECT <origin data>, <foreign data>
FROM <origin tablename> AS <origin alias>
JOIN <foreign tablename> AS <foreign alias>
	ON <origin alias>.<foreign key on origin table> = <foreign alias>.<primary key on foreign table>
```