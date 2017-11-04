SELECT project_name, sum(salary)
FROM
  developers d
  JOIN project_developer pd ON d.id = pd.dev_id
  JOIN projects p ON pd.project_id = p.id
WHERE pd.project_id = p.id
      AND pd.dev_id = d.id
GROUP BY project_name
ORDER BY sum(salary) DESC
LIMIT 1