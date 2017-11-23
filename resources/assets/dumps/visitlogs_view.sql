CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`%` 
    SQL SECURITY DEFINER
VIEW `visit_logs` AS
    SELECT 
        `visitation-clients`.`id` AS `Посещение`,
        `clients`.`id` AS `номер_клиента`,
        `clients`.`фамилия` AS `фамилия`,
        `clients`.`имя` AS `имя`,
        `clients`.`отчество` AS `отчество`,
        `occupation-gyms`.`id` AS `номер_занятия`,
        `sportsmanships`.`название` AS `спортвное_направление`,
        `gyms`.`название` AS `спортзал`,
        `occupation-instructors`.`дата` AS `дата`
    FROM
        (((((((`visitation-clients`
        JOIN `visitation-gyms`)
        JOIN `clients`)
        JOIN `occupation-gyms`)
        JOIN `gyms`)
        JOIN `occupation-instructors`)
        JOIN `instructors`)
        JOIN `sportsmanships`)
    WHERE
        ((`clients`.`id` = `visitation-clients`.`id_client`)
            AND (`visitation-clients`.`id` = `visitation-gyms`.`id`)
            AND (`visitation-gyms`.`id_occupation` = `occupation-gyms`.`id`)
            AND (`occupation-gyms`.`id_gym` = `gyms`.`id`)
            AND (`occupation-gyms`.`id` = `occupation-instructors`.`id`)
            AND (`occupation-instructors`.`id_instructor` = `instructors`.`id`)
            AND (`instructors`.`sportsmanship_id` = `sportsmanships`.`id`))
    ORDER BY `visitation-clients`.`id`