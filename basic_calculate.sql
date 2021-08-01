--������� ������ ������������� ����� ������ 
create or replace function not_negative (numberr numeric) returns numeric as 
$$begin
if numberr < 0 
	then 
		return 0; 
else 
	return(numberr); 
end if; end;
$$ language plpgsql;

--������� ��� ������ ������������� ����� ������ 
create or replace function not_positive (numberr numeric) returns numeric as 
$$begin
if numberr > 0 
	then 
		return 0; 
else 
	return(numberr); 
end if; end;
$$ language plpgsql;

--������� ��� ��������� ������ �������
create or replace function concat_number (vstavka varchar) returns varchar as 
$$begin
if vstavka = '����������'  
	then 
	vstavka := concat('61 ', vstavka);
	return vstavka ;
elsif vstavka = '�����������'
	then 
	vstavka := concat('62 ', vstavka);
	return vstavka ; 
else 
	return(vstavka);
end if; end;
$$ language plpgsql;

CREATE OR REPLACE FUNCTION public.rename_vstavka(vstavka character varying)
 RETURNS character varying
 LANGUAGE plpgsql
AS $function$begin
if vstavka = '61 ����������'  
	then 
	vstavka := '����������';
	return vstavka ;
elsif vstavka = '62 �����������'
	then 
	vstavka := '�����������';
	return vstavka ; 
elsif vstavka = '30 �����'
	then 
	vstavka := '�����';
	return vstavka ;
elsif vstavka = '36 ������'
	then 
	vstavka := '������';
	return vstavka ; 
elsif vstavka = '4 ���������� �����'
	then 
	vstavka := '���������� �����';
	return vstavka ; 
elsif vstavka = '46 ������'
	then 
	vstavka := '������';
	return vstavka ; 
elsif vstavka = '52 ������ ����'
	then 
	vstavka := '������ ����';
	return vstavka ; 
elsif vstavka = '54 ������ ���� ��'
	then 
	vstavka := '������ ���� ��';
	return vstavka ; 
elsif vstavka = '55 �����'
	then 
	vstavka := '�����';
	return vstavka ; 
elsif vstavka = '56 ��������'
	then 
	vstavka := '��������';
	return vstavka ;
elsif vstavka = '61 ������ �����'
	then 
	vstavka := '������ �����';
	return vstavka ;
elsif vstavka = '62 ������ �� �����'
	then 
	vstavka := '������ �� �����';
	return vstavka ;
elsif vstavka = '63 ������ ����� ��'
	then 
	vstavka := '������ ����� ��';
	return vstavka ;
elsif vstavka = '64 ������ �� ����� ��'
	then 
	vstavka := '������ �� ����� ��';
	return vstavka ;
elsif vstavka = '4 ���������� �������'
	then 
	vstavka := '���������� �������';
	return vstavka ; 
elsif vstavka = '31 �������'
	then 
	vstavka := '�������';
	return vstavka ; 
elsif vstavka = '45 ����'
	then 
	vstavka := '����';
	return vstavka ; 
elsif vstavka = '47 ������'
	then 
	vstavka := '������';
	return vstavka ;
else 
	return(vstavka);
end if; end;

-- �������� ������� 
create or replace function rename_vstavka_not_podveska (vstavka varchar) returns varchar as 
$$begin
if vstavka = '������ �� �����'  
	then 
	vstavka := '�����������';
	return vstavka ;
elsif vstavka = ''
	then 
	vstavka := '�����������';
	return vstavka ;
elsif vstavka = '��������_���������'
	then 
	vstavka := '�����������';
	return vstavka ; 
else 
	return(vstavka);
end if; end;
$$ language plpgsql;

--�������, ��� ������������ 0 � �����. �����, �������� ������������� ������� �������� �������� �����
create or replace function skl_rez_without_pm (podrazdelenye_kust varchar) returns numeric as 
$$begin
if podrazdelenye_kust like '������%' or podrazdelenye_kust like '����������� �����%'
	then 
	return 0;
else 
	return 1;
end if; end;
$$ language plpgsql;

--����������� 0 � ������ �� �������
create or replace function zero_column (podrazdelenye_kust varchar, num_column numeric) returns numeric as 
$$begin
if podrazdelenye_kust like '������%' or podrazdelenye_kust like '����������� �����%'
	then 
	num_column := 0;
	return num_column;
