// 極簡增強：加入購物車→吐司提示、ARIA live 區域（可及性）、錨點平滑已由 CSS 處理
(() => {
    // 建立 aria-live 容器（螢幕閱讀器會念出狀態）
    const live = document.createElement('div');
    live.setAttribute('aria-live', 'polite');
    live.style.position = 'absolute';
    live.style.left = '-9999px';
    document.body.appendChild(live);

    // 建立 toast
    const toast = document.createElement('div');
    toast.className = 'toast';
    toast.textContent = '已加入購物車';
    document.body.appendChild(toast);

    // 事件委派：攔截所有「加入購物車」按鈕
    document.addEventListener('click', (e) => {
        const a = e.target.closest('a.btn');
        if (!a) return;

        const card = a.closest('.card');
        const name = card.querySelector('.name').textContent.trim() || '商品';

        // 只針對「加入購物車」按鈕
        if (a.textContent.includes('加入購物車')) {
            // ARIA live 提示
            live.textContent = name + '已加入購物車';

            // 簡易 toast
            toast.textContent = name + '已加入購物車';
            toast.classList.add('show');
            clearTimeout(window.__toastTimer);
            window.__toastTimer = setTimeout(() => toast.classList.remove('show'), 1400);

            // 阻止跳轉
            e.preventDefault();
        }
    });

    // 快捷鍵：按「/」打開搜尋（暫時只提示）
    document.addEventListener('keydown', (e) => {
        if (e.key === '/') {
            e.preventDefault();
            live.textContent = '開啟搜尋（demo）';
            toast.textContent = '搜尋鍵被觸發（/）';
            toast.classList.add('show');
            clearTimeout(window.__toastTimer);
            window.__toastTimer = setTimeout(() => toast.classList.remove('show'), 1200);
        }
    });
})();

