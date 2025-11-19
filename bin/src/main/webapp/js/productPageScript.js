// 頁面加載完成後初始化
document.addEventListener('DOMContentLoaded', function() {
    initializePage();
});

// 初始化頁面功能
function initializePage() {
    // 初始化尺寸選擇器
    initializeSizeSelector();
    
    // 初始化數量選擇器
    initializeQuantitySelector();
    
    // 初始化標籤頁
    initializeTabs();
    
    // 添加滾動動畫
    addScrollAnimations();
    
    // 初始化購物車功能
    initializeCart();
}



// 尺寸選擇器功能
function initializeSizeSelector() {
    const sizeOptions = document.querySelectorAll('.size-option');
    
    sizeOptions.forEach(option => {
        option.addEventListener('click', function() {
            // 移除所有active類
            sizeOptions.forEach(opt => opt.classList.remove('active'));
            // 添加active類到當前選中的選項
            this.classList.add('active');
            
            // 更新選中的尺寸
            const selectedSize = this.getAttribute('data-size');
            updateSelectedSize(selectedSize);
        });
    });
}

// 更新選中的尺寸
function updateSelectedSize(size) {
    console.log('選中的尺寸:', size);
    
    // 這裡可以添加更新商品圖片或其他相關功能的邏輯
    // 例如：根據尺寸更新庫存狀態、價格等
    
    // 顯示選中提示
    showNotification(`已選擇 ${size} 尺寸`, 'success');
}

// 數量選擇器功能
function initializeQuantitySelector() {
    const quantityInput = document.getElementById('quantity');
    
    // 確保數量輸入框的值在有效範圍內
    quantityInput.addEventListener('change', function() {
        let value = parseInt(this.value);
        if (isNaN(value) || value < 1) {
            this.value = 1;
        } else if (value > 99) {
            this.value = 99;
        }
    });
}

// 改變數量
function changeQuantity(delta) {
    const quantityInput = document.getElementById('quantity');
    let currentValue = parseInt(quantityInput.value);
    let newValue = currentValue + delta;
    
    if (newValue >= 1 && newValue <= 99) {
        quantityInput.value = newValue;
        updateQuantityDisplay(newValue);
    }
}

// 更新數量顯示
function updateQuantityDisplay(quantity) {
    console.log('商品數量:', quantity);
    // 這裡可以添加更新總價等相關邏輯
}

// 標籤頁功能
function initializeTabs() {
    const tabButtons = document.querySelectorAll('.tab-btn');
    const tabPanes = document.querySelectorAll('.tab-pane');
    
    tabButtons.forEach(button => {
        button.addEventListener('click', function() {
            const targetTab = this.getAttribute('onclick').match(/'([^']+)'/)[1];
            showTab(targetTab);
        });
    });
}

// 顯示指定的標籤頁
function showTab(tabName) {
    // 隱藏所有標籤頁內容
    const tabPanes = document.querySelectorAll('.tab-pane');
    tabPanes.forEach(pane => pane.classList.remove('active'));
    
    // 移除所有標籤按鈕的active類
    const tabButtons = document.querySelectorAll('.tab-btn');
    tabButtons.forEach(btn => btn.classList.remove('active'));
    
    // 顯示指定的標籤頁內容
    const targetPane = document.getElementById(tabName);
    if (targetPane) {
        targetPane.classList.add('active');
    }
    
    // 添加active類到對應的按鈕
    const targetButton = document.querySelector(`[onclick*="${tabName}"]`);
    if (targetButton) {
        targetButton.classList.add('active');
    }
    
    // 平滑滾動到標籤頁內容
    if (targetPane) {
        targetPane.scrollIntoView({ behavior: 'smooth', block: 'start' });
    }
}

// 圖片相關功能
function changeMainImage(thumbnail, imageSrc) {
    // 更新主圖片
    const mainImage = document.getElementById('mainImage');
    mainImage.src = imageSrc;
    
    // 更新縮圖的active狀態
    const thumbnails = document.querySelectorAll('.thumbnail');
    thumbnails.forEach(thumb => thumb.classList.remove('active'));
    thumbnail.classList.add('active');
    
    // 添加圖片切換動畫
    mainImage.style.opacity = '0';
    setTimeout(() => {
        mainImage.style.opacity = '1';
    }, 150);
}



// 購物車功能
function initializeCart() {
    // 檢查本地存儲中是否有購物車數據
    if (!localStorage.getItem('cart')) {
        localStorage.setItem('cart', JSON.stringify([]));
    }
}