else 
	return num_column;
end if; end;
$$ language plpgsql;

--������� ��� ���������� ��� �� � �������� � ��� ��� 
create or replace function rename_ooo (predprinimatel varchar) returns varchar as
$$begin
if predprinimatel like '���%'
	then 
	predprinimatel := '��� ���';
	return predprinimatel;
else 
	return predprinimatel;
end if; end;
$$ language plpgsql;

-- ��� > 0: 1, �����: 0
create or replace function countr_month (numeric) returns numeric as 
$$begin
if  $1 >0
	then 
	return 1;
else 
	return 0; 
end if; end;
$$ language plpgsql;

-- ������� �������, ������� ����� �������� ������������ � ����������� ����� � ��������/�������, 
-- � �����/��������� ������� ����� ������������ �������� + ��������  
create or replace function re_nomenkl (vid_izdelya varchar, rekvizity varchar, r3 varchar, nomenklatura varchar) returns varchar as 
$$begin
if  vid_izdelya = '���������' and vid_izdelya != '��������' and  r3 = '�������'
	then 
	return 'obruchalka' ;
elseif vid_izdelya = '������� ������' or vid_izdelya = '����' 
	then 
	return --concat(rekvizity,r3)  -- ������� ������ ���������� ������������ ������������, � �������� =+r3 	
	rekvizity ;
	--r3 ;
else 
	return nomenklatura; 
end if; end;
$$ language plpgsql;


-- �������� ������������ �� ������� ������ 
create or replace function re_nomenkl_rotation (vid_izdelya varchar, rekvizity varchar, r3 varchar, nomenklatura varchar) returns varchar as 
$$begin
if  vid_izdelya = '���������' and vid_izdelya != '��������' and  r3 = '�������'
	then 
	return 'obruchalka' ;
elseif vid_izdelya = '������� ������' or vid_izdelya = '����' 
	then 
	return 	
	rekvizity ;
else 
	return nomenklatura; 
end if; end;
$$ language plpgsql;




-- ��������������� ������ 
-- �� ��������
alter table prodazhi_def drop column rekvizity; 

update prodazhi_def set predprinimatel = rename_ooo(predprinimatel);

update prodazhi_def set vstavka = rename_vstavka(vstavka);

update prodazhi_def set vstavka = rename_vstavka_not_podveska(vstavka);

-- �� �������, ������� 
update prihod set predprinimatel = rename_ooo(predprinimatel);

update prihod set vstavka = rename_vstavka(vstavka);

update prihod set vstavka = rename_vstavka_not_podveska(vstavka);

-- �� �������� �� �������� ������   
update ostatki set predprinimatel = rename_ooo(predprinimatel);

update ostatki set vstavka = rename_vstavka(vstavka);

update ostatki set vstavka = rename_vstavka_not_podveska(vstavka);


-- ������� ������ ������� ������ 
drop table prodazhi_full;
	

-- ����� ���������� ������ � �������� �� �������� � �� �������� 

-- ������� ��������� ������������ ��������, ������ �� ��������, ������� ������� prodazhi_not_podveska !!������� ������ ����� ������� ����� ��������� 
with d_1 as (select * from prodazhi_def pd 
	where podrazdelenye_kust not like '%������%' 
	and podrazdelenye_kust not like '%����������� c����%' 
	and podrazdelenye_kust not like '%����. c����%'
	and podrazdelenye_kust not like '1.1����������� ����� ��'
	and podrazdelenye_kust not like '��� ���� ������ 58'
	and podrazdelenye_kust not like '��� ����������� ������������� 41')
select *, concat_ws('|',metall,rename_vstavka_not_podveska(vstavka),vid_izdelya,vid_metalla,proba,d_provolki, r3,r4,r5,razmer) as rekvizity
	into prodazhi_full from d_1 ;

update prodazhi_full set rekvizity =  concat_ws('|',metall, rename_vstavka_not_podveska(vstavka), vid_izdelya, vid_metalla,proba,d_provolki,r3,r4,r5,razmer)
	where vid_izdelya = '����' or vid_izdelya = '������� ������'; -- �� ��������� � ����� �������� ��� �������� 

	
	
