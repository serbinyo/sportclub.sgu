CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`%` 
    SQL SECURITY DEFINER
VIEW `schedules` AS
    SELECT 
        `occupation-instructors`.`дата` AS `дата`,
        `sportsmanships`.`название` AS `спортвное_направление`,
        `gyms`.`название` AS `спортзал`,
        `gyms`.`улица` AS `спортзал_улица`,
        `gyms`.`дом` AS `спортзал_дом`,
        `instructors`.`фамилия` AS `фамилия_тренер`,
        `instructors`.`имя` AS `имя_тренер`
    FROM
        ((((`sportsmanships`
        JOIN `instructors`)
        JOIN `occupation-instructors`)
        JOIN `occupation-gyms`)
        JOIN `gyms`)
    WHERE
        ((`sportsmanships`.`id` = `instructors`.`sportsmanship_id`)
            AND (`instructors`.`id` = `occupation-instructors`.`id_instructor`)
            AND (`occupation-instructors`.`id` = `occupation-gyms`.`id`)
            AND (`occupation-gyms`.`id_gym` = `gyms`.`id`))
    ORDER BY `occupation-instructors`.`дата`