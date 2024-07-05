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