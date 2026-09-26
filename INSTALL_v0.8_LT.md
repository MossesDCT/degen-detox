# Degen Detox: Solana Seeker testavimo eiga

## V0.8: papildomas SKR pirkimas ir savistabos apžvalga

Šiame atnaujinime išsaugoma tavo jau įsigyta SKR prieiga, ankstesni savistabos įrašai ir blokavimo nustatymai. Nebereikia šalinti Pro ar mokėti dar kartą; ankstesniam bandymui skirtas vietinės Pro panaikinimo mygtukas šioje versijoje išjungtas.

## Kaip atnaujinti telefone

1. Atsisiųsk **Degen-Detox-v0.8-TELEFONUI.zip**.
2. Telefono failų programėlėje išskleisk archyvą. Viduje yra tik vienas failas: **Degen-Detox-v0.8.apk**.
3. Atidaryk APK ir pasirink **Atnaujinti**.
4. Programėlės nustatymuose patikrink **v0.8**.

**Senos programėlės nešalink ir jos duomenų nevalyk.** Naujas APK turi tą patį paketo identifikatorių ir pasirašymo sertifikatą. Diegimui nereikia Android Studio, kompiuterio ar naujos mokamos paslaugos; jei telefonas paprašys leidimo diegti iš pasirinktos failų programėlės, suteik jį šiam diegimui.

## SOL Pro papildymas už 500 SKR

SOL Pro turintis klientas gali atverti Pro pirkimo langą per piniginės piktogramą viršuje arba pasirinkti dar neprieinamą **Touch Grass**. Pirkimo lange atsiranda **„Pridėti Touch Grass“** ir **„Pridėti už 500 SKR“**.

- Tai atskiras vienkartinis **500 SKR** mokėjimas, ne prenumerata.
- Ankstesnis 0.1 SOL mokėjimas neįskaitomas į kainą ir negrąžinamas.
- Esama Pro prieiga išlieka aktyvi atšaukus pirkimą, įvykus klaidai arba laukiant patvirtinimo.
- Papildoma SKR prieiga įjungiama tik patikrinus galutinai patvirtintą mokėjimą.
- Jei jau yra laukiantis mokėjimas, naujo pradėti negalima. Pirmiausia reikia patikrinti ar atkurti esamą.
- Turint SKR prieigą, papildomas pirkimas nebesiūlomas. Tau, jau sumokėjusiam SKR, Touch Grass turi likti prieinamas be naujo mokėjimo.

Kainos ir gavėjas nekeisti: 0.1 SOL arba 500 SKR, gavėjas `6vqJTwDWoNXauztA3e8psbnrm4bNWFDAG218NbAMPgaG`. Piniginėje papildomai matomi tinklo mokesčiai ir, jei reikia, žetono gavimo sąskaitos sukūrimo išlaidos; prieš pasirašydamas viską patikrink.

## Ką duoda Impulso patikra

Tai trumpas sustojimas prieš impulsyvų rinkų tikrinimą. Įvertini potraukį nuo 1 iki 10 ir, jei nori, užsirašai aplinkybes, pavyzdžiui, „po pranešimo apie kritimą“ ar „ramus rytas be naujienų“.

Ankstesnė versija tik kaupė šiuos įrašus. Dabar nemokama **„Tavo potraukio apžvalga“** pasiekiama „Šiandien“ savistabos kortelėje ir pačioje Impulso patikroje:

- Po **3 tinkamų įrašų per paskutines 30 dienų** rodomas vidurkis, mažiausias ir didžiausias įvertis bei iki 14 naujausių įverčių stulpelių.
- Rodomi nakties, ryto, dienos ir vakaro vidurkiai kartu su įrašų skaičiumi.
- Didesnio ir mažesnio paros laikotarpio vidurkio palyginimas atsiranda nuo **5 įrašų**, jei bent dviejuose skirtinguose laikotarpiuose yra bent po 2 įrašus.
- Jei visi palyginami vidurkiai vienodi, taip ir parašoma. Vienas išskirtinis įrašas pats savaime nelaikomas paros dėsningumu.
- Rodomi iki 10 naujausių įrašų su data, laiku, įverčiu ir tavo pastaba.
- Įrašai lieka šiame telefone. Seni tinkami įrašai naudojami kartu su naujais.

Geriausia pildyti skirtingu metu, ne vien tada, kai potraukis stiprus. Tai tavo įrašų apžvalga, ne visos dienos stebėjimas, medicininė diagnozė, kortizolio matavimas ar įrodymas, kas sukėlė potraukį.

## Google programėlės ir pradinis ekranas

Programėlių sąrašo filtras dabar leidžia pasirinkti konkrečias iš anksto įdiegtas vartotojo programas, įskaitant YouTube, Gmail, Chrome, YouTube Music, Google Photos, Maps ir Drive, jei jos įdiegtos ir turi paleidžiamą programėlės ekraną. Sistemos nustatymai, telefono sistemos komponentai, paleidiklis ir palaikomos piniginės į blokuojamų programų sąrašą neįtraukiami.

„Šiandien“ ekranas turi įrėmintą miško vaizdą, vieną šūkį, trumpesnes nemokamų funkcijų korteles ir subtilią baigtinę atidarymo animaciją. Animacija išjungiama, kai sistemos nustatymai prašo mažiau judesio; nemokamų, Pro ir SKR funkcijų eiliškumas išsaugotas.

## Ką patikrinti Seeker

1. Po atnaujinimo atverk Touch Grass ir įsitikink, kad SKR prieiga liko aktyvi.
2. Kai rytinis blokas neaktyvus, atverk programėlių pasirinkimą ir paieškoje įvesk **YouTube**, po to **Gmail**. Pasirink norimas, išsaugok ir patikrink blokavimą nustatytu laiku.
3. Atlik 3 Impulso patikras su skirtingais įverčiais ir pastabomis. Atverk **„Tavo potraukio apžvalga“** ir palygink su įvestais duomenimis.
4. Kitais paros laikais papildyk įrašus, kad atsirastų prasmingesnis laikotarpių palyginimas.
5. Uždaryk ir vėl atidaryk programėlę. Prieiga, įrašai ir pasirinktos programėlės turi išlikti.

Naują SOL Pro → SKR papildymo kelią dar reikės patvirtinti SOL Pro turinčio bandytojo telefone. Tavo jau veikiančios SKR prieigos dėl šio testo naikinti nereikia.

## Patikros ribos

Praėjo 119 Flutter testų, 19 Android logikos testų, statinė analizė, APK surinkimas ir parašo patikra. Naršyklėje patikrintas naujas pradinis ekranas, trijų įrašų apžvalga, blokavimo nustatymų bei kitų pagrindinių ekranų regresija.

Pats nevaldžiau tavo Seeker ir neatlikau tikro papildomo SOL Pro → SKR pervedimo. Google programėlių pasirinkimą bei jų blokavimą šiame telefone dar reikia patikrinti; automatinių testų ir surinkimo sėkmė šio fizinio bandymo nepakeičia.
