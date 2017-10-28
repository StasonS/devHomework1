CREATE TABLE developers(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  first_name VARCHAR(50) NOT NULL ,
  last_name VARCHAR(50) NOT NULL
);

CREATE TABLE skills(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  skill_name VARCHAR(50) NOT NULL
);

CREATE TABLE projects(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  project_name VARCHAR(50) NOT NULL
);

CREATE TABLE companies(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  project_name VARCHAR(50) NOT NULL
);

CREATE TABLE customers(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  project_name VARCHAR(50) NOT NULL
);

CREATE TABLE dev_skill (
  dev_id INT NOT NULL,
  skill_id INT NOT NULL,

  FOREIGN KEY (dev_id) REFERENCES developers(id),
  FOREIGN KEY (skill_id) REFERENCES skills(id),

  UNIQUE (dev_id, skill_id)
);

CREATE TABLE project_developer (
  project_id INT NOT NULL,
  dev_id INT NOT NULL,

  FOREIGN KEY (project_id) REFERENCES projects(id),
  FOREIGN KEY (dev_id) REFERENCES developers(id),

  UNIQUE (project_id, dev_id)
);

CREATE TABLE company_projects (
  company_id INT NOT NULL,
  project_id INT NOT NULL,

  FOREIGN KEY (company_id) REFERENCES companies(id),
  FOREIGN KEY (project_id) REFERENCES projects(id),

  UNIQUE (company_id, project_id)
);

CREATE TABLE customer_project (
  customer_id INT NOT NULL,
  project_id INT NOT NULL,

  FOREIGN KEY (customer_id) REFERENCES customers(id),
  FOREIGN KEY (project_id) REFERENCES projects(id),

  UNIQUE (customer_id, project_id)
);