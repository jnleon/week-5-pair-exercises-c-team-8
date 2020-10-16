-- select the park name, campground name, open_from_mm, open_to_mm & daily_fee ordered by park name and then campground name
SELECT park.name, c.name, open_from_mm, open_to_mm, daily_fee
FROM park
JOIN campground c ON park.park_id = c.park_id
ORDER BY park.name, c.name

-- select the park name and the total number of campgrounds for each park ordered by park name

SELECT park.name , COUNT(c.campground_id) AS 'total number of campgrounds'
FROM park
JOIN campground c ON park.park_id = c.park_id
GROUP BY park.name
ORDER BY park.name

-- select the park name, campground name, site number, max occupancy, accessible, max rv length, utilities where the campground name is 'Blackwoods'

SELECT park.name, c.name, s.site_number, s.max_occupancy, s.accessible, s.max_rv_length, s.utilities
FROM park
JOIN campground c ON park.park_id = c.park_id
JOIN site S ON c.campground_id = s.campground_id
WHERE c.name = 'Blackwoods'

/*
  select park name, campground, total number of sites (column alias 'number_of_sites') ordered by park
  data should look like below:
  -------------------------------------------------
    park				campground							number_of_sites
	Acadia				Blackwoods							12
    Acadia				Seawall								12
    Acadia				Schoodic Woods						12
    Arches				"Devil's Garden"					8
    Arches				Canyon Wren Group Site				1
    Arches				Juniper Group Site					1
    Cuyahoga Valley		The Unnamed Primitive Campsites		5
  -------------------------------------------------
*/
SELECT park.name, c.name, COUNT(s.site_id) AS 'number of sites'
FROM park
JOIN campground c ON park.park_id = c.park_id
JOIN site S ON c.campground_id = s.campground_id
GROUP BY park.park_id, park.name, c.name
ORDER BY park.name,'number of sites' DESC ;



-- select site number, reservation name, reservation from and to date ordered by reservation from date

SELECT s.site_number, r.name, from_date, to_date 
FROM reservation r
JOIN site s ON s.site_id = r.site_id
ORDER BY from_date


/*
  select campground name, total number of reservations for each campground ordered by total reservations desc
  data should look like below:
  -------------------------------------------------
    name								total_reservations
	Seawall								13
    Blackwoods							9
    "Devil's Garden"					7
    Schoodic Woods						7
    Canyon Wren Group Site				4
    Juniper Group Site					4
  -------------------------------------------------
*/
SELECT c.name, COUNT(r.reservation_id) AS 'total reservations'
FROM campground c
JOIN site s ON s.campground_id = c.campground_id
JOIN reservation r ON r.site_id = s.site_id
GROUP BY c.name
ORDER BY 'total reservations' desc;
