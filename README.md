# ola_sales_analysis
1. Retrieve all successful bookings ✅

✔️ Correct

CREATE VIEW successful_bookings AS
SELECT *
FROM bookings
WHERE booking_status = 'success';

2. Average ride distance for each vehicle type


CREATE VIEW average_ride_distance AS
SELECT vehicle_type,
       AVG(ride_distance) AS avg_ride_distance
FROM bookings
GROUP BY vehicle_type;

3. Total number of rides cancelled by customers


CREATE VIEW cancelled_rides_by_customers AS
SELECT COUNT(*) AS total_cancelled_rides
FROM bookings
WHERE booking_status = 'Canceled by Customer';

4. Top 5 customers with highest number of rides


✅ Best practice: use a normal query (not a view)

SELECT customer_id,
       COUNT(booking_id) AS total_rides
FROM bookings
GROUP BY customer_id
ORDER BY total_rides DESC
LIMIT 5;


(If your DB allows it, your view will still work—but this is the correct interview-style answer.)

5. Rides cancelled by drivers (personal & car-related issues)


CREATE VIEW cancelled_by_drivers AS
SELECT canceled_rides_by_driver,
       COUNT(*) AS total_cancelled_rides
FROM bookings
WHERE canceled_rides_by_driver = 'personal & car related issue'
GROUP BY canceled_rides_by_driver;

6. Max & Min driver ratings for Prime Sedan

✔️ Correct logic, just add aliases

CREATE VIEW max_min_rating_of_driver AS
SELECT vehicle_type,
       MAX(driver_ratings) AS max_rating,
       MIN(driver_ratings) AS min_rating
FROM bookings
WHERE vehicle_type = 'prime sedan'
GROUP BY vehicle_type;

7. Rides paid using UPI

✔️ Correct

CREATE VIEW rides_pay_upi AS
SELECT *
FROM bookings
WHERE payment_method = 'upi';

8. Average customer rating per vehicle type

✔️ Correct, add alias

CREATE VIEW avg_customer_rating_per_vehicle AS
SELECT vehicle_type,
       AVG(customer_rating) AS avg_customer_rating
FROM bookings
GROUP BY vehicle_type;

9. Total booking value of successful rides


CREATE VIEW total_booking_val_of_ride_complete AS
SELECT SUM(booking_value) AS total_booking_value
FROM bookings
WHERE booking_status = 'success';

10. Incomplete rides with reason

✔️ Correct

CREATE VIEW all_incomplete_rides AS
SELECT booking_id,
       incomplete_rides_reason
FROM bookings
WHERE incomplete_rides = 'yes';
