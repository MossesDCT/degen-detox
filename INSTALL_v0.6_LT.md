# Degen Detox: Solana Seeker testavimo eiga

## V0.6: leidimai, blokavimo pranešimas ir programėlių paieška

Šis atnaujinimas nekeičia mokėjimų gavėjo, kainų ar turimos Pro prieigos. Nebūtina mokėti dar kartą; ankstesnė piniginės grįžimo pataisa palikta.

## Atnaujinimas telefone

1. Atsisiųsk `Degen-Detox-v0.6-TELEFONUI.zip`.
2. Išskleisk ZIP. Viduje yra tik vienas failas: `Degen-Detox-v0.6.apk`.
3. Atidaryk APK ir pasirink **Atnaujinti**.
4. Senos programėlės nešalink ir jos duomenų nevalyk.
5. Atidaryk Degen Detox ir nustatymuose patikrink **v0.6**, turimą Pro ir pasirinktų programėlių sąrašą.

Paketo identifikatorius ir pasirašymo sertifikatas išsaugoti, kaip ir saugios mokėjimo kvito saugyklos raktai. Nauja versija skirta atnaujinimui ant ankstesnės Mainnet programėlės, ne atskiros QA programėlės.

## Trumpesnis leidimų vedlys

- Jei tarnyba jau veikia, matysi „Leidimas suteiktas · tarnyba prijungta“ ir „Baigta“. Pakartotinai leidimo suteikti nereikia.
- Jei dar neįjungta, perskaityk trumpą paskirties paaiškinimą, pažymėk sutikimą ir spausk **„Atverti blokatoriaus nustatymus“**.
- Programėlė mėgina atidaryti savo tarnybos nustatymus tiesiogiai. Jei telefono sistema nepalaiko šio kelio, atsidaro bendri pritaikymo neįgaliesiems nustatymai.
- Jei Android neleidžia įjungti tarnybos, vedlyje spausk **„Rodo „Prieiga nesuteikta“ ar apribojimą?“**.
- Pagalbos kortelėje parodoma, kur ieškoti **⋮**. Mygtukas **„Atverti Degen Detox informaciją“** atidaro būtent šios programėlės informaciją, todėl jos nereikia ieškoti bendrame programų sąraše.
- Ten rinkis **⋮ → Leisti apribotus nustatymus**, jei punktas rodomas. Patvirtink telefono atrakinimu, grįžk „Atgal“, tada įjunk blokatoriaus tarnybą.
- Grįžus tikrinama tikra leidimo ir tarnybos būsena. Vien grįžimas iš nustatymų nelaikomas suteiktu leidimu.

„Android“ gali taikyti papildomus apribojimus atsisiųstoms programėlėms. Jų negalima saugiai pakeisti vartotojo vardu; oficiali eiga pateikiama [Google instrukcijoje](https://support.google.com/android/answer/12623953?hl=en). Neišjunk Play Protect ir neapeik darbo ar prižiūrimo telefono administratoriaus politikos.

### Kodėl Cortisol Zero galėjo neprašyti papildomo žingsnio?

Palyginus abiejų projektų ankstesnį kodą, abi programėlės atidarydavo tą patį bendrą pritaikymo neįgaliesiems nustatymų ekraną. Taigi tai nebuvo kitas Accessibility mechanizmas.

Tikėtinos priežastys: skirtingas diegimo kelias arba tai, kad senajai programėlei papildomas leidimas jau buvo suteiktas. Diegimas iš failų tvarkyklės ir diegimas per programėlių parduotuvės mechanizmą gali būti vertinami skirtingai, kaip aprašoma [Android apribojimų paaiškinime](https://www.androidauthority.com/android-15-restricted-settings-sideloading-3481098/). Konkrečios tavo Cortisol Zero diegimo istorijos šiame telefone nepatikrinome, todėl priežastis nėra patvirtinta.

## Blokavimo pranešimo patikrinimas

1. Pasirink bandomą programėlę ir nustatyk ryto apsaugos laiką taip, kad dabartinis laikas patektų į 1–4 valandų intervalą.
2. Ryto apsaugos lange spausk **„Išsaugoti“**.
3. Atidaryk pasirinktą blokuojamą programėlę.
4. Turėtum būti grąžintas į pagrindinį ekraną, o miško fono pranešimas ir likusio blokavimo laiko skaitiklis turėtų likti iki **10 sekundžių**.
5. Pakartok ir spausk **„Uždaryti pranešimą“**. Pranešimas užsidaro, bet blokavimo grafikas lieka aktyvus.
6. Patikrink, kad telefonas ir neblokuojamos programėlės išlieka pasiekiami. Pranešimas turi pasitraukti atidarius kitą neblokuojamą programėlę, sistemos langą arba užrakinus telefoną.

Rasta ankstesnė kodo klaida: blokatorius pats atidarydavo pagrindinį ekraną, o jo atsidarymo įvykį laikydavo priežastimi panaikinti pranešimą dar prieš keturių sekundžių laikmatį. Dabar pagrindinio ekrano ir paties pranešimo įvykiai jo nenaikina. Automatinio uždarymo užduotis atšaukiama uždarant pranešimą, kad senas laikmatis neuždarytų naujo pranešimo.

Jei vienu metu tą pačią programėlę blokuoja ir Cortisol Zero, bandymui sustabdyk tik jo blokavimo grafiką, kad dviejų blokatorių pranešimai nesimaišytų. Jų abiejų šalinti nereikia.

## Programėlių sąrašas ir paieška

1. Ryto apsaugoje atverk **„Pasirink programėles“**.
2. Paieškoje įrašyk pavadinimo dalį, pavyzdžiui, `bina`. Didžiosios ir mažosios raidės nesvarbios.
3. Pažymėk norimas programėles. Filtruojant jau pažymėti pasirinkimai išlieka.
4. Filtras **„Tik pasirinktos“** parodo tik pažymėtas programėles.
5. Spausk **„Išsaugoti · N“**. Ryto apsaugos lange dabar matysi jų pavadinimus ir piktogramas, ne vien skaičių.
6. Ryto apsaugos lange dar kartą spausk **„Išsaugoti“**, kad pasirinkimas būtų pritaikytas blokavimo grafikui.
7. Uždaryk ir vėl atidaryk Degen Detox. Patikrink, kad išliko pasirinkimai.

Programėlių pasirinkimo lango uždarymas nepaspaudus „Išsaugoti“ atmeta to lango nepatvirtintus pakeitimus. Jei programėlių nepavyksta įkelti, rodoma klaida ir pakartojimo mygtukas, o esamas pasirinkimas nėra ištrinamas.

## Patikrinta ir ką dar reikia patvirtinti telefone

Praėjo **74 Flutter ir 11 Android logikos testų**. Jie apima šešias kalbas, paiešką, filtrus, pasirinkimo išsaugojimo veiksmą, klaidos pakartojimą, leidimų būsenas bei pranešimo rodymo politiką; APK surinkimas ir parašo patikra taip pat sėkmingi.

Automatiniai testai ir naršyklės peržiūra nepakeičia tikro Seeker bandymo. Būtent jame dar reikia patvirtinti tiesioginį kelią į tarnybos nustatymus ir pranešimo trukmę; pats blokatorius jau buvo tavo patikrintas ankstesnėje versijoje.
