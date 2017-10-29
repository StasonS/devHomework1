SELECT project_name, sum(salary) FROM developers, project_developer, projects
WHERE project_developer.project_id=projects.id
      AND project_developer.dev_id=developers.id
GROUP BY project_name
ORDER BY sum(salary) DESC
LIMIT 1