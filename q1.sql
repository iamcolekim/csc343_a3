-- ============================================================
-- Q1
-- For each concert, report:
--   - total number of tickets sold
--   - total value of tickets sold
--   - percentage of the venue that was sold
-- ============================================================

SELECT
    c.concert_id,
    c.name AS concert_name,
    COUNT(t.ticket_id) AS tickets_sold,
    COALESCE(SUM(t.price), 0) AS total_revenue,
    ROUND(
        COUNT(t.ticket_id) * 100.0 / COUNT(DISTINCT s.seat_id),
        2
    ) AS percent_sold
FROM Concert c
JOIN Venue v
    ON c.venue_id = v.venue_id
JOIN Section sec
    ON v.venue_id = sec.venue_id
JOIN Seat s
    ON sec.section_id = s.section_id
LEFT JOIN Ticket t
    ON t.concert_id = c.concert_id
   AND t.seat_id = s.seat_id
GROUP BY
    c.concert_id,
    c.name
ORDER BY
    c.concert_id;