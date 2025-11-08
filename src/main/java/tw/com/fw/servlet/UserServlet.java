package tw.com.fw.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tw.com.fw.dao.UserDao;
import tw.com.fw.dao.daoImlp.UserDaoImlp;
import tw.com.fw.model.User;

import java.io.IOException;

@WebServlet("/userServlet")
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // 🧠 GET 用來處理「登出」或跳轉
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
    	throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("logout".equals(action)) {
            // 1️⃣ 清除 session
            request.getSession().invalidate();
            
            // 2️⃣ 導回登入頁面
            response.sendRedirect("Login.jsp");
            
            // ✅ 3. 結束這個 method，避免後面再執行
            return;
            
         } else {
            // 預設導向登入頁（ 其他情況可導回登入頁或首頁（可依需求調整））
            response.sendRedirect("Login.jsp");
         }
    }

    // 🚀 POST 用來處理登入
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
    	throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            UserDao dao = new UserDaoImlp();
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            // Debug：印出帳密確認有收到
            System.out.println("Email: " + email);
            System.out.println("Password: " + password);

            // 驗證帳密
            User user = dao.userLogin(email, password);

            if (user != null) {
                // 登入成功 → 存入 Session
                request.getSession().setAttribute("auth", user);
                System.out.println("登入成功，user name = " + user.getName()); // debug
                response.sendRedirect("home.jsp");
            } else {
                // 登入失敗 → 跳 alert 並導回登入頁
                response.getWriter().println("<script>");
                response.getWriter().println("alert('登入失敗，請重新輸入！');");
                response.getWriter().println("window.location.href='Login.jsp';");
                response.getWriter().println("</script>");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