// 添加到購物車
function addToCart() {
    const selectedSize = document.querySelector('.size-option.active').getAttribute('data-size');
    const quantity = parseInt(document.getElementById('quantity').value);
    const productName = document.querySelector('.product-title').textContent;
    const currentPrice = document.querySelector('.current-price').textContent;
    
    const cartItem = {
        id: Date.now(),
        name: productName,
        size: selectedSize,
        quantity: quantity,
        price: currentPrice,
        image: document.getElementById('mainImage').src,
        addedAt: new Date().toISOString()
    };
    
    // 獲取現有購物車數據
    let cart = JSON.parse(localStorage.getItem('cart')) || [];
    
    // 檢查是否已存在相同商品
    const existingItemIndex = cart.findIndex(item => 
        item.name === cartItem.name && item.size === cartItem.size
    );
    
    if (existingItemIndex !== -1) {
        // 如果商品已存在，更新數量
        cart[existingItemIndex].quantity += quantity;
    } else {
        // 如果商品不存在，添加到購物車
        cart.push(cartItem);
    }
    
    // 保存到本地存儲
    localStorage.setItem('cart', JSON.stringify(cart));
    
    // 顯示成功提示
    showNotification(`已將 ${quantity} 件 ${productName} (${selectedSize}) 加入購物車`, 'success');
    
    // 更新購物車圖標（如果有的話）
    updateCartIcon();
}

// 立即購買
function buyNow() {
    const selectedSize = document.querySelector('.size-option.active').getAttribute('data-size');
    const quantity = parseInt(document.getElementById('quantity').value);
    const productName = document.querySelector('.product-title').textContent;
    
    // 這裡可以添加跳轉到結帳頁面的邏輯
    showNotification(`正在跳轉到結帳頁面...`, 'info');
    
    // 模擬跳轉到結帳頁面
    setTimeout(() => {
        // 實際應用中這裡會跳轉到結帳頁面
        console.log('跳轉到結帳頁面');
    }, 1000);
}

// 加入願望清單
function addToWishlist() {
    const productName = document.querySelector('.product-title').textContent;
    
    // 獲取現有願望清單數據
    let wishlist = JSON.parse(localStorage.getItem('wishlist')) || [];
    
    // 檢查是否已在願望清單中
    const isInWishlist = wishlist.some(item => item.name === productName);
    
    if (isInWishlist) {
        showNotification(`${productName} 已在願望清單中`, 'warning');
        return;
    }
    
    // 添加到願望清單
    const wishlistItem = {
        id: Date.now(),
        name: productName,
        price: document.querySelector('.current-price').textContent,
        image: document.getElementById('mainImage').src,
        addedAt: new Date().toISOString()
    };
    
    wishlist.push(wishlistItem);
    localStorage.setItem('wishlist', JSON.stringify(wishlist));
    
    showNotification(`已將 ${productName} 加入願望清單`, 'success');
}

// 更新購物車圖標
function updateCartIcon() {
    const cart = JSON.parse(localStorage.getItem('cart')) || [];
    const totalItems = cart.reduce((total, item) => total + item.quantity, 0);
    
    // 這裡可以更新購物車圖標上的數量顯示
    console.log('購物車總數量:', totalItems);
}

// 顯示通知
function showNotification(message, type = 'info') {
    // 創建通知元素
    const notification = document.createElement('div');
    notification.className = `notification notification-${type}`;
    notification.innerHTML = `
        <div class="notification-content">
            <i class="fas fa-${getNotificationIcon(type)}"></i>
            <span>${message}</span>
            <button class="notification-close" onclick="this.parentElement.parentElement.remove()">
                <i class="fas fa-times"></i>
            </button>
        </div>
    `;
    
    // 添加樣式
    notification.style.cssText = `
        position: fixed;
        top: 20px;
        right: 20px;
        background: ${getNotificationColor(type)};
        color: white;
        padding: 1rem 1.5rem;
        border-radius: 8px;
        box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        z-index: 3000;
        max-width: 400px;
        animation: slideInRight 0.3s ease;
    `;
    
    // 添加到頁面
    document.body.appendChild(notification);
    
    // 自動移除通知
    setTimeout(() => {
        if (notification.parentElement) {
            notification.remove();
        }
    }, 5000);
}

