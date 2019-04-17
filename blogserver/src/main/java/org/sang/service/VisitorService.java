package org.sang.service;

import org.sang.bean.Article;
import org.sang.exceptions.CommonBusinessException;
import org.sang.mapper.ArticleMapper;
import org.sang.utils.Util;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class VisitorService {
    @Resource
    ArticleMapper articleMapper;
    @Resource
    UserService userService;
    public Article getVisitorArticleDetail(Long articlId) {
        Long currentUserId=Util.getCurrentUser().getId();
        Article article=articleMapper.getArticleById(articlId);
        if (article.getState()==1&&article.getUid()==currentUserId){
            //通过验证
            return article;

        }else {
            //报错
            throw new CommonBusinessException("获取失败,您无权查看该文章");
        }
    }
    public List<Article> getVisitorArticleList(Integer start,Integer count,Long userId) {

        if (true){
            //通过验证
            return articleMapper.getArticleByState(1,start,count,userId,null);

        }else {
            //报错
            throw new CommonBusinessException("获取文章列表失败，权限错误");
        }
    }
}