alter table prodazhi_full add column vesovka numeric; --------------------------------- �������� ��������� ���� 

update prodazhi_full set ves = replace(ves, ',','.' ); -- ������������� ��� ���������� ����������� � numeric 

update prodazhi_full set ves = prived_ves(ves); -- ���������������� ������������� ������  



alter table prodazhi_full alter column ves type numeric USING ves::numeric; -- 

update prodazhi_full pp set vesovka = dv.vesovka 
	from diapazoni_vesa dv
where dv.more_than < pp.ves and dv.less_or_equal >= pp.ves 
and vid_izdelya in ('��������', '��������'); -- �������� �������
	

update prodazhi_full set rekvizity = concat_ws('|',metall,vid_izdelya,vid_metalla,proba,r3,r4,r5,vesovka)
	where vid_izdelya in ('��������', '��������'); -- ��������� ������ ��������� ���������� �� ������ �������� 



-- ������� ������� ������� ����� ���������� �������������� 
drop table prihod_full ;



-- ������� ���� ��������� � �������
select *, concat_ws('|',metall,rename_vstavka_not_podveska(vstavka),vid_izdelya,vid_metalla,proba,d_provolki,r3,r4,r5,razmer) as rekvizity 
	into prihod_full from prihod;

update prihod_full set rekvizity =  concat_ws('|',metall, rename_vstavka_not_podveska(vstavka), vid_izdelya, vid_metalla,proba,d_provolki,r3,r4,r5,razmer)
	where vid_izdelya = '����' or vid_izdelya = '������� ������'; -- �� ��������� � ����� �������� ��� �������� 

update prihod_full set nomenklatura = re_nomenkl(vid_izdelya, rekvizity, r3, nomenklatura) -- ������������ ��� ���������, ����� � ������ ��������� 
	where vid_izdelya = '����' or vid_izdelya = '������� ������';



-- ����������� ��� 
alter table  prihod_full  add column vesovka numeric; ----------------------------------------�������� ��������� ���� 

update prihod_full set ves = replace(ves, ',','.' );
--where vid_izdelya = '��������';

update prihod_full set ves = prived_ves(ves);


-- ��������� ������� � ��������� ������ �������� 
alter table prihod_full alter column ves type numeric USING ves::numeric;

update prihod_full pp set vesovka = dv.vesovka 
	from diapazoni_vesa dv
where dv.more_than < pp.ves and dv.less_or_equal >= pp.ves
and vid_izdelya in ('��������', '��������'); 
	
--alter table prihod_full add column rekvizity varchar;

update prihod_full set rekvizity = concat_ws('|',metall,vid_izdelya,vid_metalla,proba,r3,r4,r5,vesovka)
where vid_izdelya in ('��������', '��������');

update prihod_full set nomenklatura = re_nomenkl(vid_izdelya, rekvizity, r3, nomenklatura)
where vid_izdelya in ('��������', '��������');



-- ������������ ������� ������������ ��������� �� �������
alter table ostatki add column vesovka numeric; ----------------------------------------�������� ��������� ����

update ostatki set ves = replace(ves, ',','.' );

update ostatki set ves = prived_ves(ves);



alter table ostatki alter column ves type numeric USING ves::numeric;

update ostatki pp set vesovka = dv.vesovka 
	from diapazoni_vesa dv
where dv.more_than < pp.ves and dv.less_or_equal >= pp.ves; 
--	
alter table ostatki add column rekvizity varchar;

update ostatki set rekvizity = concat_ws('|',metall,vid_izdelya,vid_metalla,proba,r3,r4,r5,vesovka)
where vid_izdelya in ('��������', '��������'); 

update ostatki set rekvizity = concat_ws('|',metall, vstavka, vid_izdelya, vid_metalla, proba, d_provolki, r3, r4, r5, razmer)
where vid_izdelya not in ('��������', '��������');

update ostatki set rekvizity =  concat_ws('|',metall, rename_vstavka_not_podveska(vstavka), vid_izdelya, vid_metalla,proba,d_provolki,r3,r4,r5,razmer)
where vid_izdelya = '����' or vid_izdelya = '������� ������';

