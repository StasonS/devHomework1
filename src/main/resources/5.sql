DROP TEMPORARY TABLE IF EXISTS temp;
DROP TEMPORARY TABLE IF EXISTS temp1;

CREATE TEMPORARY TABLE temp AS (
  SELECT
    co.company_name,
    cu.customer_name,
    sum(cost) AS cost
  FROM
    customer_project cp
    JOIN customers cu ON cp.customer_id = cu.id
    JOIN projects ON cp.project_id = projects.id
    JOIN company_projects cop ON projects.id = cop.project_id
    JOIN companies co ON cop.company_id = co.id
  GROUP BY co.id, cu.id
);

CREATE TEMPORARY TABLE temp1 as (
  SELECT
    company_name,
    min(cost) AS cheapest
  FROM temp
  GROUP BY company_name
);

SELECT temp.company_name, temp.customer_name, temp1.cheapest
FROM temp1 JOIN temp
    ON cost = cheapest
       AND temp.company_name = temp1.company_name;
