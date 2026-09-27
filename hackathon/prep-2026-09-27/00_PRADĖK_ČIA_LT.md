# Degen Detox: CLOCK IN registracijos paruošimas

Patikrinta 2026-09-27. Paruošti dokumentai ir failai, bet paskyra nesukurta, registracija neatlikta, laiškas neišsiųstas, GitHub saugykla neviešinta ir galutinis pateikimas nepatvirtintas.

## Svarbiausias sprendimas prieš pateikiant

**Dalyvavimo tinkamumas dėl ankstesnio kodo dar nepatvirtintas.** Nuostatų 6.1 punktas reikalauja, kad projektas būtų pradėtas ne anksčiau nei likus trims mėnesiams iki hakatono pradžios; ankstesniam projektui papildomai reikia reikšmingos naujos mobiliosios plėtros. ([Oficialūs nuostatai](https://solanamobile.radiant.nexus/legal/clock-in-terms.pdf))

Hakatonas prasidėjo rugsėjo 8 d., taigi kalendorinė trijų mėnesių riba yra birželio 8 d. ([Oficialus skelbimas](https://solanamobile.com/blog/clock-in-the-solana-mobile-hackathon), [nuostatų 6.1 punktas](https://solanamobile.radiant.nexus/legal/clock-in-terms.pdf))

Degen Detox saugyklos pirmasis commit yra rugsėjo 24 d., tačiau joje aiškiai naudojamas maždaug šešis mėnesius kurtas Cortisol Zero pagrindas. Naujo repo data savaime neįrodo naujo projekto tinkamumo. Taisyklės aiškiai neapibrėžia mūsų atvejo: savarankiškas naujas produktas su senais autoriaus moduliais. Todėl rinkinyje yra organizatoriams skirtas laiško juodraštis, o ne teiginys, kad leidimą jau gavome.

Rekomendacija: užsiregistruoti laiku, sąžiningai pateikti kilmę ir kuo greičiau gauti raštišką išaiškinimą. **Nepažymėti galutinio tinkamumo patvirtinimo vien remiantis mūsų interpretacija.**

## Terminai ir registracijos kelias

- **Galutinis pateikimas:** 2026-10-08 23:59 PDT, arba **2026-10-09 09:59 Vilniaus laiku**; UTC tai 06:59. Terminas patikrintas renginio kalendoriuje ir prisijungimo lange. ([CLOCK IN](https://solanamobile.radiant.nexus/))
- **Registracija:** DUK nurodo prisijungti prie Align, užbaigti kūrėjo profilį ir užsiregistruoti „Clock In Registration“ ekrane; organizacijos profilis nereikalingas. ([Oficialus DUK](https://solanamobile.radiant.nexus/))
- **Atskiras registracijos terminas:** DUK liepia registruotis iki registracijos pabaigos, bet patikrintame rugsėjo ir spalio kalendoriuje atskiros uždarymo datos neradau. Nereikia manyti, kad ji būtinai sutampa su projekto pateikimu. ([Oficialus DUK ir kalendorius](https://solanamobile.radiant.nexus/))
- **Rezultatai:** dabartinis renginio puslapis nurodo lapkričio 10 d.; tinklaraščio ankstesnis bendresnis „early November“ nėra tokia tiksli data. ([Renginio puslapis](https://solanamobile.radiant.nexus/), [skelbimas](https://solanamobile.com/blog/clock-in-the-solana-mobile-hackathon))

Mūsų siūlomas vidinis terminas: paruošti ir patikrinti nuorodas iki spalio 6 d., o galutinį pateikimą, gavus tinkamumo išaiškinimą, atlikti spalio 7 d. Tai atsargos planas, ne organizatorių nustatytos papildomos datos.

### Tikslūs pirmojo registracijos lango laukai

Atvertas **HACKATHON HUB → SIGN UP → CREATE ACCOUNT** ekranas. Žvaigždute pažymėti EMAIL, PASSWORD, USERNAME, FIRST NAME, SURNAME, TELEGRAM ir COUNTRY; AVATAR, X HANDLE ir DISCORD rodomi kaip neprivalomi. Slaptažodžio paaiškinimas: bent 8 simboliai; vartotojo vardas: 2–30 simbolių, a–z, 0–9, taškas, pabraukimas ar brūkšnelis. ([Patikrinta registracijos forma](https://solanamobile.radiant.nexus/))

Toje pačioje sąsajoje siūlomas prisijungimas per Google/Gmail. Slaptažodį ar Google prisijungimą atlik pats; nesiųsk slaptažodžio, atkūrimo frazės, privataus rakto ar KYC dokumentų pokalbyje.

Prisijungus reikės užbaigti profilį ir patį hakatono registracijos veiksmą. **Vien paskyros sukūrimas dar nėra patvirtinta registracija į renginį.** Tolimesnių projekto formos laukų ir jų simbolių/failų limitų nematėme, nes jie už prisijungimo; paruošti tekstai pritaikomi jiems, o ne pristatomi kaip tikslus nematytos formos eksportas.

## Privalomi pateikimo elementai ir dabartinė būklė

Oficialiai reikia veikiančio Android APK, GitHub saugyklos su kodu, demonstracinio vaizdo įrašo ir pitch deck arba trumpo pristatymo. „The Brief“ prašo trijų minučių demonstracijos ir įrenginyje veikiančio produkto. ([Pateikimo aprašas](https://solanamobile.radiant.nexus/), [nuostatų 6.3–6.4](https://solanamobile.radiant.nexus/legal/clock-in-terms.pdf))

| Elementas | Paruošta | Kas dar liko |
|---|---|---|
| Veikiantis Android APK | v0.10 Mainnet, jau tavo patikrintas Seeker | Įkelti teisėjams prieinamu adresu, patikrinti atsisiuntimą |
| Nemokamas funkcijų bandymas teisėjams | Naujas v0.10 QA APK, atskiras paketas, aiškus QA žymėjimas | Trumpas fizinis QA įdiegimo bandymas; patvirtinti, kad galima pridėti abu APK |
| GitHub kodas ir istorija | Vietinė saugykla, kilmės dokumentas ir pilnos Git istorijos bundle | Tavo leidimas įkelti į GitHub; parinkti prieigą teisėjams |
| Projekto aprašas anglų kalba | `01_APPLICATION_EN.md` | Patvirtinti asmens, komandos ir finansavimo duomenis; pritaikyti formos limitams |
| Trumpas pristatymas | `02_PRESENTATION_EN.md` | Tai Markdown pristatymas, ne PowerPoint/PDF; jei forma reikalauja konkretaus formato, konvertuoti |
| 3 min. demo | `03_DEMO_180S_EN_LT.md`, kadrai ir angliškas tekstas | Tavo tikro Seeker ekrano įrašai; galutinis sumontuotas vaizdo failas ir nuoroda |
| Tinkamumo išaiškinimas | `04_ELIGIBILITY_EMAIL_EN.md` | Tavo patvirtinimas siųsti ir organizatorių atsakymas |
| Vertinimo instrukcija | `05_JUDGES_GUIDE_EN.md` | Įrašyti galutines nuorodas |
| Techninė parengtis ir kilmė | `06_READINESS_AND_PROVENANCE_EN.md` | Leidimų, asset licencijų ir dApp Store pasirengimo punktai |

GitHub neprivalo būti viešas visam internetui, tačiau teisėjai turi galėti peržiūrėti kodą ir commit istoriją. Privatų repo reikia realiai suteikti peržiūrai; vien URL be leidimo nepakanka. ([Oficialus DUK](https://solanamobile.radiant.nexus/))

## Ko reikės iš tavęs

- **Paskyra ir tapatybės duomenys:** ar jau turi Align paskyrą; kokį vardą, pavardę, vartotojo vardą, el. paštą, teisėtos gyvenamosios vietos šalį ir viešą Telegram kontaktą naudosi. X/Discord neprivalomi pirmoje formoje.
- **Dalyvio patvirtinimai:** ar esi bent 18 metų ir dalyvauji vienas; jei komandoje, tikslus žmonių sąrašas. DI pagalba leidžiama, bet DI nėra fizinis komandos narys. ([DUK](https://solanamobile.radiant.nexus/), [nuostatų 3 ir 5 skyriai](https://solanamobile.radiant.nexus/legal/clock-in-terms.pdf))
- **Finansavimas:** ar projektas arba komanda gavusi VC/angelų investicijų, įskaitant SAFE/SAFT ar panašius susitarimus. Finansuotos komandos gali dalyvauti, bet USDC prizams netinka; ne-USDC atvejį sprendžia organizatorius. ([Nuostatų 9.2](https://solanamobile.radiant.nexus/legal/clock-in-terms.pdf))
- **Autorystė ir teisės:** patvirtinimas, kad turi teisę naudoti Cortisol Zero kodą, receptų vertimus, kvėpavimo turinį ir paveldėtus garso failus. Negalime vien numanyti visų turinio licencijų.
- **Leidimai išoriniams veiksmams:** leidimas išsiųsti paruoštą laišką, sukurti ir įkelti kodą į siūlomą privatų `MossesDCT/degen-detox` repo, vėliau suteikti konkrečią prieigą teisėjams. Ši saugykla dar nesukurta.
- **Tikro telefono demonstracija:** pateikti žalius Seeker vaizdo įrašus pagal scenarijų. Nereikia naujo realaus mokėjimo vien dėl filmavimo; galima naudoti turėtą įrašą ir turimo pirkimo patvirtinimą, aiškiai parodant skirtumą.
- **Viešos mokėjimo operacijos įrodymas, jei nori jį rodyti:** SOL/SKR operacijų parašai arba nuorodos ir tavo sutikimas jas viešinti. Vieša operacija gali susieti tavo piniginę su projektu; jokios atkūrimo frazės ar privataus rakto nereikia.

## Sąlygos, kurias svarbu žinoti

- **Lietuva yra leidžiamų šalių sąraše**, tačiau pilnametystė, teisėta rezidencija ir sankcijų atitiktis vertinamos individualiai. ([Nuostatų 3–4](https://solanamobile.radiant.nexus/legal/clock-in-terms.pdf))
- **Vienas pateikimas dalyviui**, individualiai arba komandoje; komandos sudėtis fiksuojama galutinio pateikimo metu. ([Renginio taisyklės](https://solanamobile.radiant.nexus/), [nuostatų 5.2](https://solanamobile.radiant.nexus/legal/clock-in-terms.pdf))
- **Juodraštį galima redaguoti**, bet DUK įspėja, kad užbaigus galutinį pateikimo susitarimą redagavimas nebegalimas. Galutinio patvirtinimo nespausk, kol nepatikrinti visi failai ir tinkamumas. ([DUK](https://solanamobile.radiant.nexus/))
- **Finalistų KYC:** žmonės fiksuotame komandos sąraše turės atlikti organizatorių paskirtą tapatybės ir atitikties patikrą. Dokumentus teik tik oficialiam paskirtam tiekėjui, ne šio pokalbio failais. ([Nuostatų 10](https://solanamobile.radiant.nexus/legal/clock-in-terms.pdf))
- **dApp Store:** pateikimo metu publikacijos nereikia, tačiau laimėjus prizą, kuriam taikoma publikavimo sąlyga, app turi būti viešai paskelbta per 30 kalendorinių dienų nuo pirmojo laimėtojų paskelbimo; vien peržiūros užklausos neužtenka. ([Nuostatų 9.3](https://solanamobile.radiant.nexus/legal/clock-in-terms.pdf))
- **Prizai:** pagrindinis fondas 125 000 USDC, atskirai 10 000 USD vertės SKR integracijos prizas, mokamas SKR. Tai ne 135 000 USDC vienoje kategorijoje; puslapio bendras reklaminis sakinys mažiau tikslus nei išskaidymas. ([Oficialus prizų išskaidymas](https://solanamobile.com/blog/clock-in-the-solana-mobile-hackathon))

## Kaip pateikti stipriau

Kiekvienas vertinimo kriterijus sveria po 25 %: produkto nauda/pakartotinis naudojimas, UX, naujumas ir pristatymas/demo. ([Nuostatų 8.1](https://solanamobile.radiant.nexus/legal/clock-in-terms.pdf))

Mūsų siūlomas akcentas: ne „dar viena streso programėlė“ ir ne „įrodytas kortizolio mažinimas“, o aiškus mobilus įsipareigojimas kripto bendruomenei: ramus rytas, suprantama savistaba, užbaigta prekybos sesija ir SKR įsigytas Touch Grass ritualas. Solana dalyje parodyti realų MWA kelią, atskiras SOL/SKR teises, pirkimo atkūrimą ir privatumą.

Turime vieno kūrėjo realaus įrenginio bandymų patvirtinimus, ne plataus vartotojų tyrimo rezultatus. **13 Cortisol Zero testuotojų negalima pristatyti kaip 13 Degen Detox vartotojų.** Laimėjimo garantijos nėra; vertingiausias kitas įrodymas būtų keli nepriklausomi kripto/Seeker bandytojai ir aiškus jų atsiliepimų įrašas.
