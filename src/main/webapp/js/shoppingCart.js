// /js/shoppingCart.js

/**
 * 將商品資訊透過 AJAX 發送到後端 Servlet 進行處理。
 * @param {string} itemName - 商品名稱。
 * @param {number} itemPrice - 商品價格。
 * @param {number} [quantity=1] - 數量。
 * @param {string} [size="N/A"] - 尺寸。
 * @returns {Promise<object>} - 返回包含 status 和 message 的 JSON 物件。
 */
/* async function addToCart(itemName, itemPrice, quantity = 1, size = "N/A") {
    const params = new URLSearchParams();
    params.append('action', 'add'); 
    params.append('itemName', itemName);
    params.append('itemPrice', itemPrice);
    params.append('quantity', quantity);
    params.append('size', size);

    // 請求指向 Servlet
    const url = 'shoppingCartServlet?' + params.toString(); 

    try {
        const response = await fetch(url, { 
            method: 'GET' 
        }); 

        if (!response.ok) {
             throw new Error(`網路回應錯誤，狀態碼: ${response.status}`);
        }

        const data = await response.json();
        return data; 

    } catch (error) {
        console.error('AJAX 加入購物車錯誤:', error); 
        return {
            status: 'error',
            message: '網路錯誤或伺服器處理失敗。'
        };
    }
}
*/

document.addEventListener('DOMContentLoaded', function() {
    // 購物車頁面專屬邏輯：處理移除按鈕的確認
    const removeButtons = document.querySelectorAll('.action-btn');
    removeButtons.forEach(button => {
        if (button.textContent.trim() === '移除') {
            button.addEventListener('click', function(e) {
                if (!confirm('您確定要從購物車中移除此商品嗎？')) {
                    e.preventDefault();
                }
            });
        }
    });
});