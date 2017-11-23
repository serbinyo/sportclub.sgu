CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`%` 
    SQL SECURITY DEFINER
VIEW `visit_logs` AS
    SELECT 
        `visitation_clients`.`id` AS `Посещение`,
        `clients`.`id` AS `номер_клиента`,
        `clients`.`фамилия` AS `фамилия`,
        `clients`.`имя` AS `имя`,
        `clients`.`отчество` AS `отчество`,
        `occupation_gyms`.`id` AS `номер_занятия`,
        `sportsmanships`.`название` AS `спортвное_направление`,
        `gyms`.`название` AS `спортзал`,
        `occupation_instructors`.`дата` AS `дата`
    FROM
        (((((((`visitation_clients`
        JOIN `visitation_gyms`)
        JOIN `clients`)
        JOIN `occupation_gyms`)
        JOIN `gyms`)
        JOIN `occupation_instructors`)
        JOIN `instructors`)
        JOIN `sportsmanships`)
    WHERE
        ((`clients`.`id` = `visitation_clients`.`id_client`)
            AND (`visitation_clients`.`id` = `visitation_gyms`.`id`)
            AND (`visitation_gyms`.`id_occupation` = `occupation_gyms`.`id`)
            AND (`occupation_gyms`.`id_gym` = `gyms`.`id`)
            AND (`occupation_gyms`.`id` = `occupation_instructors`.`id`)
            AND (`occupation_instructors`.`id_instructor` = `instructors`.`id`)
            AND (`instructors`.`sportsmanship_id` = `sportsmanships`.`id`))
    ORDER BY `visitation_clients`.`id`