package com.iviettech.finalproject.controller;

import com.iviettech.finalproject.entity.OrderDetailEntity;
import com.iviettech.finalproject.entity.OrderEntity;
import com.iviettech.finalproject.entity.RoleEntity;
import com.iviettech.finalproject.entity.UserEntity;
import com.iviettech.finalproject.helper.AESEncryptor;
import com.iviettech.finalproject.repository.UserRepository;
import com.iviettech.finalproject.service.ProductService;
import com.iviettech.finalproject.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.List;
import java.util.Map;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ProductService productService;


    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public String showLoginPage(Model model, HttpServletRequest request) {
        String encryptedPassFromCookie = userService.getPassFromCookie(request);
        model.addAttribute("cookie_pass", AESEncryptor.decrypt(encryptedPassFromCookie));
        model.addAttribute("user",new UserEntity());

        return "login";
    }

    @RequestMapping(value = "/register",method = RequestMethod.GET)
    public String showRegisterPage(Model model) {
        model.addAttribute("accounts", new UserEntity());
        return "register";
    }

    @RequestMapping(value = "/register",method = RequestMethod.POST)
    public String doRegister(UserEntity user, RoleEntity role, Model model) {
        boolean isEmailExisting = userService.isEmailExisting(user.getEmail());

        if (isEmailExisting){
            model.addAttribute("errorSignUp", "Email <" + user.getEmail() + "> already existing");
            user.setEmail(""); // reset email
            model.addAttribute("accounts", user); // keep entered data
            return "register";
        }
        userService.doRegistration(user, role);
        model.addAttribute("message", "Thanks for your registration. Please go to your mailbox to activate your account.");
        model.addAttribute("cssBootstrap", "alert-success");
        return "login";
    }

    @RequestMapping(value = "activateAccount", method = GET)
    public String activateAccount(@RequestParam(name = "email") String email,
                                  @RequestParam(name = "code") String code,
                                  Model model) {
        int result = userRepository.activateUser(email, code);
        if (result == 1) {
            model.addAttribute("message", "Your account has been activated. Now, you can login. Thank you.");
            model.addAttribute("cssBootstrap", "alert-success");
        } else {
            model.addAttribute("message", "Your activation code is not correct.");
            model.addAttribute("cssBootstrap", "alert-danger");
        }
        return "login";
    }

    @RequestMapping(value = "login", method = POST)
    public String doLogin(@RequestParam("email") String email,
                          @RequestParam("pass") String password,
                          @RequestParam(name = "remember", required = false) String remember,
                          Model model, HttpSession session, HttpServletResponse response) {
        int result = userService.doLogin(email, password);

        if (result == 0) {
            model.addAttribute("errorSignIn", "Login failed. Incorrect user name or password");
            return "login";
        } else {
            if (result == 1) {
                model.addAttribute("errorSignIn", "Login failed. You account not activated yet");
                return "login";
            } else if (result == 2) {
                userService.rememberMe(email, password, remember, response);
                //model.addAttribute("message", "Welcome " + email);
                //model.addAttribute("cssBootstrap", "alert-success");
                session.setAttribute("email", email);
                session.setAttribute("user", userService.findUser(email, password));
            }
        }

        return "redirect:/";
    }


    @RequestMapping(value = "/logout",method = RequestMethod.GET)
    public String doLogout(HttpSession session) {
        session.removeAttribute("email");
        session.removeAttribute("user");
        return "redirect:/";
    }

    @RequestMapping(value = "/user/profile",method = RequestMethod.GET)
    public String viewProfile(Model model, HttpSession session) {
        UserEntity user = (UserEntity) session.getAttribute("user");
        Map<Integer, String> provinceMap = productService.getProvinces();
        model.addAttribute("user", user);
        model.addAttribute("province",provinceMap);
        return "profile";
    }


    @RequestMapping(value = "/user/updateProfile", method = POST, produces = "text/plain;charset=UTF-8")
    public String updateProfile(UserEntity user, Model model, HttpSession session) {
        userService.updateUser(user);
        Map<Integer, String> provinceMap = productService.getProvinces();
        model.addAttribute("user", user);
        model.addAttribute("province",provinceMap);
        session.setAttribute("user", user);
        return "profile";
    }

    @RequestMapping(value = "/user/orderhistory",method = RequestMethod.GET)
    public String viewOrderHistory(Model model, HttpSession session) {
        UserEntity user = (UserEntity) session.getAttribute("user");
        List<OrderEntity> orderHistory = userService.findAllByUserId(user.getId());
        model.addAttribute("orderHistory", orderHistory);
        return "order_history";
    }

    @RequestMapping(value = "/user/orderhistory/detail/{id}",method = GET)
    public String showOrderDetail(@PathVariable("id") int id, Model model) {
        List<OrderDetailEntity> orderDetailList = userService.findByOrderEntityId(id);
        model.addAttribute("orderDetailList", orderDetailList);
        return "order_detail_history";
    }

    @RequestMapping(value = "/user/changepass",method = RequestMethod.GET)
    public String viewChangePass() {
        return "change_pass";
    }

    @RequestMapping(value = "/user/changepass",method = POST,produces = "text/plain;charset=UTF-8")
    public String doChangePass(@RequestParam("currentPass") String currentPass,
                               @RequestParam("newPass") String newPass,
                               @RequestParam("confirmPass") String confirmPass, HttpSession session, Model model) {
        UserEntity user = (UserEntity) session.getAttribute("user");
        int check = userService.checkChangePass(user, currentPass, newPass, confirmPass);
        if (check == 0){
            userService.doChangePass(user, currentPass, newPass, confirmPass);
            model.addAttribute("message", "Update Successful");
            model.addAttribute("cssBootstrap","alert-success");
        } else if (check == 1){
            model.addAttribute("message", "Update Failed, Confirm Password not matching");
            model.addAttribute("cssBootstrap","alert-danger");
        } else {
            model.addAttribute("message", "Update Failed, Current Password incorrect");
            model.addAttribute("cssBootstrap","alert-danger");
        }
        return "change_pass";
    }

    @RequestMapping(value = "/resetpass",method = RequestMethod.GET)
    public String viewResetPass() {
        return "reset_pass";
    }


    @RequestMapping(value = "/resetpass", method = POST, produces = "text/plain;charset=UTF-8")
    public String resetPass(Model model,
                            @RequestParam("email") String email) {
        int check = userService.checkAccountEmail(email);
        if (check == 1){
            userService.sendResetPassword(email);
            model.addAttribute("message","Please go to your mailbox to activate your account!");
            model.addAttribute("cssBootstrap","alert-success");
        } else {
            model.addAttribute("message","Email <" + email +"> not exist!");
            model.addAttribute("cssBootstrap","alert-danger");
        }
        return "reset_pass";
    }


    @RequestMapping(value = "/reset", method = GET)
    public String reset(@RequestParam(name = "email") String email,
                                  Model model) {

        return "reset_pass";
    }


}
