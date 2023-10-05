use filmsDB

--Cascade delete
SELECT * FROM Person
SELECT * FROM Person_func_per_film WHERE id_person=3

DELETE FROM Person WHERE id_person=3

SELECT * FROM Person
SELECT * FROM Person_func_per_film WHERE id_person=3

--Cascade update
Update Functionprofession SET profession = 'Actor' WHERE id_function=1
Select P.name, P.surname,FP.profession FROM Person AS P,Person_func_per_film AS PFPF, Functionprofession AS FP WHERE PFPF.id_film = P.id_person AND PFPF.id_function=FP.id_function AND FP.profession='Actor'
Update Functionprofession SET profession = 'PEPE' WHERE id_function=1
Select P.name, P.surname,FP.profession FROM Person AS P,Person_func_per_film AS PFPF, Functionprofession AS FP WHERE PFPF.id_film = P.id_person AND PFPF.id_function=FP.id_function AND FP.profession='PEPE'