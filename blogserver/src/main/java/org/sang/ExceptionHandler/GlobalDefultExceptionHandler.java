package org.sang.ExceptionHandler;

import org.sang.exceptions.CommonBusinessException;
import org.sang.utils.Result;
import org.sang.utils.ResultUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@RestController
@ControllerAdvice
public class GlobalDefultExceptionHandler {
    //声明要捕获的异常
    @ExceptionHandler(value = CommonBusinessException.class)
    @ResponseBody
    public <T> Result<?> commonBusinessExceptionHandler(HttpServletRequest request,Exception e) {
        e.printStackTrace();
        if(e instanceof CommonBusinessException) {
            CommonBusinessException businessException = (CommonBusinessException)e;
            System.out.println("这是一条CommonBusinessException异常");
            return ResultUtils.failure( businessException.getMessage());
        }
        //未知错误
        return ResultUtils.failure( "系统异常：\\n"+e);
    }
    @ExceptionHandler(value = Exception.class)
    @ResponseBody
    public <T> Result<?> defultExcepitonHandler(HttpServletRequest request,Exception e) {
        System.out.println("这是一条普通的异常");
        //未知错误
        return ResultUtils.failure( "系统异常：\\n"+e);
    }




}
