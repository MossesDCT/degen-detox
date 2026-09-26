# Degen Detox: Solana Seeker testavimo eiga

## V0.5: grįžimas iš piniginės

Ši pataisa skirta tam, kad baigus mokėjimo arba pirkimo atkūrimo veiksmą vartotojas grįžtų į Degen Detox, o ne turėtų programėlę atidaryti iš naujo. Tavo jau sėkmingas pirkimas nėra atšaukiamas; mokėti pakartotinai nereikia.

## Kaip atnaujinti neprarandant Pro

1. Atsisiųsk `Degen-Detox-v0.5-TELEFONUI.zip`.
2. Išskleisk archyvą ir atidaryk vienintelį `Degen-Detox-v0.5.apk`.
3. Pasirink **Atnaujinti**. Senos programėlės nešalink ir jos duomenų nevalyk.
4. Atidaryk **Degen Detox**, ne QA, ir nustatymuose patikrink **v0.5**.
5. Patikrink, ar jau įsigyta Pro prieiga liko aktyvi.

Paketo ID, pasirašymo sertifikatas ir pirkimo kvito saugojimo raktai nepasikeitė. Atskirais testais patikrintas jau išsaugotų SOL ir SKR kvitų nuskaitymas; mokėjimų gavėjas ir kainos taip pat nekeičiami.

## Kaip patikrinti grįžimą nemokant iš naujo

1. Nustatymuose pasirink **Atkurti pirkimą**.
2. Mokėjimų lange paspausk atkūrimo mygtuką ir pasirink tą pačią piniginę, iš kurios jau sumokėjai.
3. Piniginėje perskaityk užklausą. Tai turi būti **atkūrimo žinutės pasirašymas**, ne SOL ar SKR pervedimas.
4. Patvirtinęs turėtum grįžti į Degen Detox. Patvirtinus kvitą rodoma Pro prieiga ir mygtukas **„Tęsti Degen Detox“**.
5. Šis mygtukas uždaro tik mokėjimų langą, ne programėlę.

Jeigu matai prašymą pervesti 0,1 SOL ar 500 SKR, neatlik jo vien šiam patikrinimui: tai būtų pirkimo, ne atkūrimo veiksmas. Atkūrimui pinigų pervedimas nereikalingas.

## Kas pakeista techniškai

- Piniginės bibliotekoje užregistruotas Android grįžimo atsakymo gavėjas, įskaitant jo pakartotinį prijungimą po Activity konfigūracijos pakeitimo.
- Dabar laukiama tikro piniginės sesijos uždarymo, o ne vien uždarymo komandos išsiuntimo.
- Po užbaigto pasirašymo arba grįžimo atsakymo programėlė paprašo Android grąžinti esamą Degen Detox ekraną į priekį. Nekuriama nauja programėlės užduotis ir neišvaloma esama ekranų istorija.
- Sutvarkytas Android užduoties susiejimas. Išsaugotas esamas Flutter ekranas ir mokėjimo būsena, jei procesas tebėra gyvas.
- Uždarymo ar grįžimo klaida nebegali paslėpti jau gauto pasirašymo rezultato ar panaikinti išsaugoto laukiančio mokėjimo.
- Pridėtas aiškus Pro patvirtinimas ir mygtukas tęsti programėlėje.

Solana MWA integravimo gairės numato, kad užbaigus pasirašymą dApp uždaro sesiją, o piniginė užbaigia savo ekraną ir grąžina valdymą programėlei: [Mobile Wallet Adapter integravimo gairės](https://github.com/solana-mobile/mobile-wallet-adapter/blob/main/android/docs/integration_guide.md).

## Patikros ir likęs patvirtinimas

Praėjo **63 automatiniai testai**, aktyvaus kodo analizė be klaidų, Android APK surinkimas ir parašo patikra. Naršyklės regresijos scenarijus baigėsi be JavaScript klaidų; naujas Pro patvirtinimo mygtukas ir jo grįžimas į programėlę tikrinti komponentų testuose visomis šešiomis kalbomis.

Tai nėra įrodymas, kad Android ir konkreti tavo piniginė tikrai grąžins ekraną taip pat: šiam pataisymui dar reikia tavo Seeker patvirtinimo. Ankstesnio išėjimo priežastis be telefono klaidų žurnalo nėra galutinai nustatyta, tačiau rastos grįžimo srauto spragos pašalintos.

Jei vis tiek grąžins į telefono pradžios ekraną, parašyk, ar prieš tai matei Pro patvirtinimą, ir nurodyk piniginės pavadinimą. Naudingas trumpas ekrano įrašas, bet nerodyk atkūrimo frazės, privačių raktų, PIN ar slaptažodžių.
