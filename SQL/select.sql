--Mostrar a classe da tabela classificação e a quantidade media de vegetais da tabela ecossitema_vegetacao 
--mas apenas daqueles com o idvegetacao igual a 1002
select c.classe, avg(e.quantidade_veg) 
from classificacao c 
right join vegetacao v
on c.idclassificacao = v.CLASSIFICACAO_IDCLASSIFICACAO
left join ecossistema_vegetacao e
on v.IDVEGETACAO=e.VEGETACAO_IDVEGETACAO
where e.VEGETACAO_IDVEGETACAO=1002
group by c.classe;

--Mostrar o nome_ordem da tabela ordem e o tempo maximo da tabela longevidade mas daqueles  com a "tamanho" da tabela especie menor que 5 
select distinct o.nome_ordem, max(l.tempo)
from ordem o
right join especie e 
on o.IDORDEM=e.ORDEM_IDORDEM
where e.IDESPECIE in (select l.ESPECIE_IDESPECIE from longevidade l where e.TAMANHO<20) 
group by o.nome_ordem;


--mostrar o nome_eco, profundidade de ecossistema e a soma da quantidade geral de animais_geo, mas somente os que a profundidade minima seja maior que a temperatura minima da tabela Clima
select distinct e.nome_eco, e.profundidade, sum(a.quantidade_geral) soma
from ecossistema e
left join geografia_mar g
on e.IDECOSSISTEMA=g.ECOSSISTEMA_IDECOSSISTEMA
right join ANIMAIS_GEO a
on g.IDGEOGRAFIA_MAR=a.GEOGRAFIA_MAR_IDGEOGRAFIA_MAR
group by e.nome_eco, e.profundidade, a.quantidade_geral
having min(e.PROFUNDIDADE) > (select min(clima.temperatura) from clima);

