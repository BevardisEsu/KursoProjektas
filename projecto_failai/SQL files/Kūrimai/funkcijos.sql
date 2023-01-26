#===============================FUNKCIJOS=====================================
CREATE Function pasikartojancios_salys(iso varchar(20))
    returns varchar(20)
    deterministic
BEGIN
    DECLARE atsakymas int;
SELECT COUNT(*) INTO atsakymas FROM eshop.adresess WHERE eshop.adresess.country_iso = country_iso;
return atsakymas;
end;


CREATE Function pasikartojancios_salys(iso varchar(20))
    returns varchar(20)
    deterministic
BEGIN
    DECLARE atsakymas int;
SELECT COUNT(*) INTO atsakymas FROM eshop.adresess WHERE eshop.adresess.country_iso = iso;
return atsakymas;
end;

SELECT  * From pasikartojancios_salys(PL);


DROP function pasikartojancios_salys;

CREATE Function pasikartojancios_salys(iso varchar(20))
    returns varchar(20)
    deterministic
BEGIN
    DECLARE atsakymas int;
SELECT COUNT(*) INTO atsakymas FROM eshop.adresess WHERE
        CONVERT(eshop.adresess.country_iso USING utf8mb4) = CONVERT(iso USING utf8mb4);
return atsakymas;
end;


SELECT pasikartojancios_salys('CN');

SELECT COUNT(*) FROM countries where iso='PL';

SELECT pasikartojancios_salys('PL') AS kiekis, iso from countries HAVING kiekis > 0 ORDER BY kiekis DESC;