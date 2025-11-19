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


/*
// /js/home.js

// 假設 addToCart 函數已在 shoppingCart.js 中定義並引入。

(() => {
    // --- ARIA live / Toast 容器初始化 ---
    const live = document.createElement('div');
    live.setAttribute('aria-live', 'polite');
    live.style.position = 'absolute';
    live.style.left = '-9999px';
    document.body.appendChild(live);

    const toast = document.createElement('div');
    toast.className = 'toast';
    // 基礎樣式
    toast.style.position = 'fixed';
    toast.style.bottom = '20px';
    toast.style.left = '50%';
    toast.style.transform = 'translateX(-50%)';
    toast.style.padding = '10px 20px';
    toast.style.backgroundColor = 'rgba(0, 0, 0, 0.8)';
    toast.style.color = 'white';
    toast.style.borderRadius = '5px';
    toast.style.opacity = '0';
    toast.style.transition = 'opacity 0.3s ease-in-out';
    toast.style.zIndex = '1000';
    document.body.appendChild(toast);

    // 輔助函數：顯示 Toast 和 ARIA live 提示
    function showNotification(message) {
        live.textContent = message;
        toast.textContent = message;
        toast.style.opacity = '1';
        
        clearTimeout(window.__toastTimer);
        window.__toastTimer = setTimeout(() => {
             toast.style.opacity = '0';
        }, 1800);
    }
    
    // --- 事件委派：攔截所有「加入購物車」按鈕 (列表頁) ---
    document.addEventListener('click', async (e) => { 
        // 找到最近的 a.btn 連結
        const a = e.target.closest('a.btn');

        if (a && a.textContent.includes('加入購物車')) {
            e.preventDefault(); 
            
            const card = a.closest('.card');
            if (!card) return;
            
            // 列表頁通常只有名稱和價格，數量和尺寸使用預設值
            const itemName = card.querySelector('.name')?.textContent.trim() || '未知商品';
            
            const priceElement = card.querySelector('.price');
            let priceStr = priceElement?.textContent.replace('NT$', '').replace(',', '').trim() || '0';
            let itemPrice = parseInt(priceStr);

            if (isNaN(itemPrice) || itemPrice <= 0) {
                showNotification(`加入失敗：無法獲取 ${itemName} 的價格。`); 
                return;
            }
            
            // 呼叫 shoppingCart.js 中的 addToCart 函數 (數量=1, 尺寸="Default")
            const result = await addToCart(itemName, itemPrice, 1, "Default");

            // 根據 AJAX 結果顯示提示
            if (result.status === 'success') {
                showNotification(result.message);
            } else {
                showNotification('加入失敗: ' + (result.message || '請檢查控制台。'));
            }
        }
    });

    // 快捷鍵：按「/」打開搜尋
    document.addEventListener('keydown', (e) => {
        if (e.key === '/' && document.activeElement.tagName !== 'INPUT' && document.activeElement.tagName !== 'TEXTAREA') {
            e.preventDefault();
            showNotification('開啟搜尋（/）');
        }
    });
})();
*/