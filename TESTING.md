# Degen Detox: Solana Seeker testavimo eiga

Pirmiausia naudok QA versiją. Joje galima bandyti Pro funkcijas nemokant; tikrų mokėjimų mygtukai išjungti. Atskirą Mainnet versiją naudok tik piniginės integracijos patikrai.

## Įdiegimas

- Atsisiųsk `Degen-Detox-QA-v0.2.apk` telefone ir atidaryk failą. Prireikus leisk tam failų atidarytuvui diegti programėles iš nežinomų šaltinių.
- Paleisk „Degen Detox QA“. Ekrane turi būti aiški QA juosta.
- Nustatymuose pasirink lietuvių ar kitą kalbą. Patikrink šviesią bei tamsią temas.
- Testiniai APK pasirašyti kūrimo raktu, ne parduotuvės produkciniu raktu. Tai ne „Google Play“ ar „Solana dApp Store“ publikacija.

## Rytinis blokavimas

- Atidaryk „Ryto apsauga“, perskaityk leidimo paaiškinimą ir atidaryk Android pritaikymo neįgaliesiems nustatymus.
- Įjunk „Degen Detox QA“ paslaugą. Jei Android neleidžia dėl iš šalies įdiegtos programėlės, programėlės informacijos lange gali reikėti leisti ribojamus nustatymus. Tai daryk tik savo sąmoningai įdiegtam APK.
- Pasirink vieną neesminę programėlę. Nenaudok banko ar skubiai reikalingo įrankio pirmam bandymui.
- Paspausk „QA: blokuoti pasirinktas programėles 2 minutes“, tada bandyk atidaryti pasirinktą programėlę. Ji turėtų būti grąžinta į pradžios ekraną ir parodytas Degen Detox vaizdas.
- Patikrink, kad telefono nustatymai, skambučiai, pradžios ekranas ir pati Degen Detox liktų pasiekiami.
- Grįžęs paspausk sustabdymo mygtuką. Įsitikink, kad blokavimas baigėsi.
- Tik po to nustatyk pabudimo laiką po kelių minučių ir 1 valandos trukmę. Išsaugok, užrakink ekraną, palauk ir patikrink pradžią bei pabaigą.
- Papildomai patikrink perkrovimą, 23:00–01:00 langą ir laiko juostos pasikeitimą. Priverstinis programėlės sustabdymas Android nustatymuose gali stabdyti jos foninį veikimą.

## Touch Grass

- Pasirink intervalą 1–8 valandos ir leisk pranešimus.
- Paspausk „Bandomasis pranešimas po 10 sekundžių“, išeik iš programėlės ir palauk. Android gali pavėlinti net bandomąjį negriežto laiko signalą.
- Paspaudus pranešimą turi atsidaryti žolės animacija. Ji neprivalo automatiškai perimti ekrano virš kitos programėlės.
- Patikrink garsą, kai telefonas ne „Netrukdyti“ režime. Sistemos pranešimų kanalo nutildymas turi viršenybę prieš programėlės pageidavimą.
- Palik 1 valandos intervalą įjungtą ilgesniam bandymui, vėliau patikrink išjungimą ir perkrovimą.

## Nemokamos ir kitos Pro funkcijos

- Išbandyk kvėpavimo pradžią, pauzę, pratęsimo mygtuką ir programėlės perėjimą į foną.
- Įrašyk savistabos pastabą, perkrauk programėlę, patikrink, kad savistabų skaičius išlieka; paskui ištrink įrašus.
- Atidaryk receptus, ingredientus ir instrukcijas. Patikrink po vieną receptą kiekviena kalba.
- Užbaik trijų žingsnių vakaro ritualą.

## Tikrų mokėjimų versija

Įdiek `Degen-Detox-Mainnet-v0.2.apk`. Ji gali būti telefone kartu su QA; šios programėlės turi atskiras vietines saugyklas. Mainnet versijoje Pro be pirkimo neturi būti atrakintas.

- **SOL:** 0,1 SOL vienkartinis mokėjimas. Pro visam laikui, be „Touch Grass“.
- **SKR:** 500 SKR vienkartinis mokėjimas. Pro visam laikui ir „Touch Grass“.
- **Papildomos išlaidos:** Solana tinklo mokestis; SKR taip pat reikia SOL, o pirmam gavėjo žetono sąskaitos sukūrimui gali būti priskaičiuotas jos sukūrimo mokestis. Patikrink piniginėje rodomą visą sumą.
- **Gavėjas:** `4pJkHCrfZKWJS6Jb5LyWCUAYhuxx9abKA9WniysS938e`.
- **SKR mint:** `SKRbvo6Gf7GondiT3BbTfuRDPqLWei4j2Qy2NPGZhW3`, pagal [oficialų Solana Mobile puslapį](https://solanamobile.com/skr).

Pirmam saugiam bandymui atidaryk pirkimą, patikrink gavėją ir kainą, tęsk į piniginę, o ten užklausą ATMESK. Pro neturi atsirakinti.

Tik pats nusprendęs atlik tikrą mokėjimą. Tai tikri mainnet pinigai, ne demonstracija. Agentas už tave operacijos nepasirašė ir nesiuntė.

Gavėjo piniginė negali pirkti pati iš savęs. Tikram mokėjimui bandyti naudok kitą savo kontroliuojamą piniginę su ribotu balansu. Nemokamam funkcijų testui yra QA versija.

## Pirkimo atkūrimas ir klaidos

- Po sėkmės išsisaugok programėlėje rodomą operacijos parašą.
- Patikrink pirkimo atkūrimą. Pasirink tą pačią mokėjusią piniginę ir pasirašyk atkūrimo žinutę. Tai ne pervedimas.
- Jei po operacijos nutrūko ryšys, nemokėk antrą kartą. Pasirink „Atkurti pirkimą“.
- Programėlė tikrina užbaigtą sėkmingą operaciją, ne vien piniginės grąžintą atsakymą.
- Senam pirkimui, kurio nėra naujausiuose 1 000 piniginės įrašų, įklijuok jo operacijos parašą.
- Prieiga susieta su mokėjusia pinigine. Praradus jos valdymą, atkūrimas negali automatiškai įrodyti pirkėjo tapatybės.
- Viešas RPC gali laikinai riboti užklausas. Tai nėra priežastis pirkti pakartotinai.

## Kaip pranešti apie problemą

Atsiųsk ekraną ir nurodyk: QA ar Mainnet versija, telefono Android versija, naudota piniginė, pasirinkta kalba, atlikti veiksmai ir gautas rezultatas. Jei problema su mokėjimu, galima pridėti viešą operacijos parašą; NIEKADA nesiųsk privataus rakto ar atkūrimo frazės.

Šis dokumentas yra testavimo planas, ne teiginys, kad visi fizinio telefono bandymai jau atlikti.
