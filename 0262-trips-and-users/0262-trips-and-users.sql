# Write your MySQL query statement below

-- select request_at as Day, count(*) as Cancellation_Rate
-- from trips t join users u1 on t.client_id = u1.users_id 
--              join users u2 on t.driver_id = u2.users_id
-- where  t.status in ("cancelled_by_driver", "cancelled_by_client")  
-- group by request_at 


-- select count(*)
-- from trips t join users u1 on t.client_id = u1.users_id 
--               join users u2 on t.driver_id = u2.users_id 
--               where t.client_id in (select users_id from users where banned = "no") and 
--                     t.driver_id in (select users_id from users where banned = "no")
-- group by request_at 


-- SELECT
--     t.request_at,
--     SUM(
--         CASE 
--             WHEN t.status IN ('cancelled_by_driver', 'cancelled_by_client')
--             THEN 1
--             ELSE 0
--         END
--     ) AS cancelled_count
-- FROM trips t
-- JOIN users u1 ON t.client_id = u1.users_id AND u1.banned = 'no'
-- JOIN users u2 ON t.driver_id = u2.users_id AND u2.banned = 'no'
-- GROUP BY t.request_at;


SELECT
    t.request_at as Day,
    ROUND(
        SUM(
            CASE 
                WHEN t.status IN ('cancelled_by_driver', 'cancelled_by_client')
                THEN 1
                ELSE 0
            END
        ) * 1.0 / COUNT(*),
        2
    ) AS `Cancellation Rate`
FROM trips t
JOIN users u1 ON t.client_id = u1.users_id AND u1.banned = 'no'
JOIN users u2 ON t.driver_id = u2.users_id AND u2.banned = 'no'
WHERE t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY t.request_at;
