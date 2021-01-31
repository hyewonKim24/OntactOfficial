package com.kh.ontact.project.reply.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ontact.project.reply.model.dto.ReplyDto;
import com.kh.ontact.project.reply.model.service.ReplyService;
import com.kh.ontact.users.model.dto.CustomUserDetails;

@Controller
public class ReplyController {
	@Autowired
	ReplyService replyService;
	
			// 댓글 추가
			@RequestMapping(value="/project/replyinsert",method=RequestMethod.GET)
					public ModelAndView replyInsert(ModelAndView mv, @RequestParam(name = "pno") String pno,
							@RequestParam(name = "bno") int bno,@RequestParam(name = "rdesc") String rdesc,
							Authentication authentication, ReplyDto dto) { 
				
						CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
						String uno = userdetail.getUno();
						
						System.out.println(pno +"/"+ bno +"/ 댓글 내용!! "+ rdesc);
						
						dto.setUno(uno);
						dto.setPno(pno);
						dto.setBno(bno);
						dto.setRdesc(rdesc);
						try {
							  int rs = replyService.insertReply(dto);
							  System.out.println("댓글 추가 : "+rs+"개");
							 
						} catch (Exception e) {
							e.printStackTrace();
						}
						mv.addObject("pno", pno);
						mv.setViewName("redirect:/project/pjdetail");
						return mv;
					}
			
			
			//댓글 삭제
			@ResponseBody
			@RequestMapping(value="/project/replydelete")
			public int replyDelete(ModelAndView mv,String rno) {
				System.out.println("rno:"+rno);
				int rs=0;
				try {
					rs=replyService.deleteReply(rno);
					System.out.println(rno+"의"+rs+"개 댓글 삭제완료");
				} catch (Exception e) {
					e.printStackTrace();
				}
				return rs;
			}
			//댓글 수정
			@ResponseBody
			@RequestMapping(value="/project/replyupdate")
			public int replyUpdate(ModelAndView mv,String rno,String rdesc) {
				int rs=0;
				ReplyDto dto = new ReplyDto();
				dto.setRno(rno);
				dto.setRdesc(rdesc);
				System.out.println(rno + rdesc);
				try {
					rs=replyService.updateReply(dto);
					System.out.println(rs+"개 댓글 수정완료");
				} catch (Exception e) {
					e.printStackTrace();
				}	
				return rs;
			}
			
}
