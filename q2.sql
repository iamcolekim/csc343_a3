-- ============================================================
-- Q2
-- For each owner, report how many venues they own
-- ============================================================

SELECT
    o.owner_id,
    o.name AS owner_name,
    COUNT(v.venue_id) AS num_venues
FROM Owner o
LEFT JOIN Venue v
    ON o.owner_id = v.owner_id
GROUP BY
    o.owner_id,
    o.name
ORDER BY
    o.owner_id;
