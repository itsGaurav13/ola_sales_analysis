SELECT * FROM bookings;
-- 1. Retrieve all successful bookings:

create view Successful_bookings as
select  *from bookings
where Booking_Status='success';

-- 1. Retrieve all successful bookings:
select *From Successful_bookings;

-- 2. Find the average ride distance for each vehicle type:
create view average_ride_distance as
select Vehicle_Type ,avg(Ride_Distance) from bookings
group by Vehicle_Type;

select*from average_ride_distance;
-- 3. Get the total number of cancelled rides by customers:

create view cancelled_rides_by_customers as
select count(*)From bookings
where Booking_Status='Canceled by Customer';

select*From cancelled_rides_by_customers;

-- 4. List the top 5 customers who booked the highest number of rides:
select *From bookings;

create view highest_booking as
select Customer_ID,count(Booking_ID) as total_rides
 from bookings
group by Customer_ID
order by total_rides desc limit 5;

select*From highest_booking;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
select*From bookings;

create view cancelled_by_drivers as 
select canceled_rides_by_driver ,count(Canceled_Rides_by_Driver) 
from bookings
where canceled_rides_by_driver = 'personal & car related issue'
group by canceled_rides_by_driver ;

select *From cancelled_by_drivers;

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
select*From bookings;

create view max_min_rating_of_driver as
select Vehicle_Type, max(Driver_Ratings),min(Driver_Ratings)
from bookings
where Vehicle_Type='prime sedan'
group by Vehicle_Type;

select *From max_min_rating_of_driver;
select  max(Driver_Ratings)From bookings
where Vehicle_Type='prime sedan';

-- 7. Retrieve all rides where payment was made using UPI:

select*From bookings;

create view rides_pay_upi as
select * From bookings
where Payment_Method='upi';

select *from rides_pay_upi;

-- 8. Find the average customer rating per vehicle type:
select * From bookings;

create view avg_customer_rating_pr_vehicle as
select Vehicle_Type,avg(Customer_Rating)
From bookings
group by Vehicle_Type;

select*From avg_customer_rating_pr_vehicle;

-- 9. Calculate the total booking value of rides completed successfully:
create view total_booking_val_of_ride_complete as
select sum(Booking_Value)From bookings
where Booking_Status ='success';

select*From total_booking_val_of_ride_complete;

-- 10. List all incomplete rides along with the reason:
select * From bookings;

create view all_incomplete_rides as
select  Booking_ID,Incomplete_Rides_Reason
From bookings
where Incomplete_Rides='yes';

select*From all_incomplete_rides;
