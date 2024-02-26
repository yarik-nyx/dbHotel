--Сколько за все время потратил денег клиент за услуги
select client_id, concat(first_name, ' ', last_name) as "клиент" ,  sum(price) as "всего потрачено"
from service_order
join services using(service_id)
join client using(client_id)
group by 1,2
order by 3 desc

--Сколько за все время потратил денег клиент за номер
select client_id, concat(first_name, ' ', last_name) as "клиент", 
SUM((EXTRACT(day from (check_out_date)) - EXTRACT(day from (check_in_date))) * price_per_night) as "всего потрачено"
from check_in
join room using(room_id)
join client using(client_id)
where (check_in_date, check_out_date) is not null
group by 1, 2
order by 3 desc 


--Сколько всего потратил каждый клиент за все время
select client_id, concat(first_name, ' ', last_name) as "клиент", queryServ.sum_serv as "потрачено за услуги", queryRoom.sum_room "потрачено за номер", (COALESCE(queryServ.sum_serv, 0) + COALESCE(queryRoom.sum_room, 0)) as "всего"
from client
	left join 
	(select client_id, concat(first_name, ' ', last_name) as "клиент" ,  sum(price) as sum_serv
	from service_order
	join services using(service_id)
	join client using(client_id)
	group by 1,2) queryServ using(client_id)
	left join 
	(select client_id, concat(first_name, ' ', last_name) as "клиент", SUM((EXTRACT(day from (check_out_date)) - EXTRACT(day from (check_in_date))) * price_per_night) as sum_room
	from check_in
	join room using(room_id)
	join client using(client_id)
	where (check_in_date, check_out_date) is not null
	group by 1, 2)  queryRoom using(client_id)
order by 5 DESC


--На какую сумму сотрудник оказал услуг  
select service_order.employee_id, concat(first_name, ' ', last_name) as "клиент", SUM(price) as "сумма"
from service_order
join services using(service_id)
join employee using(employee_id)
where employee_id is not null
group by 1, 2
order by 3 desc

--Какую услугу чаще всего заказывают
select service_id, name as "услуга", COUNT(service_id) as "количество", (COUNT(service_id) * services.price) as "сумма"
from service_order
join services using(service_id)
group by 1, 2, services.price
order by 3 desc

--Какой номер чаще всего заказывают
select room_id, room_number, COUNT(room_id) as "количество", SUM((EXTRACT(day from (check_out_date)) - EXTRACT(day from (check_in_date))) * price_per_night) as "сумма"
from check_in
join room using(room_id)
where (check_in_date, check_out_date) is not null
group by 1, 2
order by 3 desc

--Список забронированных номеров
select room_id, room_number as "номер", concat(first_name, ' ', last_name) as "клиент"
from check_in
join client using(client_id)
join room using(room_id)
where (check_in_date, check_out_date) is null

--Список занятых номеров
select room_id, room_number as "номер", concat(first_name, ' ', last_name) as "клиент"
from check_in
join client using(client_id)
join room using(room_id)
where check_out_date is null and check_in_date is not null



--рандомный id свободного клиента
select client_id
from client
where client_id not in (
 select client_id
 from check_in
 where check_out_date is null or (check_in_date, check_out_date) is null
)
order by random()
limit 1

--рандомный id свободной комнаты
select room_id 
from room
where availability = true
order by random()
limit 1
 
--рандомные значения для таблицы check_in
insert into check_in(client_id, room_id, check_in_date, check_out_date)
values(
	(select client_id
	from client
	where client_id not in (
		select client_id
		from check_in
		where check_out_date is null or (check_in_date, check_out_date) is null)
 	order by random()
	limit 1),
	(select room_id 
	from room
	where availability = true
	order by random()
	limit 1),
	Null,
	null)
	
--Обновление доступности номеров
update room
set availability = false
where room_id in (
	select room_id
	from check_in
	where check_out_date is null or (check_in_date, check_out_date) is null
)






	






