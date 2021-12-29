-- fix ambiguous names for Congo
update geodatasource_country_borders_csv 
set country_name = 'Republic of the Congo'
where country_code = 'CG';

update geodatasource_country_borders_csv 
set country_border_name = 'Republic of the Congo'
where country_border_code = 'CG';

update geodatasource_country_borders_csv 
set country_name = 'Democratic Republic of the Congo'
where country_code = 'CD';

update geodatasource_country_borders_csv 
set country_border_name = 'Democratic Republic of the Congo'
where country_border_code = 'CD';

-- fix ambiguous names for Korea
update geodatasource_country_borders_csv 
set country_name = 'North Korea'
where country_code = 'KP';

update geodatasource_country_borders_csv 
set country_border_name = 'North Korea'
where country_border_code = 'KP';

update geodatasource_country_borders_csv 
set country_name = 'South Korea'
where country_code = 'KR';

update geodatasource_country_borders_csv 
set country_border_name = 'South Korea'
where country_border_code = 'KR';


--select * from geodatasource_country_borders_csv gcbc 

select
trim(split_part(gcbc.country_name, '(', 1)) as country_name,
--	gcbc.country_name,
	json_agg 
	(case
		when gcbc.country_border_name = '' then 'No land borders'
		else trim(split_part(gcbc.country_border_name, '(', 1))
	end::text
order by
	gcbc.country_border_name
    ) as borders
from
	geodatasource_country_borders_csv gcbc
where country_name not like '%Island%'
group by
	gcbc.country_name
;

-- export as csv