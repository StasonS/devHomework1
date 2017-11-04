ALTER TABLE projects ADD COLUMN cost DECIMAL;

UPDATE projects SET cost = 500 WHERE id=1;
UPDATE projects SET cost = 700 WHERE id=2;
UPDATE projects SET cost = 300 WHERE id=3;
UPDATE projects SET cost = 900 WHERE id=4;
UPDATE projects SET cost = 1000 WHERE id=5;
UPDATE projects SET cost = 400 WHERE id=6;
UPDATE projects SET cost = 960 WHERE id=7;
