-- ============================================================
-- Q3
-- For each venue, report:
--   - total number of seats
--   - percentage of seats that are accessible
-- ============================================================

SELECT
    v.venue_id,
    v.name AS venue_name,
    COUNT(s.seat_id) AS total_seats,
    ROUND(
        SUM(CASE WHEN s.is_accessible THEN 1 ELSE 0 END)
        * 100.0 / COUNT(s.seat_id),
        2
    ) AS percent_accessible
FROM Venue v
JOIN Section sec
    ON v.venue_id = sec.venue_id
JOIN Seat s
    ON sec.section_id = s.section_id
GROUP BY
    v.venue_id,
    v.name
ORDER BY
    v.venue_id;