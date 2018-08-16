SELECT COUNT(*) as entries, title, year FROM Documents GROUP BY title, year HAVING entries > 1;
SELECT * FROM Documents WHERE title like "Umwelterziehung, Theorie & Praxis";

DELETE FROM Documents WHERE title like "Umwelterziehung, Theorie & Praxis";

DELETE FROM Documents WHERE id NOT IN (SELECT MAX(id) FROM Documents GROUP BY title,year);
