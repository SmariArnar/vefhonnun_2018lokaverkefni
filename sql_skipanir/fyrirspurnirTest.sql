#1.Sýnið öll lög tiltekins flytjanda (þið veljið flytjandann sjálf).
#select nafnLags, nafnFlytjanda, texti, flytjandiID, flytjandilagID
#from flytjandi, lagalisti
#having flytjandiID = 1 and flytjandilagID = 1;
#2.Sýnið öll lög á tilteknum lagalista (þið veljið titilinn sjálf);
#Hér leysi ég þetta með því að sýna allan lagalista útgáfufyrirtækis 
#1 eða flæði útgáfufyrirtæki, sem er með 30 lög
#select nafnlags,utgefandi.utgefandiID, lagalisti.utgefandilagID
#from lagalisti
#inner join utgefandi on lagalisti.utgefandilagID = utgefandi.utgefandiID
#Having lagalisti.utgefandilagID = 1 and utgefandi.utgefandiID = 1;
#3.Sýnið öll lög tiltekinnar tegundar tónlistar (þið veljið tegundina sjálf).
#Hér valdi ég rapp til að sýna, listamaðurinn minn hann Drake er eini rapptónlistamaðurinn minn
#Hér valdi ég öll lögin hans, en þessi skipun sem ég setti inn er til að finna alla tegund rapp tónlistar
#sem er með id númer 4. Það er sami útgáfudagurinn því öll lögin eru af sömu plötunni sem kom út á sama tíma.
#select nafnLags,texti, utgafudagur, tegundlagid, tegundID
#from lagalisti, tegund
#Having tegundlagID = 4 and tegundID = 4;
#4. Sýnið öll lög sem taka meira en 5 mín í spilun.
#Samkvæmt þessari síðu http://www.speechinminutes.com/ er venjulegur talhraði 130 orð á mínútu
#Það gerir þá 650 orð til að ná 5 mínútum. Hér notaði ég innbyggða fallið length
#Sem telur lengd texta færslna og gerði kóða sem sýnir lög sem eru með meira en 650 orð í þeim.
#select nafnLags, utgafudagur, texti
#from lagalisti
#having length(texti) <= 650;
#5.Sýnið söluhæsta lag útgáfunnar.
#"Söluhæsta", notaði 5 mest hlustuðu á lögin í lagavalinu,með þessum kóða fann ég það.
#select lagcalID, count(lagcalID) AS 'Hvað lagið kemur oft fyrir'
#from lagaval
#group by lagcalID
#order by count(*) DESC
#limit 5;
#6.Sýnið nafn flytjanda, lagalista, útgáfudag og útgefanda.
#Hér er kóði til að fá fram það sem beðið er um, nafn flytjanda öll lög hans útgáfudagar á öllum lagalistanum hans og nafn útgefandan hans
#select nafnFlytjanda, nafnLags, utgafudagur, nafnUtgefanda, flytjandiID, flytjandilagID, utgefandiID, utgefandilagID
#from utgefandi, flytjandi, lagalisti
#having flytjandiID = 1 and flytjandilagID = 1 and utgefandiID = 1 and utgefandilagID = 1;
#7. Sýnið fimm lengstu lögin og nöfn flytjanda.
#select nafnFlytjanda,nafnLags,length(texti) as 'Lengd lags í orðum.', flytjandilagID
#from lagalisti,flytjandi
#WHERE flytjandilagID = flytjandiID
#group by texti
#order by length(texti) DESC
#limit 5; 
#8.Sýnið fjölda laga eftir tegund – birtið bara þær tvær tegundir sem hafa flest lög.
#Birtir fjölda laga í tegundarflokki, er með 10 lög í hverri tegund þannig það koma bara 2 random í rauninni en þar sem er mismunandi tegundir laga að þá koma flestu lögin í tegundaflokkum.
#select tegund,count(tegundlagID) as 'Fjöldi laga í Tegundaflokki',tegundlagID, tegundID
#from lagalisti, tegund
#where tegundlagID = tegundID
#group by tegundlagID
#order by count(*) DESC
#limit 2;
#9.Sýnið fjölda tónleika, hópað saman eftir flytjendum.
#Það er ekkert nafn á tónleikunum þannig ég notaði bara id-ið, svo kemur fram hvaða flytjandi
#er að spila á þeim tónleikum og svo hvað hann er að soila á mörgum tónleikum.
#select  tonleikarID as 'Hvaða tónleikar þetta eru(NR)', nafnFlytjanda as 'Flytjandi',count(tonleikarID) as 'Hvað hann er með marga tónleika', flytjendurTonleikarID as '...',flytjandiID as '..'
#from tonleikar, flytjandi
#where flytjandiID = flytjendurTonleikarID
#group by tonleikarID
#order by count(*) DESC
#limit 5;
#10.Sýnið nöfn allra áskrifenda, hópað saman eftir flytjendum.
#select nafnAskrifanda as 'Áskrifandi flytjanda', nafnFlytjanda as 'Flytjandi áskrifenda',askrifandiID as '...', askrifendurTonleikarID as '...', flytjendurTonleikarID as '...', flytjandiID as '...'
#from askrifandi, flytjandi, tonleikar
#Having askrifandiID = askrifendurTonleikarID and flytjendurTonleikarID = flytjandiID;
#11. Sýnið hversu mörg lög byrja á bókstafnum A og hversu mörg lög hafa bókstafinn s í nafninu.
#select nafnLags
#from lagalisti
#where nafnLags LIKE 'A%' or nafnLags like '%s%'; 
#12. Sýndu nöfn og aldur allra flytjanda.
#select nafnFlytjanda, aldur
#from flytjandi;
#13.Sýndu meðallengd allra laganna.
#Einföld innbyggð lausn til að finna meðaltal lengd textans.
#select avg(length(texti)) as 'Meðalengd texta'
#from lagalisti;
#14.Sýndu hversu margir flytjendur eiga fleiri en 4 lög.
select lagalisti.*, flytjandi.*, 
from lagalisti, flytjandi
#where flytjandilagID = flytjandiID
where count(lflytjandilagID) = 1;
/*
group by nafnFlytjanda, flytjandiID
Having count(Distinct lagID) > 4 and flytjandilagID = flytjandiID; 

select c.* from customers c, orders o, order_details od 
where c.customer_id = o.customer_id 
    and o.order_id = od.order_id 
    group by od.order_id having count(od.item_id) > 1;