-- ����������� ������������ 
update ostatki set nomenklatura = re_nomenkl(vid_izdelya, rekvizity, r3, nomenklatura);





--������� ������ � ��������, ������� ��� �� ���������� � ��������
--������� � ��������� 
insert into prodazhi_full(podrazdelenye_kust, predprinimatel, rekvizity, ostatki, prodazhi)
	select t.podrazdelenye_kust, t.predprinimatel, t.rekvizity, t.ostatki, t.prodazhi
from (with dts as ( select rekvizity, predprinimatel, sum(kolichestvo) as cnt from prihod_full pp
	group by rekvizity, predprinimatel ),
	dtt as (select pp.rekvizity, pp.predprinimatel, prodazhi, ostatki, pp.cnt
		from prodazhi_full pp1
		right join dts pp on pp1.rekvizity = pp.rekvizity 
		and pp1.predprinimatel = pp.predprinimatel 
		where podrazdelenye_kust is null),
	dtb as (select distinct predprinimatel, podrazdelenye_kust from prodazhi_full)
	select db.podrazdelenye_kust, db.predprinimatel, d.rekvizity, coalesce(d.ostatki, 0) as ostatki, 
		coalesce(d.prodazhi, 0) as prodazhi, d.cnt 
		from dtt d
		join dtb db on d.predprinimatel = db.predprinimatel) t; 


-- �������� ������� ����� ���������� ����������� �� �������, ����� ��������� ������������� �� ���� �����
-- ������ �������� ������ ���� �������� ����� ������������ ����� 
	insert into prodazhi_full(podrazdelenye_kust, predprinimatel, rekvizity, ostatki, prodazhi)
	select t.podrazdelenye_kust, t.predprinimatel, t.rekvizity, t.ostatki, t.prodazhi
from 
(with d  as (select distinct predprinimatel, rekvizity from prodazhi_full pp), 
	td as (select distinct predprinimatel, podrazdelenye_kust from prodazhi_full), -- ��� �������� ����� ���������������� 
	s as (select d.predprinimatel, d.rekvizity, td.podrazdelenye_kust from d 
		join td on td.predprinimatel = d.predprinimatel),
	st as (select s.predprinimatel, s.rekvizity, s.podrazdelenye_kust, pp2.r3, 
		coalesce(pp2.prodazhi,0) as prodazhi, coalesce(pp2.ostatki,0) as ostatki 
		from s 
		left join prodazhi_full pp2 on pp2.predprinimatel = s.predprinimatel 
		and pp2.rekvizity = s.rekvizity 
		and pp2.podrazdelenye_kust = s.podrazdelenye_kust
		where r3 is null)
select * from st) t;



-- ������� ������ ������� ����� ���������� 
drop table avg_sales; 
drop table ostatki_last_month; 
drop table joined; 



-----������� ������� avg_sales------ �������������� �������
with up as(select podrazdelenye_kust, predprinimatel , rekvizity, period_time, 
	date_part('year', date_summary)	as year,
	date_part('month', date_summary) as  month, 
	sum(prodazhi) as prodazhi, 
		sum(ostatki) as ostatki
		from prodazhi_full -------       �������� ��� 
		group by podrazdelenye_kust, predprinimatel , rekvizity, date_part('year', date_summary), date_part('month', date_summary)
),
up_1 as (select *, countr_month(ostatki+prodazhi) as count_month from up), -- ������� ���������� ������� ����� ���� �������/������� 
upd as (
select podrazdelenye_kust, rename_ooo(predprinimatel) as predprinimatel , rekvizity, 
	sum(prodazhi) as sum_prodazh,
	sum(count_month) as sum_count_month 
	from up_1
	where podrazdelenye_kust not like '������%' and podrazdelenye_kust not like '����������� �����%' 
	group by podrazdelenye_kust, predprinimatel, rekvizity	
),
updd as (select podrazdelenye_kust, predprinimatel, rekvizity, 
	coalesce(sum_prodazh/ nullif(sum_count_month, 0),0) as avg_month_sales, 
	sum(sum_prodazh) over (partition by predprinimatel, podrazdelenye_kust) as sum_prodazh_at_all, -- c������ �������������� ���������� ��� 
	sum(sum_count_month) over (partition by predprinimatel, podrazdelenye_kust) as sum_count_month_at_all, -- ������� ������ � ������� �� ��
	sum_prodazh, sum_count_month, skl_rez_without_pm(podrazdelenye_kust) as posad_mesta
	from upd)
