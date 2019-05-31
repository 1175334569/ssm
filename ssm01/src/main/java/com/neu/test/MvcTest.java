package com.neu.test;

import com.github.pagehelper.PageInfo;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.http.client.MockClientHttpRequest;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

//使用spring测试模块提供的测试请求的功能
//spring4需要servlet3.0支持
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:spring.xml","classpath:springmvc.xml"})
public class MvcTest {
    //传springmv的ioc
    @Autowired
    WebApplicationContext context;
    //虚拟mvc请求，获取到处理结果
    MockMvc mockMvc;
    //在些方法中对mockMvc进行初始化
    @Before
    public void intitMokcMvc(){
        mockMvc=MockMvcBuilders.webAppContextSetup(context).build();
    }
    //此处写我们的测试方法
    @Test
    public  void testPage()throws Exception{
        //模拟请求拿到返回值
        MvcResult result=mockMvc.perform(MockMvcRequestBuilders.get("/listStu.do").param("pn","5")).andReturn();
        //请求成功后，请求域中会有pageInfor,我们可以取出pageInfo进行验证
        MockHttpServletRequest request=result.getRequest();
        PageInfo pi= (PageInfo) request.getAttribute("pageInfo");
        //System.out.println("当前页码:"+pi.getPageNum());
        System.out.println("当前页码:"+pi.getTotal());

    }
}
