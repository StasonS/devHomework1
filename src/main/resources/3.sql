SELECT sum(salary)
FROM developers d
  JOIN dev_skill ds ON d.id = ds.dev_id
  JOIN skills s ON ds.skill_id = s.id
WHERE skill_name = 'Java' AND s.id = ds.skill_id
      AND ds.dev_id = d.id