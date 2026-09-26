# Degen Detox v0.2: testavimo leidimas

Paruošti du pasirašyti Android APK. Abu skirti testavimui, naudoja tą patį kūrimo sertifikatą ir skirtingus programėlių identifikatorius, todėl gali būti įdiegti kartu.

## Paketai

| Failas | Identifikatorius | Paskirtis |
|---|---|---|
| Degen-Detox-QA-v0.2.apk | com.degendetox.app.qa | Visų funkcijų bandymas be pirkimo; tikri mokėjimai išjungti |
| Degen-Detox-Mainnet-v0.2.apk | com.degendetox.app | Tikras Solana piniginės pasirašymas ir Pro atrakinimas pagal patikrintą mokėjimą |

Versija: `0.2.0`, versijos kodas `2`. Flutter vykdymo dalis sukurta ARM64 telefonui. Tai nėra AAB parduotuvės publikavimui.

## Kainodara

0,1 SOL arba 500 SKR, vieną kartą už Pro prieigą visam laikui. Jokių prenumeratų ar mėnesinių programėlės mokesčių; tinklo mokesčiai atskiri. Mokėję SKR gauna papildomą „Touch Grass“ funkciją.

Gavėjas: `[archyvinis adresas pasalintas; mokejimams naudok v0.4]`. SKR identifikuojamas pagal tikslų mint adresą `SKRbvo6Gf7GondiT3BbTfuRDPqLWei4j2Qy2NPGZhW3`, skelbiamą [Solana Mobile](https://solanamobile.com/skr), o ne vien pagal simbolį.

## Atliktos patikros

- Abu APK sėkmingai sukompiliuoti iš programėlės kodo įrašo `055ad0e8c2b28f73d4787d76c3468813372e5e53`.
- Abiejų APK skaitmeniniai parašai patikrinti `apksigner`.
- Aktyvaus Dart kodo statinė analizė klaidų ar perspėjimų nerado.
- Praėjo 30 automatinių testų, įskaitant mokėjimų kvitų atmetimo scenarijus ir pirkimo ekranus šešiomis kalbomis.
- Naršyklėje patikrinti pagrindiniai sąsajos scenarijai, vykdymo klaidų neužfiksuota. Tai nepakeičia Android įrenginio bandymų.
- APK leidimų sąraše nėra Google Play Billing, Usage Stats, specialios foreground tarnybos ar SYSTEM_ALERT_WINDOW leidimų. Blokavimas naudojasi vartotojo aiškiai įjungiama Accessibility paslauga.

## Sąžiningos ribos

Šioje aplinkoje nebuvo prijungtas fizinis „Seeker“, todėl realus piniginės dialogas, realus SOL/SKR pervedimas ir telefono foninis veikimas dar nepatikrinti. Agentas nepasirašė ir neišsiuntė jokios mokėjimo operacijos.

APK pasirašyti kūrimo, ne produkciniu savininko raktu. Prieš viešą leidimą reikia fizinio telefono bandymų, produkcinio pasirašymo, vertimų peržiūros, galutinių teisinių tekstų ir nepriklausomos mokėjimų saugos peržiūros. Viešą RPC rekomenduojama pakeisti stabilia produkcine paslauga.

Mokėjimo kvitas tikrinamas pagal Solana grandinės duomenis telefone; centralizuotas licencijų serveris nediegtas. Tai nėra pažadas apsaugoti nuo modifikuotos programėlės ar root turinčio įrenginio.

## SHA-256

```text
QA:
abd31de1f4cf0ed838b5c7d0673a284d8159428202f0a71e3f885420b57a545c

Mainnet:
2de6d04c683e5375bb168d3b3a6f032fe2b51af40b477cb520b25c33601b785b
```

Pradėk nuo `TESTING.md`. Nepirk pakartotinai, jei pirmoji operacija dar laukia patvirtinimo.
