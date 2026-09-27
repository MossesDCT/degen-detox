# Degen Detox: Solana Seeker testavimo eiga

## V0.10: Touch Grass paukščių signalas

Vietoje bendro trumpo pranešimo pyptelėjimo paruoštas **3,2 sekundės paukščių čiulbėjimas**, švelniai prasidedantis ir nutylantis pabaigoje. Pranešimui taip pat numatyta trumpa vibracija; seniau paties vartotojo nutildyti ar pakeisti nustatymai neapeinami.

Garsas įtrauktas į APK ir jam nereikia interneto ar veikiančio Flutter ekrano. Pro/SKR prieiga, mokėjimų sumos, ingredientų žymėjimai, asmeninis ritualas ir blokavimo nustatymai nekeičiami.

## Kaip atnaujinti

1. Atsisiųsk **Degen-Detox-v0.10-TELEFONUI.zip**.
2. Išskleisk archyvą ir atidaryk vienintelį **Degen-Detox-v0.10.apk**.
3. Pasirink **Atnaujinti**. Senos programėlės nešalink ir duomenų nevalyk.
4. Nustatymuose patikrink **v0.10**.

APK turi tą patį paketą ir pasirašymo sertifikatą. Tavo SKR pirkimo iš naujo atlikti nereikia.

## Kaip patikrinti užrakintame telefone

1. Atverk **Ritualai → Touch Grass**.
2. Patikrink, kad telefono **pranešimų garsumas** nėra nulinis. Medijos garsumas nėra tas pats valdiklis, kurį naudoja šis pranešimas.
3. Pirmam bandymui pats išjunk tylos ir „Netrukdyti“ režimus, jei jie įjungti.
4. Paspausk **„Bandomasis pranešimas po 10 sekundžių“** ir suteik pranešimų leidimą, jei telefonas jo paprašys.
5. Užrakink ekraną ir palauk. Bandymas suplanuojamas po 10 sekundžių, tačiau Android gali jį pavėlinti.
6. Patikrink paukščių garsą, vibraciją ir pranešimą užrakintame ekrane.
7. Paliesk pranešimą: turi atsidaryti ankstesnė Touch Grass animacija.

Pridėtas atskiras **„Touch Grass: paukščių garso perklausa“** MP3 leidžia išgirsti garso fragmentą prieš diegiant. Tai tik perklausa per medijos grotuvą, o ne Android pranešimo bandymas.

## Jei vis dar tylu ar pranešimo nesimato

Touch Grass lange yra naujas mygtukas **„Garso ir pranešimo nustatymai“**, atveriantis būtent šio priminimo Android nustatymus. Ten patikrink, ar kanalas leidžiamas, pasirinktas garsinis režimas, leidžiama vibracija bei rodymas užrakintame ekrane; pavadinimai gali skirtis pagal telefono sistemą.

Android programėlė negali pakeisti jau sukurto kanalo garso ar svarbos taip, kad perrašytų vartotojo pasirinkimus, todėl paukščių garsui sukurtas naujas stabilus kanalas; paties vartotojo nutildymas ir pasirinktas garsas išsaugomi, kai juos galima nustatyti ([Android pranešimų kanalų dokumentacija](https://developer.android.com/develop/ui/views/notifications/channels)).

Tai tebėra priminimas, ne žadintuvas, apeinantis tylos režimą. Programėlė nekeičia sistemos garsumo, neapeina „Netrukdyti“, nepriverstinai atrakina ar įjungia ekrano; matomumas ir girdimumas galutinai priklauso nuo telefono nustatymų.

## Patikros

Praėjo **144 Flutter testai**, **22 Android logikos testai**, statinė analizė, APK surinkimas ir parašo patikra. APK viduje patikrintas 3,2 sekundės garso išteklius ir jo atitikimas paruoštam failui.

Tavo fizinio Seeker šiame darbe nevaldžiau. Todėl tikrą garso stiprumą, rodymą užrakintame ekrane ir pranešimo pristatymą dar reikia patvirtinti aukščiau aprašytu telefono bandymu.
