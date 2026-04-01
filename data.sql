SET search_path TO TicketSchema;

-- ============================================================
-- Owners
-- 5 owners total; one owns 3+ venues (q2 requirement)
-- ============================================================

INSERT INTO Owner (name, phone_number) VALUES
    ('Big Live Nation', '416-555-1000'),   -- owner_id = 1
    ('Indie Events Co', '416-555-2000'),   -- owner_id = 2
    ('City of Toronto', '416-555-3000'),   -- owner_id = 3
    ('Music Group Inc', '416-555-4000'),   -- owner_id = 4
    ('Private Owner', '416-555-5000');     -- owner_id = 5


-- ============================================================
-- Venues
-- 10 venues total; owner 1 owns 3 venues (q2)
-- ============================================================

INSERT INTO Venue (name, city, street_address, owner_id) VALUES
    ('Maple Hall', 'Toronto', '1 King St', 1),   -- venue_id = 1
    ('Harbour Theatre', 'Toronto', '10 Queen St', 1),
    ('Sky Arena', 'Toronto', '99 Front St', 1),
    ('Indie Loft', 'Toronto', '50 Dundas St', 2),
    ('Civic Centre', 'Toronto', '100 Bay St', 3),
    ('Sound Dome', 'Toronto', '200 Yonge St', 4),
    ('Open Air Park', 'Toronto', '300 Bloor St', 5),
    ('Echo Hall', 'Toronto', '400 College St', 2),
    ('Metro Stage', 'Toronto', '500 Spadina Ave', 3),
    ('North End Hall', 'Toronto', '600 Finch Ave', 4);


-- ============================================================
-- Sections
-- Each venue has exactly 2 sections: Floor and Balcony
-- ============================================================

INSERT INTO Section (venue_id, name) VALUES
    (1, 'Floor'), (1, 'Balcony'),
    (2, 'Floor'), (2, 'Balcony'),
    (3, 'Floor'), (3, 'Balcony'),
    (4, 'Floor'), (4, 'Balcony'),
    (5, 'Floor'), (5, 'Balcony'),
    (6, 'Floor'), (6, 'Balcony'),
    (7, 'Floor'), (7, 'Balcony'),
    (8, 'Floor'), (8, 'Balcony'),
    (9, 'Floor'), (9, 'Balcony'),
    (10, 'Floor'), (10, 'Balcony');


-- ============================================================
-- Seats
-- 9 venues: 10 seats (1 accessible)
-- Venue 1: 12 seats (4 accessible) → ≥25% accessible (q3)
-- ============================================================

-- Venue 1 (special accessibility case)
INSERT INTO Seat (section_id, seat_label, is_accessible) VALUES
    (1, 'F1', TRUE), (1, 'F2', TRUE), (1, 'F3', TRUE),
    (1, 'F4', FALSE), (1, 'F5', FALSE), (1, 'F6', FALSE),
    (2, 'B1', TRUE),
    (2, 'B2', FALSE), (2, 'B3', FALSE),
    (2, 'B4', FALSE), (2, 'B5', FALSE), (2, 'B6', FALSE);

-- Venues 2–10: 10 seats each, 1 accessible
-- Pattern repeated intentionally for clarity

