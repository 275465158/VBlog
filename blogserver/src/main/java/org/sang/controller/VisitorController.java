package org.sang.controller;

import org.sang.bean.Article;
import org.sang.bean.RespBean;
import org.sang.service.ArticleService;
import org.sang.service.VisitorService;
import org.sang.utils.Result;
import org.sang.utils.ResultUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class VisitorController {
    @Autowired
    ArticleService articleService;
    @Autowired
    VisitorService visitorService;
    @RequestMapping(value = "/getVisitorArticleList", method = RequestMethod.GET)
    public Result<List<Article>> getVisitorArticleList(Integer start,Integer count,Long userId) {
        //默认获取已经发表的
        //后台需要验证一下该用户id和当前登录id是否相同
        return  ResultUtils.success(visitorService.getVisitorArticleList(start,count,userId));

    }
    @RequestMapping(value = "/getVisitorArticleDetail", method = RequestMethod.GET)
    public Result<Article> getVisitorArticleDetail(Long articlId) {
        Article article=articleService.getArticleById(articlId);
        visitorService.getVisitorArticleDetail(articlId);
        //后台需要验证一下该文章id是否为该人所发表，还有状态等是否合法
        return ResultUtils.success(visitorService.getVisitorArticleDetail(articlId));
    }
}
