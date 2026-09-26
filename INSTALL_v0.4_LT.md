# Degen Detox: Solana Seeker testavimo eiga

## V0.4 atnaujinimas

Šios versijos SOL ir SKR mokėjimų gavėjas pakeistas tavo prašymu. Naujas gavėjas:

`6vqJTwDWoNXauztA3e8psbnrm4bNWFDAG218NbAMPgaG`

Tas pats adresas rodomas mokėjimo paaiškinime, naudojamas SOL pervedimui ir SKR gavėjo žetono sąskaitai apskaičiuoti bei kvitams patikrinti. Patikrintas adreso formatas; tai nepatvirtina, kad valdai jo privatų raktą. Prieš mokėjimą gavėją dar kartą sutikrink savo piniginėje.

## Kaip atnaujinti

1. Atsisiųsk `Degen-Detox-v0.4-TELEFONUI.zip`.
2. Telefono failų tvarkyklėje išskleisk ZIP.
3. Atidaryk vienintelį failą `Degen-Detox-v0.4.apk`.
4. Pasirink „Atnaujinti“ arba „Įdiegti“.
5. Paleisk **Degen Detox**, ne **Degen Detox QA**.
6. Nustatymuose patikrink, kad parašyta **v0.4**.

Paketo ID ir pasirašymo sertifikatas išlaikyti, todėl v0.3 neturėtų reikėti pašalinti. Jei Android vietoje atnaujinimo parodo klaidą, atsiųsk ekraną; neskubėk trinti programėlės ir jos vietinių įrašų.

## Kas pakeista ekranuose

Pagrindiniame ekrane liko vienas šūkis:

> Mažiau blogų žinių, grafikų ir streso. Daugiau gyvenimo. Daugiau tavęs.

Kiti pagrindinių funkcijų aprašymai dabar konkretūs: ką funkcija daro, kiek trunka, kas į ją įeina. Nebelieka atskirų „Rinka gali palaukti“, „Mažiau triukšmo“ ir panašių vienas kitą dubliuojančių reklaminių frazių.

Abiejuose ekranuose tvarka:

1. **Nemokamai:** kvėpavimo pratimai, impulso patikra, nuoroda į žinių biblioteką. „Šiandien“ ekrane čia taip pat lieka savistabų suvestinė.
2. **Pro:** ryto apsauga, receptai, vakaro atsitraukimas.
3. **Tik su SKR:** „Touch Grass“, visada pačiame gale.

Išsaugotas žalias miško fonas, animacijos, auksinis Pro stilius ir visos šešios kalbos. Keičiant pagrindinį skirtuką rodoma jo pradžia, o ne ankstesnio skirtuko slinkimo vieta.

## Mokėjimo patikrinimas

- **0,1 SOL:** vienkartinė Pro prieiga visam laikui.
- **500 SKR:** vienkartinė Pro prieiga ir „Touch Grass“.
- **Tinklo išlaidos:** mokamos atskirai; SKR operacijai irgi reikia SOL. Jei gavėjo SKR žetono sąskaita dar nesukurta, gali reikėti jos sukūrimo išlaidos.
- **Piniginė:** mokėtojo adresas turi skirtis nuo naujo gavėjo adreso.

Ankstesniame kode mokėtojo ir gavėjo sutapimas buvo sąmoningai atmetamas. Tai nepriklauso nuo to, ar piniginė integruota telefone: svarbus pasirinktas viešasis adresas. Naujoje versijoje gali naudoti ankstesnę savo piniginę kaip mokėtoją, jei jos adresas skiriasi nuo naujo gavėjo.

Pirmiausia atidaryk pirkimo užklausą, sutikrink naują gavėją ir ją atmesk piniginėje. Pro turi likti užrakinta. Tik pats nusprendęs patvirtink tikrą pervedimą; programėlėje naudojami tikri mainnet pinigai, ne testiniai žetonai.

Po sėkmingo mokėjimo išsisaugok operacijos parašą. Jei pinigai pervesti, bet programėlė dar laukia patvirtinimo, **nemokėk antrą kartą**: naudok „Atkurti pirkimą“ su ta pačia pinigine.

## Seno adreso pašalinimo ribos

Seno gavėjo nebėra aktyviame projekto kode, darbiniuose dokumentuose ar naujos v0.4 programėlės mokėjimų dalyje. Ankstesni jau išsiųsti APK ir ankstesni pokalbio priedai nuo naujo failo paruošimo savaime nepasikeičia: jų mokėjimams nebenaudok.

Viešų blockchain įrašų ar ankstesnių pokalbio žinučių perrašyti negalima šiuo kodo pakeitimu. Kodo versijų istorija išsaugota kaip pakeitimų audito įrašas, bet naujas leidimas seno gavėjo nenaudoja.

Jei kada nors buvo sėkmingai sumokėta ankstesnei versijai, prieš ją šalinant išsaugok operacijos parašą. Vietinė jau patvirtinta prieiga nėra sąmoningai panaikinama, tačiau atkūrimas iš blockchain šioje versijoje tikrina naują gavėją; senam pirkimui gali reikėti atskiro suderinimo.

## Patikrų apimtis

Automatiniai testai tikrina tikslų naują gavėją, jo 32 baitų formatą, teisingus SOL/SKR kvitus, neteisingo gavėjo atmetimą, funkcijų tvarką visomis šešiomis kalbomis, mokėjimo langų išdėstymą ir leidimų būsenas. Tikras piniginės pervedimas ir tavo Seeker veikimas nėra patvirtinami vien šiais testais.

Leidimų įjungimas, ribojamų Android nustatymų paaiškinimas, privatumo pranešimai ir blokavimo veikimas šiuo leidimu nekeičiami. Programėlė vis dar pasirašyta tuo pačiu kūrimo sertifikatu, ne galutiniu parduotuvės leidimo raktu.
