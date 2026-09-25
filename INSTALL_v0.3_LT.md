# Degen Detox: Solana Seeker testavimo eiga

v0.3 leidime pateikiama Android programėlė su tikrais Solana mainnet mokėjimais, ne nemokamai atrakinta QA demonstracija. Diegimo archyve yra tik vienas APK; nereikia Android Studio, Expo, papildomos kompiliavimo paslaugos ar kompiuterio.

## Įdiegimas Seeker telefone

1. Atsisiųsk prisegtą `Degen-Detox-v0.3-TELEFONUI.zip`.
2. Telefono failų tvarkyklėje atidaryk „Atsisiuntimai / Downloads“.
3. Pasirink šį ZIP ir spausk „Išskleisti / Extract“.
4. Atidaryk vienintelį viduje esantį `Degen-Detox-v0.3.apk`.
5. Jei Android paprašo, leisk būtent šiai failų tvarkyklei įdiegti tavo pasirinktą programėlę. Leidimą vėliau gali išjungti.
6. Spausk „Įdiegti“, tada „Atidaryti“.
7. Paleisk **Degen Detox**, ne ankstesnę **Degen Detox QA**. Nauja piktograma: auksinė D raidė su lapu žaliame fone.
8. „Settings → Language“ pasirink „Lietuvių“.

Jei turėjai ankstesnę Mainnet v0.2, naujas APK turi tą patį paketo ID ir pasirašymo sertifikatą, todėl turėtų diegtis kaip atnaujinimas. QA yra atskira programėlė, todėl abi gali likti telefone; jos nesidalija nustatymais ar pirkimais. Neištrink senos mokamos versijos vien tam, kad „pavyktų atnaujinti“: pirmiausia išsisaugok pirkimo operacijos parašą.

## Ką pakeičiau

- **Dizainas:** miško fonas, subtilus fono judėjimas slenkant, pasirodymo animacijos, sodresnės kortelės, auksiniai Pro pavadinimai ir kainos. Išsaugotos šviesi ir tamsi temos.
- **Piktograma:** nauji tikri PNG visiems Android tankiams, adaptyvi ir vienspalvė teminė piktograma; nebe tuščias juodas kvadratas.
- **Žinios:** aštuonios nemokamos temos šešiomis kalbomis, praktiniai veiksmai ir nuorodos į naudotus šaltinius.
- **Leidimai:** paaiškinimas, savanoriškas sutikimas, nuoroda į programėlės informaciją, Android apribojimų instrukcija ir tikra leidimo bei tarnybos prisijungimo būsena.
- **Blokavimo apsauga:** grafiko neleidžiama išsaugoti kaip veikiančio, kol nėra leidimo ir prisijungusios Android tarnybos. Pernaudotas Cortisol Zero mechanizmas jau yra projekte; dabar patikslintas įjungimo procesas.
- **Privatumas:** daugiau aiškių paaiškinimų, ką leidimas daro ir ko nedaro, kur saugomi duomenys bei ką mato mokėjimų tinklas.

## Pirmiausia patikrink blokavimo leidimą, dar nepirkdamas

Eik į **Nustatymai → Leidimai**. Šis langas prieinamas ir nemokamoje versijoje, kad prieš pirkdamas galėtum patikrinti telefono suderinamumą.