INSERT INTO Seat (section_id, seat_label, is_accessible) VALUES
    -- Venue 2
    (3, 'F1', TRUE), (3, 'F2', FALSE), (3, 'F3', FALSE),
    (3, 'F4', FALSE), (3, 'F5', FALSE),
    (4, 'B1', FALSE), (4, 'B2', FALSE), (4, 'B3', FALSE),
    (4, 'B4', FALSE), (4, 'B5', FALSE),

    -- Venue 3
    (5, 'F1', TRUE), (5, 'F2', FALSE), (5, 'F3', FALSE),
    (5, 'F4', FALSE), (5, 'F5', FALSE),
    (6, 'B1', FALSE), (6, 'B2', FALSE), (6, 'B3', FALSE),
    (6, 'B4', FALSE), (6, 'B5', FALSE),

    -- Venue 4
    (7, 'F1', TRUE), (7, 'F2', FALSE), (7, 'F3', FALSE),
    (7, 'F4', FALSE), (7, 'F5', FALSE),
    (8, 'B1', FALSE), (8, 'B2', FALSE), (8, 'B3', FALSE),
    (8, 'B4', FALSE), (8, 'B5', FALSE),

    -- Venue 5
    (9, 'F1', TRUE), (9, 'F2', FALSE), (9, 'F3', FALSE),
    (9, 'F4', FALSE), (9, 'F5', FALSE),
    (10, 'B1', FALSE), (10, 'B2', FALSE), (10, 'B3', FALSE),
    (10, 'B4', FALSE), (10, 'B5', FALSE),

    -- Venue 6
    (11, 'F1', TRUE), (11, 'F2', FALSE), (11, 'F3', FALSE),
    (11, 'F4', FALSE), (11, 'F5', FALSE),
    (12, 'B1', FALSE), (12, 'B2', FALSE), (12, 'B3', FALSE),
    (12, 'B4', FALSE), (12, 'B5', FALSE),

    -- Venue 7
    (13, 'F1', TRUE), (13, 'F2', FALSE), (13, 'F3', FALSE),
    (13, 'F4', FALSE), (13, 'F5', FALSE),
    (14, 'B1', FALSE), (14, 'B2', FALSE), (14, 'B3', FALSE),
    (14, 'B4', FALSE), (14, 'B5', FALSE),

    -- Venue 8
    (15, 'F1', TRUE), (15, 'F2', FALSE), (15, 'F3', FALSE),
    (15, 'F4', FALSE), (15, 'F5', FALSE),
    (16, 'B1', FALSE), (16, 'B2', FALSE), (16, 'B3', FALSE),
    (16, 'B4', FALSE), (16, 'B5', FALSE),

    -- Venue 9
    (17, 'F1', TRUE), (17, 'F2', FALSE), (17, 'F3', FALSE),
    (17, 'F4', FALSE), (17, 'F5', FALSE),
    (18, 'B1', FALSE), (18, 'B2', FALSE), (18, 'B3', FALSE),
    (18, 'B4', FALSE), (18, 'B5', FALSE),

    -- Venue 10
    (19, 'F1', TRUE), (19, 'F2', FALSE), (19, 'F3', FALSE),
    (19, 'F4', FALSE), (19, 'F5', FALSE),
    (20, 'B1', FALSE), (20, 'B2', FALSE), (20, 'B3', FALSE),
    (20, 'B4', FALSE), (20, 'B5', FALSE);


-- ============================================================
-- Concerts
-- 3 concerts: 0 tickets, 12 tickets, 55 tickets (q1)
-- ============================================================

INSERT INTO Concert (venue_id, name, concert_datetime) VALUES
    (1, 'Silent Night', '2026-04-01 20:00'),   -- concert_id = 1 (0 tickets)
    (2, 'Indie Showcase', '2026-04-02 20:00'), -- concert_id = 2 (12 tickets)
    (3, 'Mega Pop Tour', '2026-04-03 20:00');  -- concert_id = 3 (55 tickets)


-- ============================================================
-- Users
-- One heavy purchaser (q4)
-- ============================================================

INSERT INTO AppUser (username) VALUES
    ('superfan'),   -- user_id = 1
    ('casual1'),    -- user_id = 2
    ('casual2');    -- user_id = 3


-- ============================================================
-- Ticket Prices (by concert and section)
-- ============================================================

INSERT INTO TicketPrice (concert_id, section_id, price) VALUES
    (1, 1, 120.00), (1, 2, 80.00),
    (2, 3, 100.00), (2, 4, 70.00),
    (3, 5, 150.00), (3, 6, 90.00);


-- ============================================================
-- Tickets
-- Concert 2: 12 tickets
-- Concert 3: 55 tickets
-- User 'superfan' buys 30+ tickets (q4)
-- ============================================================

-- Concert 2 (12 tickets)
INSERT INTO Ticket (concert_id, seat_id, user_id, purchase_datetime, price)
SELECT
    2, seat_id, 1, '2026-03-01 10:00', 100.00
FROM Seat
WHERE section_id IN (3, 4)
LIMIT 12;

-- Concert 3 (55 tickets)
INSERT INTO Ticket (concert_id, seat_id, user_id, purchase_datetime, price)
SELECT
    3, seat_id,
    CASE WHEN seat_id % 2 = 0 THEN 1 ELSE 2 END,
    '2026-03-02 12:00',
    150.00
FROM Seat
WHERE section_id IN (5, 6)
LIMIT 55;
