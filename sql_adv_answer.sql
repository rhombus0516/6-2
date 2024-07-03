/* 問1 */
select group_name as 'グループ', MIN(ranking) as 'ランキング最上位', MAX(ranking) as 'ランキング最下位' from countries group by group_name;

/* 問2 */
select AVG(height) as '平均身長', AVG(weight) as '平均体重' from players where 1=1 and position = 'GK';

/* 問3 */
select countries.name as '国名', AVG(height) as '平均身長' from countries join players on countries.id = players.country_id group by countries.id, countries.name order by avg(height) desc;

/* 問4 */ 
select (select c.name from countries c where p.country_id = c.id) as 'kunimei', avg(height) as 'sincho' from players p group by p.country_id order by avg(p.height) desc;

/* 問5 */
/* 問6 */
/* 問7 */
/* 問8 */
/* 問9 */
/* 問10 */
/* 問11 */
/* 問12 */
/* 問13 */
/* 問14 */
/* 問15 */
/* 問16 */
/* 問17 */
/* 問18 */
/* 問19 */
/* 問20 */
/* 問21 */
/* 問22 */
/* 問23 */
/* 問24 */