Jei pasirodo tavo ankstesniame ekrane matytas „Programai prieiga nesuteikta“, tai nėra leidimas, kurį programėlė gali pati apeiti. Android leidžia patikimai programėlei suteikti apribotus nustatymus per programėlės informaciją, jei įrenginio politika tai leidžia: [Google Android pagalba](https://support.google.com/android/answer/12623953?hl=en).

1. Leidimų lange paspausk **„1 · Programos informacija“**.
2. Viršuje atverk **⋮**.
3. Jei siūloma, pasirink **„Leisti apribotus nustatymus“** ir patvirtink telefono užraktu.
4. Grįžk į Degen Detox leidimų langą, perskaityk paskirtį ir pažymėk sutikimą.
5. Spausk **„2 · Pritaikymas neįgaliesiems“**.
6. Atverk įdiegtų ar atsisiųstų programėlių skyrių, pasirink **Degen Detox** ir įjunk tarnybą.
7. Grįžęs turi matyti **„Leidimas suteiktas · tarnyba prijungta“**. Prireikus spausk „Patikrinti dar kartą“.

Meniu pavadinimai priklauso nuo Android versijos. Jei papildomo meniu nėra arba įrenginio politika neleidžia įjungti tarnybos, atsiųsk tą ekraną; neišjunk Play Protect ir nebandyk apeiti sistemos apsaugų. Apie apribotų nustatymų jautrumą taip pat įspėja [Google](https://support.google.com/android/answer/12623953?hl=en).

## Vienkartinė Pro prieiga

- **0,1 SOL:** Pro visam laikui, rytinis 1–4 val. blokavimas, 20 receptų ir vakaro ritualas.
- **500 SKR:** tas pats Pro ir papildoma „Touch Grass“ priminimų funkcija.
- **Jokių mėnesinių prenumeratų.** Tai vienkartinis mokėjimas, tačiau tinklo mokesčiai mokami atskirai.
- **SKR mokėjimui irgi reikia šiek tiek SOL** tinklo mokesčiui; jei gavėjo žetono sąskaitą reikės sukurti, piniginėje gali būti rodoma papildoma jos sukūrimo išlaida.
- **Gavėjo adresas:** `4pJkHCrfZKWJS6Jb5LyWCUAYhuxx9abKA9WniysS938e`.
- **SKR mint:** `SKRbvo6Gf7GondiT3BbTfuRDPqLWei4j2Qy2NPGZhW3`. Oficialus žetono adresas pateikiamas [Solana Mobile](https://solanamobile.com/skr).

Pirkimas vyksta per suderinamą telefone įdiegtą Solana piniginę. Patvirtinimo lange rodomas gavėjas, suma ir tinklas; atkūrimo frazės ar privataus rakto į Degen Detox įvesti nereikia.

Pirmam patikrinimui gali atidaryti pirkimą ir piniginėje jį atmesti. Pro neturi atsirakinti, o pervedimas neturi įvykti. Tikrą pirkimą tvirtink tik sąmoningai patikrinęs visą operaciją: tai tikri mainnet pinigai, ne testiniai žetonai.

Gavėjo piniginė negali pirkti pati iš savęs. Jei tikrinsi kaip pirkėjas, naudok kitą savo kontroliuojamą piniginę su ribotu balansu. SOL ir SKR scenarijams patikrinti reikia skirtingų pirkėjo piniginių, nes jau turint prieigą programėlė pakartotinį pirkimą stabdo.

## Jei sumokėjus dingo ryšys

Nemokėk antrą kartą. Atverk „Atkurti pirkimą“, pasirink tą pačią mokėjusią piniginę ir patvirtink atkūrimo žinutę; prireikus įklijuok viešą mokėjimo operacijos parašą. Sėkmingo pirkimo parašą išsisaugok.

Programėlė atskiria SOL ir SKR kvitus, tikrina gavėją, sumą, žetoną, mokėtoją, operacijos sėkmę ir galutinį patvirtinimą. Jau patvirtinta vietinė prieiga neturi mėnesinės galiojimo datos. Pakartotiniam įdiegimui reikės mokėjusios piniginės ir tinklo prieigos, o senesniam pirkimui gali reikėti operacijos parašo.

## Pirmas blokavimo bandymas turint Pro

1. Pasirink vieną neesminę programėlę, kurios kelioms minutėms tikrai neprireiks.
2. Nustatyk pabudimo laiką į dabartinės valandos ir minutės laiką, trukmę į 1 valandą.
3. Patikrink leidimų būseną ir išsaugok.
4. Bandyk atidaryti pasirinktą programėlę. Ji turi grąžinti į pagrindinį ekraną.
5. Grįžk į Degen Detox ir paspausk „Sustabdyti blokavimą“.
6. Patikrink, kad pasirinkta programėlė vėl atsidaro. Tik po to susikurk įprastą rytinį grafiką.

Tai savanoriška pagalba laikytis savo ribų, ne neįveikiamas užraktas. Sistemos įrankiai, telefonas, pradžios ekranas, pati programėlė ir atpažįstamos piniginės neįtraukiamos į blokuojamų programėlių sąrašą.

## Privatumas ir sveikatos informacija

Tarnyba reaguoja į atidarytos programėlės identifikatorių, nenuskaito ekrano turinio, slaptažodžių, žinučių ar piniginės atkūrimo frazių. Programėlėje nėra reklamos SDK ar įjungtos analitikos. Savijautos pastabos saugomos telefone nešifruotuose vietiniuose nustatymuose, mokėjimų kvitai saugioje saugykloje; Solana pervedimai yra vieši, o RPC paslaugos teikėjas gauna IP adresą ir užklausose pateiktus viešos piniginės duomenis.

Todėl sąmoningai nevartojame klaidingo pažado „jokių asmeninių duomenų niekur nėra“. Vartotojas turi suprasti tikrą duomenų kelią ir pats valdyti leidimus.

Švietimo medžiaga remiasi [WHO streso gairėmis](https://www.who.int/news-room/questions-and-answers/item/stress), [NCCIH informacija](https://www.nccih.nih.gov/health/stress), [ekranų ir miego tyrimų apžvalga](https://pmc.ncbi.nlm.nih.gov/articles/PMC12754674/), [probleminės prekybos apžvalga](https://pmc.ncbi.nlm.nih.gov/articles/PMC11815345/) ir [NHS pagalba dėl lošimų žalos](https://www.nhs.uk/live-well/addiction-support/gambling-addiction/). Programėlė nepateikiama kaip kortizolio matuoklis, gydymas ar saugaus treidingo garantija; NHS pagalbos kontaktų puslapis pažymėtas kaip JK šaltinis.

## Kas patikrinta ir kas dar ne

Atlikta 40 automatinių testų, aktyvaus kodo statinė analizė be klaidų, Android ARM64 APK surinkimas ir parašo patikra. Naršyklėje patikrinti pagrindiniai srautai, mobilus bei didelis ekranas, kalbos pakeitimas, šviesi tema ir straipsnio atidarymas. Naršyklėje mokėjimai sąmoningai išjungti.

Mano aplinkoje nėra prijungto tavo Seeker, todėl **nepatvirtinu**, kad ši v0.3 jau sėkmingai atliko tikrą SOL / SKR pervedimą, blokavo kitą programėlę ar parodė priminimą tavo telefone. Tai patikriname įdiegę šį APK; vien automatinių testų neužtenka.

APK turi tikrus mokėjimus, tačiau dar nėra parduotuvėje paskelbta ar nepriklausomai audituota produkcija. Jis pasirašytas tuo pačiu kūrimo sertifikatu kaip ankstesnis Mainnet APK, kad būtų galima atnaujinti. Prieš viešą platinimą dar reikia savininko valdomo leidimo rakto, patikimo produkcinio RPC sprendimo, mokėjimų ir telefono patikros, privatumo / pagalbos kontaktų bei vertimų peržiūros. Hakatono tinkamumas dėl senesnio Cortisol Zero pagrindo tebėra atskirai patvirtintinas klausimas.

## Ką atsiųsti po įdiegimo

Pirmiausia užtenka naujos piktogramos ir leidimų lango ekrano. Jei matai „Leidimas suteiktas · tarnyba prijungta“, toliau galėsime tikrinti konkretų blokavimo veiksmą; mokėjimų klaidai pateik viešą operacijos parašą, bet niekada ne privatų raktą ar atkūrimo frazę.
