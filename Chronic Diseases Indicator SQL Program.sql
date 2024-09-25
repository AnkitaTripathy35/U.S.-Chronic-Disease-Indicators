--creating schema Disease
Create schema Disease
GO
--Creating table location
create table Disease.Location1
(
   Location_ID int not null,
   Location_Desc varchar(100) not null,
   Location_Abbr varchar(100) not null,
   GeoLocation1 GEOGRAPHY,
   CONSTRAINT PK_Location1 primary key clustered (Location_ID) 
);

--creating table Chronic Disease
create table Disease.ChronicDisease
(
    ChronicdiseaseID int identity (1,1) not null,
    Year_of_Start int not null,
    Year_of_End int not null,
    Location_ID int not null,
    DataSource varchar (40) not null,
    Topic varchar (50) not null,
    Question varchar (150) not null,
    constraint PK_ChronicDisease_ID primary key clustered (ChronicdiseaseID),
    constraint FK_LocationsID foreign key (Location_ID) 
    references Disease.Location1(Location_ID)
);



--insertion of values
insert into Disease.Location1(Location_ID,Location_Desc,Location_Abbr, GeoLocation1)
values (8,'CO','Colorado', GEOGRAPHY::STPointFromText('POINT(-106.13361092099967 38.843840757000464)', 4326)),
       (17,'IL','Illinois', GEOGRAPHY::STPointFromText('POINT(-88.99771017799969 40.48501028300046)', 4326)),
       (12,'FL','Florida',GEOGRAPHY::STPointFromText('POINT (-81.92896053899966 28.932040377000476)', 4326)),
       (41,'OR','Oregon',GEOGRAPHY::STPointFromText('POINT (-120.15503132599969 44.56744942400047)', 4326)),
       (36,'NY','New York', GEOGRAPHY::STPointFromText('POINT (-75.54397042699964 42.82700103200045)', 4326)),
       (32, 'NV','Nevada', GEOGRAPHY::STPointFromText('POINT (-117.07184056399967 39.493240390000494)', 4326)),
       (47, 'TN','Tennessee',GEOGRAPHY::STPointFromText('POINT (-85.77449091399967 35.68094058000048)', 4326)),
       (1, 'AL','Alabama', GEOGRAPHY::STPointFromText('POINT (-86.63186076199969 32.84057112200048)', 4326)),
       (11,'DC','District of Columbia',GEOGRAPHY::STPointFromText('POINT (-77.036871 38.907192)', 4326)),
       (31,'NE','Nebraska',GEOGRAPHY::STPointFromText('POINT (-120.15503132599969 44.56744942400047)', 4326));


insert into Disease.ChronicDisease(Year_of_Start,Year_of_End,Location_ID,DataSource,Topic,Question)
values (2020,2020,8,'NVSS',	'Alcohol','Chronic liver disease mortality'),
(2014,2018,17,'Statewide central','cancer','Invasive cancer of the prostate, incidence'),
(2019,2019,12,'STATE','Tobacco','Sale of cigarette packs'),
(2010,2010,41,'NVSS','Cardiovascular Disease','Mortality from heart failure'),
(2013,2013,36,'BRFSS','Diabetes','Foot examination among adults aged >= 18 years with diagnosed diabetes'),
(2018,2018,32,'BRFSS','Mental Health','At least 14 recent mentally unhealthy days among women aged 18-44 years'),
(2014,2014,47,'PRAMS','Reproductive Health','Postpartum checkup'),
(2015,2015,1,'PRAMS','Oral Health','Preventive dental care before pregnancy'),
(2020,2020,11,'NVSS','Chronic Obstructive Pulmonary Disease','Mortality with chronic obstructive pulmonary disease as underlying cause among adults aged >= 45 years'),
(2012,2012,31,'BRFSS','Immunization','Influenza vaccination among noninstitutionalized adults aged >= 18 years');

--select command

Select Location_ID, Location_Desc, Location_Abbr,GeoLocation1.ToString() as GeoLocation1 from Disease.Location1;

Select * from Disease.ChronicDisease;

select * from Disease.Location1
where Location_ID = 41;

select * from Disease.ChronicDisease
where topic= 'Diabetes';

select * from Disease.Location1
where Location_ID=31 or Location_Desc='NE';
	
select * from Disease.ChronicDisease
where Year_of_Start=2014 and Year_of_End=2018;




Drop table Disease.Location1;
drop table Disease.ChronicDisease;