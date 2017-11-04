SELECT project_name, cost, avg(salary) AS avg_salary
FROM
  developers dev
  JOIN project_developer pd ON dev.id = pd.dev_id
  JOIN projects pr ON pd.project_id = pr.id
GROUP BY project_name, cost
ORDER BY cost
LIMIT 1