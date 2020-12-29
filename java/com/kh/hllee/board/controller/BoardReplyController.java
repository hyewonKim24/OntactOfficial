package com.kh.hllee.board.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hllee.board.model.service.BoardReplyService;
import com.kh.hllee.board.model.vo.BoardReply;

@Controller
public class BoardReplyController {
	@Autowired
	private BoardReply br;
	@Autowired
	private BoardReplyService brService;
	
	@RequestMapping(value = "/brInsert.do", method = RequestMethod.GET) 
	public ModelAndView boardReplyInsert(
			@RequestParam(name = "board_num") String board_num, 
			@RequestParam(name = "page", defaultValue = "1") int page, 
			BoardReply br, ModelAndView mv) {
		try {
			brService.insertBoardReply(br); 
			mv.addObject("board_num", board_num); 
			mv.addObject("page", page); 
			mv.setViewName("redirect:bDetail.do");
		} catch (Exception e) { 
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
			return mv; 
	}
	
	@RequestMapping(value = "/brUpdate.do", method = RequestMethod.POST) 
	public void boardReplyUpdate(HttpServletResponse response, BoardReply br) {
		PrintWriter out = null;
		JSONObject job = new JSONObject(); 
		try {
			job.put("ack", brService.updateBoardReply(br)); 
			out = response.getWriter();
			out.append( job.toJSONString());
		} catch (Exception e) { 
			job.put("ack", -1);
		} finally { 
			out.flush();
			out.close(); 
			}
		}
	
	@RequestMapping(value = "brDelete.do", method = RequestMethod.POST) 
	public void boardReplyDelete(HttpServletResponse response, BoardReply br) {
		PrintWriter out = null;
		JSONObject job = new JSONObject(); try {
			job.put("ack", brService.deleteBoardReply(br)); 
			out = response.getWriter();
			out.append( job.toJSONString());
			} catch (Exception e) { 
				job.put("ack", -1);
			} finally { 
				out.flush();
				out.close(); 
			}
	} 
}
		