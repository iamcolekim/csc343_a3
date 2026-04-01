/*
Could not:
- It is not possible to enforce that every venue has at least 10 seats
  using only DDL without assertions or triggers.
- It is not possible to enforce that a ticket's price matches the
  TicketPrice table at insertion time without triggers.

Did not:
- All enforceable constraints from the specification were enforced.

Extra constraints:
- Enforced non-negative ticket prices.
- Enforced uniqueness of section names within a venue.
- Enforced uniqueness of seat labels within a section.
- Enforced that only one concert can occur at a venue at a given time.

Assumptions:
- Seat accessibility is a permanent property of a seat and does not vary
  by concert.
- Ticket prices are recorded both at purchase time and separately in the
  pricing table to preserve historical price information.
- Owner phone numbers uniquely identify owners.
*/

--------------------------------------------------
-- Standard Preamble
--------------------------------------------------
DROP SCHEMA IF EXISTS TicketSchema CASCADE;
CREATE SCHEMA TicketSchema;
SET search_path TO TicketSchema;

--------------------------------------------------
-- Owners of venues (people or organizations)
--------------------------------------------------
CREATE TABLE Owner (
    owner_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    phone_number TEXT NOT NULL UNIQUE
);

--------------------------------------------------
-- Venues where concerts are held
--------------------------------------------------
CREATE TABLE Venue (
    venue_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    city TEXT NOT NULL,
    street_address TEXT NOT NULL,
    owner_id INTEGER NOT NULL REFERENCES Owner(owner_id)
);

--------------------------------------------------
-- Sections within a venue
--------------------------------------------------
CREATE TABLE Section (
    section_id SERIAL PRIMARY KEY,
    venue_id INTEGER NOT NULL REFERENCES Venue(venue_id),
    name TEXT NOT NULL,
    UNIQUE (venue_id, name)
);

--------------------------------------------------
-- Individual seats within a section
--------------------------------------------------
CREATE TABLE Seat (
    seat_id SERIAL PRIMARY KEY,
    section_id INTEGER NOT NULL REFERENCES Section(section_id),
    seat_label TEXT NOT NULL,
    is_accessible BOOLEAN NOT NULL,
    UNIQUE (section_id, seat_label)
);

--------------------------------------------------
-- Concerts held at venues
--------------------------------------------------
CREATE TABLE Concert (
    concert_id SERIAL PRIMARY KEY,
    venue_id INTEGER NOT NULL REFERENCES Venue(venue_id),
    name TEXT NOT NULL,
    concert_datetime TIMESTAMP NOT NULL,
    UNIQUE (venue_id, concert_datetime)
);

--------------------------------------------------
-- Users of the ticketing application
--------------------------------------------------
CREATE TABLE AppUser (
    user_id SERIAL PRIMARY KEY,
    username TEXT NOT NULL UNIQUE
);

--------------------------------------------------
-- Ticket prices by concert and section
--------------------------------------------------
CREATE TABLE TicketPrice (
    concert_id INTEGER NOT NULL REFERENCES Concert(concert_id),
    section_id INTEGER NOT NULL REFERENCES Section(section_id),
    price NUMERIC(8,2) NOT NULL CHECK (price >= 0),
    PRIMARY KEY (concert_id, section_id)
);

--------------------------------------------------
-- Tickets purchased by users
--------------------------------------------------
CREATE TABLE Ticket (
    ticket_id SERIAL PRIMARY KEY,
    concert_id INTEGER NOT NULL REFERENCES Concert(concert_id),
    seat_id INTEGER NOT NULL REFERENCES Seat(seat_id),
    user_id INTEGER NOT NULL REFERENCES AppUser(user_id),
    purchase_datetime TIMESTAMP NOT NULL,
    price NUMERIC(8,2) NOT NULL CHECK (price >= 0)
);