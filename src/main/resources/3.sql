SELECT sum(salary) FROM developers JOIN dev_skill, skills
WHERE skill_name = 'Java' AND skills.id = dev_skill.skill_id
      AND dev_id = developers.id