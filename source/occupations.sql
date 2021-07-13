select Docter,Professor,Singer,Actor from 
(select 
 name,occupation,count(1) OVER (partition by occupation order by name) 
 from occupations
)
pivot ( 
    max(name) 
    for occupation 
    in ('Doctor' as Docter,'Professor' as Professor, 'Singer' as Singer, 'Actor' as Actor)
) order by Docter,Professor,Singer,Actor;