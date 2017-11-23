CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`%` 
    SQL SECURITY DEFINER
VIEW `schedules` AS
    SELECT 
        `occupation_instructors`.`дата` AS `дата`,
        `sportsmanships`.`название` AS `спортвное_направление`,
        `gyms`.`название` AS `спортзал`,
        `gyms`.`улица` AS `спортзал_улица`,
        `gyms`.`дом` AS `спортзал_дом`,
        `instructors`.`фамилия` AS `фамилия_тренер`,
        `instructors`.`имя` AS `имя_тренер`
    FROM
        ((((`sportsmanships`
        JOIN `instructors`)
        JOIN `occupation_instructors`)
        JOIN `occupation_gyms`)
        JOIN `gyms`)
    WHERE
        ((`sportsmanships`.`id` = `instructors`.`sportsmanship_id`)
            AND (`instructors`.`id` = `occupation_instructors`.`id_instructor`)
            AND (`occupation_instructors`.`id` = `occupation_gyms`.`id`)
            AND (`occupation_gyms`.`id_gym` = `gyms`.`id`))
    ORDER BY `occupation_instructors`.`дата`