// 簡易 Tab 切換
//Array.from() 是把抓到的節點集合（NodeList）轉成陣列，好用 forEach 等迴圈方法。
	//.tab-button：所有分頁按鈕（登入 / 註冊 / 忘記密碼）。
	//.panel：對應的內容表單（每個分頁的內容）
const tabButtons = Array.from(document.querySelectorAll('.tab-button'));
const panels = Array.from(document.querySelectorAll('.panel'));

//用 forEach 對每一個按鈕（btn）做設定。
tabButtons.forEach((btn) => {	
  btn.addEventListener('click', () => {	//當使用者「點擊」某個按鈕時，執行裡面的動作（切換分頁）。
    const target = btn.getAttribute('data-target'); //	讀取按鈕上的 data-target 屬性（例如 #login），這個值用來找到要顯示哪個表單區塊。
    tabButtons.forEach(b => b.classList.remove('active'));
    btn.classList.add('active');
	//	先把所有按鈕的「active 樣式」移除，再給被點的按鈕加上 active。
	//這樣畫面上就會只有一個按鈕是亮的（代表被選中）。
    panels.forEach(p => p.classList.remove('active'));
    const panel = document.querySelector(target);
    if (panel) panel.classList.add('active');
	//把所有 .panel 隱藏（移除 active）。
	//再把對應的那一個（例如 #login）加上 active，讓它顯示出來。
  });
});

//表單驗證與提交占位
function showError(input, message) {
  const id = input.getAttribute('id');
  const errorEl = document.querySelector(`[data-error-for="${id}"]`);
  if (errorEl) errorEl.textContent = message || '';
}

function clearErrors(form) {
  Array.from(form.querySelectorAll('.error')).forEach(el => el.textContent = '');
}

function toast(message) {
  const t = document.getElementById('toast-template');
  if (!t) return;
  const el = t.content.firstElementChild.cloneNode(true);
  el.textContent = message;
  document.body.appendChild(el);
  setTimeout(() => el.remove(), 2200);
}
//驗證EMAIL格式
function isValidEmail(email) {
  return /.+@.+\..+/.test(email);
}



//登入
document.getElementById('login').addEventListener('submit', (e) => {
  //e.preventDefault(); //阻止表單真的送出到伺服器，因為這裡要先做前端驗證。
  const form = e.currentTarget;
  clearErrors(form); //先把之前顯示的錯誤提示清除
  const email = document.getElementById('login-email');
  const password = document.getElementById('login-password');
  //抓取使用者輸入的電子郵件與密碼欄位。
  
  let ok = true;
  if (!email.value || !isValidEmail(email.value)) { showError(email, '請輸入有效的電子郵件'); ok = false; }
  if (!password.value || password.value.length < 6) { showError(password, '密碼至少 6 碼'); ok = false; }
  if (!ok) return; //若輸入錯誤（ok = false），程式中止，不繼續執行。
  toast('已送出登入請求（示意）');
});


// 註冊
document.getElementById('register').addEventListener('submit', (e) => {
  //e.preventDefault();
  const form = e.currentTarget;
  clearErrors(form);
  const name = document.getElementById('reg-name');
  const email = document.getElementById('reg-email');
  const pwd = document.getElementById('reg-password');
  const pwd2 = document.getElementById('reg-password2');
  let ok = true;
  if (!name.value) { showError(name, '請輸入姓名'); ok = false; }
  if (!email.value || !isValidEmail(email.value)) { showError(email, '請輸入有效的電子郵件'); ok = false; }
  if (!pwd.value || pwd.value.length < 6) { showError(pwd, '密碼至少 6 碼'); ok = false; }
  if (pwd2.value !== pwd.value) { showError(pwd2, '兩次密碼不一致'); ok = false; }
  if (!ok) return;
  toast('已送出註冊請求（示意）');
});


// 忘記密碼
document.getElementById('forgot').addEventListener('submit', (e) => {
  //e.preventDefault();
  const form = e.currentTarget;
  clearErrors(form);
  const email = document.getElementById('forgot-email');
  if (!email.value || !isValidEmail(email.value)) { showError(email, '請輸入有效的電子郵件'); return; }
  toast('已寄送重設連結（示意）');
});