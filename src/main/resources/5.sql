# DROP TEMPORARY TABLE IF EXISTS temp;
# DROP TEMPORARY TABLE IF EXISTS temp1;
#
# CREATE TEMPORARY TABLE temp AS (
#   SELECT
#     co.company_name,
#     cu.customer_name,
#     sum(cost) AS cost
#   FROM
#     customer_project cp
#     JOIN customers cu ON cp.customer_id = cu.id
#     JOIN projects ON cp.project_id = projects.id
#     JOIN company_projects cop ON projects.id = cop.project_id
#     JOIN companies co ON cop.company_id = co.id
#   GROUP BY co.id, cu.id
# );
#
# CREATE TEMPORARY TABLE temp1 as (
#   SELECT
#     company_name,
#     min(cost) AS cheapest
#   FROM temp
#   GROUP BY company_name
# );
#
# SELECT temp.company_name, temp.customer_name, temp1.cheapest
# FROM temp1 JOIN temp
#     ON cost = cheapest
#        AND temp.company_name = temp1.company_name;


SELECT table1.company_id, companies.company_name,
  SUBSTRING_INDEX(GROUP_CONCAT(table1.customer_id ORDER BY profit ASC), ',', 1) as customer_id,
  SUBSTRING_INDEX(GROUP_CONCAT(customer_name ORDER BY profit ASC), ',', 1) as customer_name,
  MIN(profit)
FROM (SELECT c.id company_id, cu.id customer_id, SUM(p.cost) AS profit
      FROM projects p
        JOIN company_projects ON p.id = company_projects.project_id
        JOIN companies c ON company_projects.company_id = c.id
        JOIN customer_project ON p.id = customer_project.project_id
        JOIN customers cu ON customer_project.customer_id = cu.id
      GROUP BY c.id, cu.id
     ) table1
  JOIN customers
    ON table1.customer_id = customers.id
  JOIN companies
    ON table1.company_id = companies.id
GROUP BY table1.company_id;