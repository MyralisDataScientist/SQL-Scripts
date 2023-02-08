/*
105.230.361 observations
*/


select

lower(mrc.NOME) as nome_marca,
lower(pro.NOME) as nome_produto,
lower(lab.NOME) as nome_laboratorio, 
lower(reg.NOME) as nome_regiao,
cast(substr(pre.DATA, -2, 2) as integer) as mes,
cast(substr(pre.DATA, 0, 4) as integer) as ano,
IFNULL(cast(pre.PX as integer), 0) as qtde_prescrita

from

myralisdev.raw_gcs_closeupmkt_arquivos.MARCAS mrc

left join 

myralisdev.raw_gcs_closeupmkt_arquivos.PRODUTO pro

on 
mrc.CODIGO = pro.CODIGOMARCA

left join 

myralisdev.raw_gcs_closeupmkt_arquivos.PRESCRICAO pre

on 
pro.CODIGOMARCA = pre.CODIGOMARCA and
pro.CODIGOCONCENT = pre.CODIGOCONCENT and
pro.CODIGOAPRES = pre.CODIGOAPRES and
pro.CODIGOFORMA = pre.CODIGOFORMA

left join 
myralisdev.raw_gcs_closeupmkt_arquivos.REGIAO reg

on
reg.CODIGO = pre.CODIGOREGIAO

left join 
myralisdev.raw_gcs_closeupmkt_arquivos.LABORATORIO lab

on
lab.CODIGO = pre.CODIGOLAB
