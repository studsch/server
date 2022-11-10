CREATE TABLE something (
    a int,
    b int,
    c int
);

INSERT INTO something(a, b, c) 
SELECT s.id, 1, 2
FROM generate_series(1,100000) AS s(id)
ORDER BY random();

EXPLAIN ANALYZE SELECT * FROM something where a = 1;

CREATE INDEX on something(a);

EXPLAIN ANALYZE SELECT * FROM something where a = 1;
