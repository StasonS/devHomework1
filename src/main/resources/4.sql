# ALTER TABLE projects ADD COLUMN cost DECIMAL;

UPDATE projects SET cost = 500 WHERE project_id=1;
UPDATE projects SET cost = 700 WHERE project_id=2;
UPDATE projects SET cost = 300 WHERE project_id=3;
UPDATE projects SET cost = 900 WHERE project_id=4;
UPDATE projects SET cost = 1000 WHERE project_id=5;
UPDATE projects SET cost = 400 WHERE project_id=6;
UPDATE projects SET cost = 960 WHERE project_id=7;