// 獲取通知圖標
function getNotificationIcon(type) {
    const icons = {
        success: 'check-circle',
        error: 'exclamation-circle',
        warning: 'exclamation-triangle',
        info: 'info-circle'
    };
    return icons[type] || 'info-circle';
}

// 獲取通知顏色
function getNotificationColor(type) {
    const colors = {
        success: '#28a745',
        error: '#dc3545',
        warning: '#ffc107',
        info: '#17a2b8'
    };
    return colors[type] || '#17a2b8';
}

// 滾動動畫
function addScrollAnimations() {
    const observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    };
    
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.style.opacity = '1';
                entry.target.style.transform = 'translateY(0)';
            }
        });
    }, observerOptions);
    
    // 觀察需要動畫的元素
    const animatedElements = document.querySelectorAll('.product-detail, .product-tabs, .related-products');
    animatedElements.forEach(el => {
        el.style.opacity = '0';
        el.style.transform = 'translateY(30px)';
        el.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
        observer.observe(el);
    });
}

// 平滑滾動到指定元素
function scrollToElement(elementId) {
    const element = document.getElementById(elementId);
    if (element) {
        element.scrollIntoView({
            behavior: 'smooth',
            block: 'start'
        });
    }
}

// 鍵盤快捷鍵支持
document.addEventListener('keydown', function(e) {
    // 數字鍵1-3切換標籤頁
    if (e.key >= '1' && e.key <= '3') {
        const tabNames = ['description', 'specifications', 'shipping'];
        const tabIndex = parseInt(e.key) - 1;
        if (tabIndex < tabNames.length) {
            showTab(tabNames[tabIndex]);
        }
    }
});

// 圖片懶加載
function lazyLoadImages() {
    const images = document.querySelectorAll('img[data-src]');
    
    const imageObserver = new IntersectionObserver((entries, observer) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                const img = entry.target;
                img.src = img.dataset.src;
                img.classList.remove('lazy');
                imageObserver.unobserve(img);
            }
        });
    });
    
    images.forEach(img => imageObserver.observe(img));
}

// 商品圖片預覽功能
function previewImage(imageSrc) {
    const previewContainer = document.createElement('div');
    previewContainer.className = 'image-preview';
    previewContainer.innerHTML = `
        <div class="preview-overlay">
            <img src="${imageSrc}" alt="圖片預覽">
            <button class="preview-close" onclick="this.parentElement.parentElement.remove()">
                <i class="fas fa-times"></i>
            </button>
        </div>
    `;
    
    // 添加樣式
    previewContainer.style.cssText = `
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0,0,0,0.8);
        z-index: 1500;
        display: flex;
        align-items: center;
        justify-content: center;
    `;
    
    document.body.appendChild(previewContainer);
}

// 頁面性能優化
function optimizePerformance() {
    // 防抖函數
    function debounce(func, wait) {
        let timeout;
        return function executedFunction(...args) {
            const later = () => {
                clearTimeout(timeout);
                func(...args);
            };
            clearTimeout(timeout);
            timeout = setTimeout(later, wait);
        };
    }
    
    // 優化滾動事件
    const optimizedScrollHandler = debounce(() => {
        // 滾動相關的優化邏輯
    }, 16);
    
    window.addEventListener('scroll', optimizedScrollHandler);
}

// 初始化性能優化
document.addEventListener('DOMContentLoaded', function() {
    optimizePerformance();
    lazyLoadImages();
});

// 添加CSS動畫樣式
const style = document.createElement('style');
style.textContent = `
    @keyframes slideInRight {
        from {
            transform: translateX(100%);
            opacity: 0;
        }
        to {
            transform: translateX(0);
            opacity: 1;
        }
    }
    
    .notification-content {
        display: flex;
        align-items: center;
        gap: 0.5rem;
    }
    
    .notification-close {
        background: none;
        border: none;
        color: white;
        cursor: pointer;
        margin-left: auto;
        padding: 0.2rem;
    }
    
    .notification-close:hover {
        opacity: 0.8;
    }
    
    .image-preview .preview-overlay {
        position: relative;
        max-width: 90%;
        max-height: 90%;
    }
    
    .image-preview .preview-overlay img {
        width: 100%;
        height: auto;
        border-radius: 10px;
    }
    
    .image-preview .preview-close {
        position: absolute;
        top: -50px;
        right: 0;
        background: white;
        border: none;
        border-radius: 50%;
        width: 40px;
        height: 40px;
        cursor: pointer;
        font-size: 1.2rem;
        color: #333;
    }
`;

document.head.appendChild(style);