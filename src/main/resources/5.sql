SELECT company_name, /*project_name,*/ cost, customer_name /*sum(cost)*/
FROM customers, customer_project, projects, company_projects, companies
WHERE
  companies.id = company_projects.company_id AND
  company_projects.project_id = projects.id AND
  customer_project.project_id = projects.id AND
  customers.id = customer_project.customer_id
# GROUP BY company_name