select *, coalesce(sum_prodazh_at_all/nullif(sum_count_month_at_all, 0) ,0) as avg_month_sales_at_all 
	into avg_sales from updd;

alter table avg_sales drop column sum_count_month_at_all; -- ������� ������ ���� 

alter table avg_sales drop column sum_prodazh_at_all;
	


-----������� ������� � ��������� �� ��������� ����-----  
create table ostatki_last_month as select podrazdelenye_kust, rename_ooo(predprinimatel) as predprinimatel, rekvizity,
	sum(ostatki) as ostatki, skl_rez_without_pm(podrazdelenye_kust) as posad_mesta
from prodazhi_full pnp  ---- �������� ��� 
	where period_time like '���� 2021 �.%' and podrazdelenye_kust not like '������%' ---- �������� ���� ��� 
	and podrazdelenye_kust not like '����������� �����%'
group by podrazdelenye_kust,  predprinimatel, rekvizity; 




-----������� ����������� ������� �� �������� ��������� � ��������� �� ��������� ����� -----
select vas.rekvizity, vas.podrazdelenye_kust, vas.predprinimatel,  
	vas.avg_month_sales, coalesce(vof.ostatki,0) as ostatki, skl_rez_without_pm(vas.podrazdelenye_kust) as posad_mesta 
	into joined from avg_sales vas
left join ostatki_last_month vof on vas.rekvizity = vof.rekvizity and vas.podrazdelenye_kust = vof.podrazdelenye_kust and vas.predprinimatel = vof.predprinimatel; 




-- ������ ������� �� ������� ������, �������������� ����������� ��� ������������� ����������� 
with dt2_ostatki as (select predprinimatel, rekvizity, 
			sum(avg_month_sales) as sum_avg_month_sales, sum(ostatki) as sum_ostatki, sum(posad_mesta) as sum_posad_mesta 
			from joined j 
			group by predprinimatel, rekvizity 
),
			--	������� ����������� �� ��������������� 
	s_po_ip  as (select vof.predprinimatel, vof.rekvizity, 
			vof.sum_avg_month_sales, vof.sum_ostatki, vof.sum_posad_mesta, 
			coalesce((vof.sum_avg_month_sales + vof.sum_posad_mesta)/nullif((vof.sum_ostatki),0),0) as soot_po_ip from dt2_ostatki vof 
),
--	����������� ������� ������� ��������� �� 
	prihod_agr as (select rekvizity, predprinimatel,
			sum(kolichestvo) as ost_k_rasp from prihod_full ---------- �������� ����� 
			group by rekvizity, predprinimatel
),
--����������� ����������� ������ � �������� �� ������� �������������� ������ 
	vass as ( select vas.rekvizity, vas.predprinimatel,vas.podrazdelenye_kust, 
			vas.avg_month_sales, sip.sum_posad_mesta, sip.sum_ostatki, sip.soot_po_ip, sip.sum_avg_month_sales,  avg_month_sales_at_all
			from avg_sales vas, s_po_ip sip 
			where vas.rekvizity = sip.rekvizity and vas.predprinimatel = sip.predprinimatel
			),
--��������� ���������� ����� � ������� �� ��������� 
	ostatki_mesta as (select rekvizity, podrazdelenye_kust, predprinimatel, 
			sum(ostatki) as ostatki, sum(posad_mesta) as posad_mesta from joined 
			group by podrazdelenye_kust, predprinimatel, rekvizity
			),
