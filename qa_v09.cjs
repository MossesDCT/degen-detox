const {chromium}=require('playwright');
const {spawn}=require('child_process');
(async()=>{
 const server=spawn('python',['-m','http.server','3001'],{cwd:__dirname+'/build/web',stdio:'ignore'});
 process.on('exit',()=>server.kill());
 const browser=await chromium.launch({headless:true});
 const page=await browser.newPage({viewport:{width:390,height:844}});
 page.setDefaultTimeout(10000);
 const errors=[]; page.on('pageerror',e=>errors.push(e.message));
 try {
  await page.goto('http://127.0.0.1:3001',{waitUntil:'networkidle'});
  await page.waitForSelector('flutter-view');
  await page.waitForTimeout(1500);
  await page.locator('flt-semantics-placeholder').evaluate(e=>e.click());
  await page.getByRole('button',{name:'Set up blocking',exact:true}).click();
  await page.getByRole('button',{name:'Explore Pro preview',exact:true}).last().click();
  await page.getByRole('tab',{name:/Rituals/}).click();
  await page.getByRole('button',{name:/Trading Wind-down/}).click();
  await page.getByRole('button',{name:'Add my fourth step',exact:true}).click();
  await page.getByRole('textbox').click(); await page.waitForTimeout(200);
  await page.keyboard.type('Read 10 pages');
  await page.getByRole('button',{name:'Save',exact:true}).click();
  await page.waitForTimeout(400);
  for(const name of [
    'Review your own risk plan before stepping away.',
    'Choose tomorrow’s first market-check time.',
    'Put the phone aside. Take five easy breaths.',
    'Read 10 pages'
  ]) { await page.getByRole('checkbox',{name,exact:true}).click(); await page.waitForTimeout(150); }
  await page.getByText('4/4',{exact:true}).waitFor();
  await page.getByRole('button',{name:'Ritual complete',exact:true}).click();
  await page.screenshot({path:'/home/user/workspace/degen-v09-wind.png'});
  await page.keyboard.press('Escape'); await page.waitForTimeout(600);
  await page.getByRole('button',{name:/Trading Wind-down/}).click();
  await page.getByText('0/4',{exact:true}).waitFor();
  if(await page.getByRole('checkbox',{name:'Read 10 pages',exact:true}).getAttribute('aria-checked')!=='false') throw Error('Checks should reset');
  await page.keyboard.press('Escape'); await page.waitForTimeout(600);
  await page.getByRole('tab',{name:/Settings/}).click();
  await page.getByText('English',{exact:true}).click();
  await page.getByRole('menuitem',{name:'Lietuvių',exact:true}).click();
  await page.getByRole('tab',{name:/Ritualai/}).click();
  await page.getByRole('button',{name:/Vakaro atsitraukimas/}).click();
  await page.getByRole('button',{name:'Redaguoti',exact:true}).click();
  await page.getByRole('textbox').click(); await page.waitForTimeout(200);
  await page.keyboard.press('ControlOrMeta+A'); await page.keyboard.type('Perskaityti 10 puslapių');
  await page.getByRole('button',{name:'Išsaugoti',exact:true}).click();
  await page.getByRole('checkbox',{name:'Perskaityti 10 puslapių',exact:true}).waitFor();
  await page.screenshot({path:'/home/user/workspace/degen-v09-wind-lt.png'});
  await page.keyboard.press('Escape'); await page.waitForTimeout(600);
  await page.getByRole('button',{name:/Receptai/}).click();
  await page.getByRole('button',{name:/Saldžiosios bulvės ir lapinių kopūstų dubuo/}).click();
  await page.getByRole('checkbox',{name:'2 valg. š. tahini',exact:true}).click();
  await page.getByText('Įdėta: 1/9',{exact:true}).waitFor();
  await page.screenshot({path:'/home/user/workspace/degen-v09-recipe-lt.png'});
  await page.keyboard.press('Escape'); await page.waitForTimeout(600);
  await page.getByRole('button',{name:/Saldžiosios bulvės ir lapinių kopūstų dubuo/}).click();
  await page.getByText('Įdėta: 1/9',{exact:true}).waitFor();
  if(await page.getByRole('checkbox',{name:'2 valg. š. tahini',exact:true}).getAttribute('aria-checked')!=='true') throw Error('Check lost');
  await page.getByRole('button',{name:'Gaminti iš naujo',exact:true}).click();
  await page.getByText('Įdėta: 0/9',{exact:true}).waitFor();
  console.log('ERRORS',errors);
  if(errors.length) throw Error(errors.join(';'));
  console.log('V09 PASS: create complete reopen edit custom step; LT units/check/reopen/reset');
 } catch(e) {
  console.log('FAILED BODY',await page.locator('body').innerText());
  await page.screenshot({path:'/home/user/workspace/degen-v09-failure.png'});
  throw e;
 } finally { await browser.close(); server.kill(); }
})().catch(e=>{console.error(e);process.exit(1)});
