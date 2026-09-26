# Degen Detox: Solana Seeker testavimo eiga

## V0.7: greitas atidarymas, griežtas blokas ir SKR testas

Tai asmeniniam kūrėjo bandymui paruošta versija su tikrais Mainnet mokėjimais. Ji nesuteikia nemokamos Pro prieigos ir automatiškai neištrina turimo pirkimo. Specialus vietinio pirkimo atstatymo mygtukas įjungtas tik šiame testiniame APK; prieš platinant klientams ar parduotuvei reikia surinkti įprastą versiją be kūrėjo testų žymos.

## Kaip atnaujinti

1. Atsisiųsk `Degen-Detox-v0.7-TELEFONUI.zip`.
2. Išskleisk archyvą ir atidaryk vienintelį `Degen-Detox-v0.7.apk`.
3. Pasirink **Atnaujinti**. Senos programėlės nešalink ir jos duomenų nevalyk.
4. Nustatymuose patikrink **v0.7**.

Paketo identifikatorius ir pasirašymo sertifikatas išsaugoti. Mokėjimo gavėjas, 0.1 SOL ir 500 SKR kainos nekeičiami.

## Pirmiausia patikrink mygtuką

Prieš atstatydamas Pro, atidaryk **Šiandien → Nustatyti blokavimą** vienu paspaudimu. Langas turi atsidaryti nelaukdamas visų įdiegtų programėlių nuskaitymo. Jei Android būsenos atsakymo dar nėra, trumpai rodomas tikrinimo indikatorius, ne ignoruojamas paspaudimas.

Pakartotiniai paspaudimai nebekuria papildomų to paties lango kopijų. Programėlių ir piktogramų nuskaitymas atliekamas tik atvėrus jų pasirinkimą, Android foninėje gijoje.

## Griežtas blokavimo režimas

- Iki aktyvavimo pasirenki pabudimo laiką, 1–4 valandų trukmę ir programėles.
- Išsaugant grafiką papildomai patvirtini, kad supranti griežto bloko sąlygas.
- Blokavimui prasidėjus, lange rodoma **„Blokavimas aktyvus“**, **„Automatiškai baigsis …“**, likęs laikas ir užrakintas sąrašas.
- Programėlėje nebelieka stabdymo mygtuko. Iki pabaigos negalima trumpinti trukmės, keisti pabudimo laiko ar programėlių sąrašo.
- Apribojimą tikrina ir Android kodas: jei blokas prasideda tuo metu, kai dar atidarytas redagavimo langas, bandymas išsaugoti pakeitimus atmetamas.
- Pasibaigus dabartiniam blokui redagavimas vėl tampa prieinamas. Išsaugotas kasdienis grafikas toliau galioja kitoms dienoms.
- Dėl Pro atstatymo aktyvus blokas nenutraukiamas.

Tai griežtas režimas pačioje programėlėje, ne neapeinamas Android sistemos užraktas. Telefonas, sistemos įrankiai ir palaikomos piniginės lieka pasiekiami. Programėlė neatima tavo telefono sistemos valdymo ir neužblokuoja skubios pagalbos.

Anksčiau patikrintas 10 sekundžių blokavimo pranešimas paliktas. Jo mygtukas „Uždaryti pranešimą“ slepia tik pranešimą, ne išjungia blokavimą.

## Laiko nustatymas

Kai nėra aktyvaus bloko, paspausk pabudimo laiką. Iš karto atsidaro du skaitmeniniai laukai: **Valandos** ir **Minutės**.

Pirmą kartą palietus lauką pažymima visa ankstesnė jo reikšmė, todėl galima iš karto įvesti naują. Naudojamas 24 valandų įvedimas: valandos 0–23, minutės 0–59; netinkamas laikas nepriimamas.

## Kaip pašalinti tik vietinę Pro prieigą SKR bandymui

1. Atidaryk **Nustatymai**.
2. Viršuje spausk **„Kūrėjo testas · panaikinti vietinę Pro“**.
3. Perskaityk paaiškinimą. Dialoge rodoma dabartinio pirkimo piniginė ir operacijos parašas.
4. Patvirtink vietinės Pro prieigos atstatymą.
5. Pro funkcijos vėl prašys pirkimo. Tavo sąrašas, ryto grafikas ir savijautos įrašai išlieka; nepradėtas ar nepatvirtintas mokėjimas nėra ištrinamas.

Šis veiksmas **negrąžina pinigų, neatšaukia ankstesnio pervedimo ir neištrina jo blokų grandinės istorijos**. Vietinio kvito atsarginė kopija išsaugoma saugioje saugykloje. Jeigu yra laukiantis mokėjimas, atstatymas neleidžiamas, kol jis neišspręstas.

Pakartotinis pirkimas yra tavo pasirinktas tikras mokėjimo bandymas, ne būtina sąlyga susigrąžinti turėtą prieigą. Esamą pirkimą galima atkurti su ta pačia mokėjusia pinigine.

## Kaip išbandyti SKR ir Touch Grass

1. Po vietinės Pro atstatymo atverk Pro pirkimo langą.
2. Pasirink **500 SKR**, ne SOL ir ne ankstesnio pirkimo atkūrimą.
3. Programėlės bei piniginės patvirtinimo languose patikrink sumą, gavėją ir papildomas išlaidas. Patvirtink tik jei viskas teisinga.
4. Tik po sėkmingai patikrinto mokėjimo turėtų atsirasti **SKR + Touch Grass** prieiga.
5. Atverk **Ritualai → Touch Grass**.
6. Patikrink animacijos peržiūrą, tada pasirink 1–8 valandų intervalą ir įjunk priminimus.
7. Suteik pranešimų leidimą, jei paprašys.
8. Greitam natyvaus pranešimo bandymui naudok ten esantį testinio priminimo mygtuką. Jis suplanuoja pranešimą maždaug po 10 sekundžių; OS gali jį pavėlinti.
9. Gavęs pranešimą paspausk jį ir patikrink, kad atsidaro Touch Grass scena.
10. Uždaryk ir vėl atidaryk programėlę: nauja SKR prieiga neturi dingti. Atstatymas nevyksta automatiškai per kitus paleidimus.

Jeigu mokėjimas užstrigo laukiant patvirtinimo, nemokėk dar kartą ir nevalyk programėlės duomenų. Pirmiausia naudok atkūrimo eigą arba pateik matomą klaidos pranešimą; nerodyk PIN, atkūrimo frazės ar privačių raktų.

## Patikros ribos

Praėjo 94 Flutter testai su kūrėjo testų žyma ir 17 Android logikos testų, taip pat APK surinkimas, pasirašymo patikra ir naršyklės sąsajos regresija. Šiame darbe pats neatlikau naujo tikro SKR pervedimo ir nevaldžiau tavo Seeker.

Todėl naujo mygtuko reakciją, griežto režimo veikimą ir realų SKR mokėjimą dar reikia patvirtinti tavo telefone. Ankstesnį v0.6 blokavimo pranešimo veikimą tu jau patvirtinai.
