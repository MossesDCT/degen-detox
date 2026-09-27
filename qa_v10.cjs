const {chromium}=require('playwright');
const {spawn}=require('child_process');
(async()=>{
 const server=spawn('python',['-m','http.server','3001'],{cwd:__dirname+'/build/web',stdio:'ignore'});
 process.on('exit',()=>server.kill());
 const browser=await chromium.launch({headless:true});
 const page=await browser.newPage({viewport:{width:390,height:844}});
 const errors=[];page.on('pageerror',e=>errors.push(e.message));
 try {
  await page.goto('http://127.0.0.1:3001',{waitUntil:'networkidle'});
  await page.waitForSelector('flutter-view');
  await page.waitForTimeout(1500);
  await page.locator('flt-semantics-placeholder').evaluate(e=>e.click());
  await page.getByRole('button',{name:'Set up blocking',exact:true}).click();
  await page.getByRole('button',{name:'Explore Pro preview',exact:true}).last().click();
  await page.getByRole('tab',{name:/Settings/}).click();
  await page.getByText('English',{exact:true}).click();
  await page.getByRole('menuitem',{name:'Lietuvių',exact:true}).click();
  await page.getByRole('tab',{name:/Ritualai/}).click();
  await page.getByRole('button',{name:/Touch Grass/}).click();
  await page.getByText('Paukščių čiulbėjimas · 3,2 sekundės',{exact:true}).scrollIntoViewIfNeeded();
  await page.waitForTimeout(500);
  await page.screenshot({path:'/home/user/workspace/degen-v10-grass-lt.png'});
  if(await page.getByRole('button',{name:'Garso ir pranešimo nustatymai',exact:true}).count()) throw Error('Native settings must not appear in web preview');
  console.log('ERRORS',errors);
  if(errors.length) throw Error(errors.join(';'));
  console.log('V10 PASS: localized audio guidance visible; native-only control hidden in web.');
 } finally {await browser.close();server.kill();}
})().catch(e=>{console.error(e);process.exit(1)});
