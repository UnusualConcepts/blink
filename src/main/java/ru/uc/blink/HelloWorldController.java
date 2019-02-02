package ru.uc.blink;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloWorldController {

    @RequestMapping("/")
    public String index() {
        return "Hello world11!";
    }
//    @RequestMapping(method = RequestMethod.GET, path = "/hello")
//    public String hello() {
//        return "hello";
//    }
}
