package com.thinkgem.jeesite.modules.sys.web;

import com.thinkgem.jeesite.common.web.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by Zhangsnke on 2017/2/20.
 */
@Controller
public class SiginController extends BaseController {

    @RequestMapping(value = "siginnow")
    public String SiginNow(HttpServletRequest request, HttpServletResponse response){
        return "modules/ui/login";
    }

}
