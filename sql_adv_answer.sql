/* 問1 */
select group_name as 'グループ', MIN(ranking) as 'ランキング最上位', MAX(ranking) as 'ランキング最下位' from countries group by group_name;

/* 問2 */
select AVG(height) as '平均身長', AVG(weight) as '平均体重' from players where 1=1 and position = 'GK';

/* 問3 */
select countries.name as '国名', AVG(height) as '平均身長' from countries join players on countries.id = players.country_id group by countries.id, countries.name order by avg(height) desc;

/* 問4 */ 
select (select c.name from countries c where p.country_id = c.id) as 'kunimei', avg(height) as 'sincho' from players p group by p.country_id order by avg(p.height) desc;

/* 問5 */
select kickoff, my_country.name, enemy_country.name from pairings join countries as my_country on pairings.my_country_id = my_country.id join countries enemy_country on pairings.enemy_country_id = enemy_country.id order by kickoff;

/* 問6 */
select name as '名前', position as 'ポジション', club as '所属クラブ', (select COUNT(g.id) from goals g where g.player_id = p.id) as 'ゴール数' from players p order by 'ゴール数' desc;

/* 問7 */
select name, position, club, COUNT(g.id) as 'ゴール数' from players p LEFT JOIN goals g ON g.player_id = p.id group by p.id, p.name, p.position, p.club order by ゴール数 desc;

/* 問8 */
select players.position as 'ポジション', count(goals.id) as 'ゴール数' from goals left join players on goals.player_id = players.id group by players.position;

/* 問9 */
select birth, TIMESTAMPDIFF(YEAR, birth, '2014-06-13') as age, name, position from players order by age desc;

/* 問10 */
select count(goals.id) from goals where 1=1 and player_id is null;

/* 問11 */
select c.group_name, count(g.id) from goals g join pairings p on g.pairing_id = p.id and p.kickoff between '2014-6-13 00:00:00' and '2014-6-27 23:59:59' join countries c on p.my_country_id = c.id group by c.group_name;

/* 問12 */
select goals.goal_time from goals where 1=1 and pairing_id = 103;

/* 問13 */
select c.name, count(g.pairing_id) from goals g inner join pairings p on g.pairing_id = p.id and p.id in (103, 39) inner join countries c on p.my_country_id = c.id group by g.pairing_id, c.name;

/* 問14 */
select pa.kickoff, my_c.name as my_country, en_c.name as enemy_country, my_c.ranking as my_ranking, en_c.ranking as enemy_ranking, COUNT(g.id) from pairings pa left join countries my_c on pa.my_country_id = my_c.id left join countries en_c on pa.enemy_country_id = en_c.id left join goals g on pa.id = g.pairing_id
where 1=1 and my_c.group_name = 'C' and en_c.group_name = 'C' group by pa.kickoff, my_c.name, en_c.name, my_c.ranking, en_c.ranking order by pa.kickoff, my_c.ranking;

/* 問15 */
select pa.kickoff, my_c.name as my_country, en_c.name as enemy_country, my_c.ranking as my_ranking, en_c.ranking as enemy_ranking, (select count(g.id) from goals g where pa.id = g.pairing_id) as my_goals from 
pairings pa left join countries my_c on pa.my_country_id = my_c.id left join countries en_c on pa.enemy_country_id = en_c.id where 1=1 and my_c.group_name = 'C' and en_c.group_name = 'C' order by pa.kickoff, my_c.ranking;

/* 問16 */
select pa.kickoff, my_c.name as my_country, en_c.name as enemy_country, my_c.ranking as my_ranking, en_c.ranking as enemy_ranking, (select count(g.id) from goals g where pa.id = g.pairing_id) as my_goals, (select count(g2.id) from goals g2 left join pairings pa2 on pa2.id = g2.pairing_id where pa2.my_country_id = pa.enemy_country_id and pa2.enemy_country_id = pa.my_country_id) as enemey_goals from pairings pa left join countries my_c on pa.my_country_id = my_c.id left join countries en_c on pa.enemy_country_id = en_c.id where my_c.group_name = 'C' and en_c.group_name = 'C' order by pa.kickoff, my_c.ranking;

/* 問17 */
select pa.kickoff, my_c.name as my_country, en_c.name as enemy_country, my_c.ranking as my_ranking, en_c.ranking as enemy_ranking, (select count(g.id) from goals g where pa.id = g.pairing_id) as my_goals, (select count(g2.id) from goals g2 left join pairings pa2 on pa2.id = g2.pairing_id where pa2.my_country_id = pa.enemy_country_id and pa2.enemy_country_id = pa.my_country_id) as enemey_goals, (select count(g.id) from goals g where pa.id = g.pairing_id) - (select count(g2.id) from goals g2 left join pairings pa2 on pa2.id = g2.pairing_id and pa2.my_country_id = pa.enemy_country_id and pa2.enemy_country_id = pa.my_country_id) as 'goal diff' from pairings pa left join countries my_c on pa.my_country_id = my_c.id left join countries en_c on pa.enemy_country_id = en_c.id where my_c.group_name = 'C' and en_c.group_name = 'C' order by pa.kickoff, my_c.ranking;

/* 問18 */
select kickoff, date_add(kickoff, interval -12 hour) as kickoff_jp from pairings where 1=1 and my_country_id = 1 and enemy_country_id = 4;

/* 問19 */
select TIMESTAMPDIFF(YEAR, birth, '2014-06-13') as age, COUNT(id) as player_count from players group by age order by age asc;

/* 問20 */
select case when age between 10 and 19 then '10' when age between 20 and 29 then '20' when age between 30 and 39 then '30' when age between 40 and 49 then '40' end as age_group, count(*) from (select TIMESTAMPDIFF(YEAR, birth, '2014-06-13') as age from players) as ages group by age_group order by age asc;

/* 問21 */
select floor(TIMESTAMPDIFF(YEAR, birth, '2014-06-13') / 5) * 5 as age, count(id) from players group by age order by age asc;

/* 問22 */
select floor(TIMESTAMPDIFF(YEAR, birth, '2014-06-13') / 5) * 5 as age, position, count(id), AVG(height), AVG(weight) from players group by age, position order by age, position asc;

/* 問23 */
select name, height, weight from players order by height desc limit 5;

/* 問24 */
select name, height, weight from players order by height desc limit 15 offset 5;