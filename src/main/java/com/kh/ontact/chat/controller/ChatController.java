package com.kh.ontact.chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class ChatController {
	
	@RequestMapping(value="/chattest",method=RequestMethod.GET)
	public ModelAndView chattest(ModelAndView mv) {
		mv.setViewName("main/testchat");
		return mv;
	}
	@RequestMapping(value="/chatroom",method=RequestMethod.GET)
	public ModelAndView chatroom(ModelAndView mv) {
		mv.setViewName("main/chatroom");
		return mv;
	}
	@RequestMapping(value="/chatinvite",method=RequestMethod.GET)
	public ModelAndView chatinvite(ModelAndView mv) {
		mv.setViewName("main/chatinvite");
		return mv;
	}

}