--����� �������� ������� 
	base_statistics_1 as (select rs.rekvizity, rs.podrazdelenye_kust, rs.predprinimatel, rs.avg_month_sales_at_all,
			rs.avg_month_sales, om.ostatki, om.posad_mesta, rs.sum_posad_mesta, 
			rs.sum_ostatki, rs.soot_po_ip, coalesce(pa.ost_k_rasp,0) as ost_k_rasp,
			rs.sum_avg_month_sales,
			-- ��. ������� � ��������
				coalesce(rs.avg_month_sales/nullif(om.ostatki,0),0) as koef_sr_prod_ost,
			-- ����� ������� � �������� 
				coalesce(rs.avg_month_sales_at_all/nullif(om.ostatki,0),0) as koef_all_sales_ost,
		--	������ ���� �������
				 coalesce((rs.avg_month_sales+ om.posad_mesta)/nullif(rs.soot_po_ip,0),0) as db_ost,
		--	�������
		 		coalesce((om.ostatki - ((rs.avg_month_sales+om.posad_mesta)/nullif(rs.soot_po_ip,0))),0) as rotation
			from ostatki_mesta om, vass rs
	left join prihod_agr pa on rs.rekvizity = pa.rekvizity and rs.predprinimatel = pa.predprinimatel
	where 
--	join �������������� � ����������� ������� 
	rs.rekvizity =  om.rekvizity and rs.podrazdelenye_kust = om.podrazdelenye_kust and rs.predprinimatel = om.predprinimatel
	),
base_statistics as (select *, 	
		--	����� �� ���� � �������  
			coalesce(sum_avg_month_sales/nullif(ost_k_rasp,0),0) as soot_sr_prod_k_prihodu,
		--������������� � ������ ������� 
			coalesce(avg_month_sales/nullif(coalesce(sum_avg_month_sales/nullif(ost_k_rasp,0),0),0),0) as rasp_with_rot,
		--����������� �� �� � ������ �������
			coalesce((sum_avg_month_sales+sum_posad_mesta)/nullif((sum_ostatki+ost_k_rasp),0),0) as soot_po_ip_rot,
		--������ ���� ������� � ������ �������
			coalesce((avg_month_sales+posad_mesta)/nullif(((sum_avg_month_sales+sum_posad_mesta)/nullif((sum_ostatki+ost_k_rasp),0)),0),0) as db_ost_prihod
			from base_statistics_1
			),
base_statistics_2 as (select *,	
		--��������� ������� � ������ �������
			not_positive(ostatki-db_ost_prihod) as rotation_2,
		--C���� �� ������� �������� ������� ��������������� � �����������
			sum(not_positive(ostatki-db_ost_prihod)) over (partition by predprinimatel, rekvizity 
			) as sum_rotation 
			from base_statistics),
ostt as (select predprinimatel, rekvizity, podrazdelenye_kust, sum(kolichestvo) as kolichestvo  -- ���������� ������� ��� ������������� � ��������
	from ostatki o2 group by predprinimatel, rekvizity,  podrazdelenye_kust),
--������������� ��� �������
dt as (select *, coalesce(round(ost_k_rasp*rotation_2/nullif(sum_rotation,0),0),0) as rasp_potr_without_rot 
	from base_statistics_2)
	select dt.*, coalesce(t.kolichestvo,0) as ostatki_2, sum(coalesce(t.kolichestvo,0)) over (partition by dt.predprinimatel, dt.rekvizity) as sum_ostatki_on_ip, 
		sum(coalesce(t.kolichestvo,0)) over (partition by dt.rekvizity) as sum_ostatki_org,
		sum(coalesce(dt.avg_month_sales,0)) over (partition by dt.rekvizity) sum_sales_org
		from dt 
			left join ostt t on dt.predprinimatel = t.predprinimatel 
			and dt.rekvizity = t.rekvizity 
			and dt.podrazdelenye_kust = t.podrazdelenye_kust; 
	-- where rasp_potr_without_rot > 0


--
---- ������� �������� ������������ � ���������  ������ �� ������� � �������� 
with dtt as (select nomenklatura, predprinimatel, rekvizity, sum(kolichestvo) as koll from ostatki o2
		group by nomenklatura, predprinimatel, rekvizity ),
	dt2 as (select *, sum(kolichestvo) over (partition by pf.nomenklatura, pf.predprinimatel, pf.rekvizity) as freq
			from prihod_full pf 
		left join dtt on dtt.nomenklatura = pf.nomenklatura and 
			dtt.predprinimatel = pf.predprinimatel and 
			dtt.rekvizity = pf.rekvizity)
select *, coalesce(freq,0)+coalesce(koll,0) as freqq from dt2
order by razmer desc,
	freqq asc; 

select * from ostatki;
