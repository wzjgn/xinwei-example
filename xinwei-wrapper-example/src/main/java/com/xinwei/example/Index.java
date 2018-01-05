package com.xinwei.example;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author wangxinwei
 * @desc
 * @company 北京鑫为科技
 * @create 2018-01-05 09:41
 */
@Controller
public class Index {
   
    /**
    * @desc  首页
    * @author wangxinwei
    * @date 2018-01-05 09:44
    * @param [modelMap]
    * @return java.lang.String
    */
    @RequestMapping(value = "/")
    String instructionPage(ModelMap modelMap) {


        return "/index";

    }


}
