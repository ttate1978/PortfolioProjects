                                     -- Dallas Airbnb Analysis --

-- A look at a Dallas Texas Airbnb dataset
--  A look at the number of sellers in the Dallas Texas Airbnb market
-- A look at the number of sellers by District in the Dallas Texas AirBnB market
--- A look at the number of units by Dallas Neighbourhood


select * from listing_table;

select count(host_id) from listing_table;

select distinct  host_id as Seller, id as PropertyId,count(id) as PropertyCount from listing_table group by host_id, id;

select neighbourhood,count(id) from listing_table group by neighbourhood;


-- A look at the price of  Dallas Airbnb, from highest to lowest
-- A look at the average price of Dallas Airbnb by neighbourhood
-- A look at the average price of Dallas Airbnb by Room-Type, and Neighbourhood
-- A look at the max price of Airbnb by neighborhood
-- A look at the min price of Airbnb by neighborhood
-- A look at total spend by the Airbnb property. The price includes the minimum days required.

select distinct id, price from listing_table order by price desc;

select neighbourhood,count(id), round(avg(price),2) from listing_table group by neighbourhood order by neighbourhood;

select room_type, neighbourhood,count(id), round(avg(price),2) from listing_table group by room_type, neighbourhood order by neighbourhood;

select neighbourhood, max(price) from listing_table group by neighbourhood;

select neighbourhood, max(price) from listing_table group by neighbourhood;

select id as AirBnb, neighbourhood, price, minimum_nights, (price*minimum_nights) as TotalCost from listing_table;