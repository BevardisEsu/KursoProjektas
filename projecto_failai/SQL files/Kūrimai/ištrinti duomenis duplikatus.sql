delete countries
from countries
         inner join (select max(id) as lastId, iso
                     from countries
                     where iso in (select iso
                                   from countries
                                   group by iso
                                   having count(*) > 1)
                     group by iso) AS duplic on duplic.iso = countries.iso
where countries.id < duplic.lastId;


INSERT INTO countries (iso, title) select distinct country_iso as iso, 'n/a' from addresses;