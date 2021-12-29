-- public.geodatasource_country_borders_csv definition

-- Drop table

-- DROP TABLE public.geodatasource_country_borders_csv;

CREATE TABLE public.geodatasource_country_borders_csv (
	country_code varchar(2) NULL,
	country_name varchar(100) NULL,
	country_border_code varchar(2) NULL,
	country_border_name varchar(100) NULL
);