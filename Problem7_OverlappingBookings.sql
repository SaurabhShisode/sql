-- Problem 7: Interval Overlap (Find conflicting bookings)
-- Schema: bookings(booking_id INT, room_id INT, start_ts TIMESTAMP, end_ts TIMESTAMP)

SELECT b1.booking_id AS booking_a, b2.booking_id AS booking_b, b1.room_id
FROM bookings b1
JOIN bookings b2
  ON b1.room_id = b2.room_id
 AND b1.booking_id < b2.booking_id
 AND b1.start_ts < b2.end_ts
 AND b2.start_ts < b1.end_ts;
