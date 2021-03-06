package com.human.java.RcpController;


import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Base64;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.human.java.RcpService.RcpSer;
import com.human.java.RcpVO.RcpListVO;
import com.human.java.RcpVO.RcpVO;

@Controller
@RequestMapping("/rcp")
public class RcpCon {
	@Autowired
	private RcpSer RcpSer;
	
	@RequestMapping("/{url}.do")
	public String userJoin(@PathVariable String url) {
		return "/rcp/"+url;
	}
	
	// 레시피 등록시 로그인 체크
	@RequestMapping("VgRcpRegst_ck.do")
	public String regstRcp(HttpSession session) {
		if (session.getAttribute("usr_Id") == null) { 
			return "redirect:/usr/VgUsrLogin.do";
		}else {
		return "redirect:/rcp/VgRcpRegst.do";
		}
	}	
	
	// 레시피 등록 
	@RequestMapping("VgRcpRegDone.do")
	public String insertRcp(RcpVO rcpvo, HttpSession session, MultipartFile file) throws IOException {
		int i=RcpSer.getPK();
		rcpvo.setRCP_PK(i);
		String[] Rcp_content  = rcpvo.getRCPCT_CONTENT().split(",");
		for(int j=0;j<Rcp_content.length; j++) {
			RcpVO vo1 = new RcpVO();
			vo1.setRCP_PK(i);
			vo1.setRCPCT_CONTENT(Rcp_content[j]);
			RcpSer.insertRcp_cont(vo1);
		}
		
		String[] rcp_resours = rcpvo.getRCPRS_TITLE().split(",");
		String[] rcp_nyan = rcpvo.getRCPRS_AMOUNT().split(",");
		for(int r=0; r<rcp_resours.length; r++) {
			RcpVO vo2 = new RcpVO();
			vo2.setRCP_PK(i);
			vo2.setRCPRS_TITLE(rcp_resours[r]);
			vo2.setRCPRS_AMOUNT(rcp_nyan[r]);
			RcpSer.insertRcp_reso(vo2);
		}
		String rcp_img = null;
        if (file != null) {
            Base64.Encoder encoder = Base64.getEncoder();
            byte[] photoEncode = encoder.encode(file.getBytes());
            rcp_img = new String(photoEncode, "UTF8");
        }
        
        rcpvo.setRCP_IMG(rcp_img);
        RcpSer.insertRcp(rcpvo);

		return "redirect:/rcp/VgRcpList.do";
	}
	
	
	// 레시피 전체 조회
	@RequestMapping("VgRcpList.do")
	public String boardList(RcpListVO rcplistvo, Model model, RcpVO rcpvo
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage, String search_text) {

		int total = RcpSer.countRcp(search_text);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "8";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "8";
		}
		rcplistvo = new RcpListVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		rcplistvo.setSearch_text(search_text);
		model.addAttribute("paging", rcplistvo);
		model.addAttribute("RcpViewAll", RcpSer.selectRcp(rcplistvo));
		return "/rcp/VgRcpList";
	}
	
	
	// 레시피 상세조회
	@RequestMapping("/VgRcpDtail.do")
	public String detailRcp(RcpVO rcpvo, Model model, HttpSession session) {
		RcpSer.viewsCountRcp(rcpvo.getRCP_PK());
		RcpVO vo1 = new RcpVO();
		vo1.setRCP_PK(rcpvo.getRCP_PK());
		vo1.setUSR_ID(session.getAttribute("usr_Id")+"");
		model.addAttribute("rcp_sp_ck",RcpSer.ch_scrap_detail(vo1));
		model.addAttribute("RcpDtail", RcpSer.detailRcp(rcpvo));
		model.addAttribute("detailRcp_reso", RcpSer.detailRcp_reso(rcpvo));
		model.addAttribute("detailRcp_cont", RcpSer.detailRcp_cont(rcpvo));
		return "/rcp/VgRcpDtail";
	}
	
	// 레시피 삭제
	@RequestMapping("/VgRcpDel.do")
	public String delcheck(RcpVO rcpvo) {
		RcpSer.delcheck(rcpvo);
		RcpSer.delcheck_CONT(rcpvo);
		RcpSer.delcheck_RESO(rcpvo);
;		return "redirect:/rcp/VgRcpList.do";
	}
	
	// 레시피 수정 데이터
	@RequestMapping("/VgRcpRew.do")
	public String startRewriteRcp(RcpVO rcpvo, Model model) {
		model.addAttribute("RcpDtail", RcpSer.detailRcp(rcpvo));
		model.addAttribute("detailRcp_reso", RcpSer.detailRcp_reso(rcpvo));
		model.addAttribute("detailRcp_cont", RcpSer.detailRcp_cont(rcpvo));
		return "/rcp/VgRcpRew";
	}
	
	// 레시피 수정 하기
	@RequestMapping("/VgRcpRewDone.do")
	public String rewcheck(RcpVO rcpvo, Model model, MultipartFile file) throws IOException  {
		int pk = rcpvo.getRCP_PK();
		RcpSer.delcheck(rcpvo);
		RcpSer.delcheck_CONT(rcpvo);
		RcpSer.delcheck_RESO(rcpvo);
		String[] Rcp_content  = rcpvo.getRCPCT_CONTENT().split(",");
		for(int j=0;j<Rcp_content.length; j++) {
			RcpVO vo1 = new RcpVO();
			vo1.setRCP_PK(pk);
			vo1.setRCPCT_CONTENT(Rcp_content[j]);
			RcpSer.insertRcp_cont(vo1);
		}

		String[] Rcp_resours = rcpvo.getRCPRS_TITLE().split(",");
		String[] Rcp_nyan = rcpvo.getRCPRS_AMOUNT().split(",");
		for(int r=0; r<Rcp_resours.length; r++) {
			RcpVO vo2 = new RcpVO();
			vo2.setRCP_PK(pk);
			vo2.setRCPRS_TITLE(Rcp_resours[r]);
			vo2.setRCPRS_AMOUNT(Rcp_nyan[r]);
			RcpSer.insertRcp_reso(vo2);
		}
		
		String rcp_img = null;
        if (file != null) {
            Base64.Encoder encoder = Base64.getEncoder();
            byte[] photoEncode = encoder.encode(file.getBytes());
            rcp_img = new String(photoEncode, "UTF8");
        }
        rcpvo.setRCP_IMG(rcp_img);
        RcpSer.insertRcp(rcpvo);
        
		return "redirect:/rcp/VgRcpList.do";
	}
	
	
	// 레시피 스크랩
	@RequestMapping("input_scrap.do")
	public String input_scrap(RcpVO rcpvo, HttpSession session) {

	    String a=rcpvo.getRCP_PK()+"";

	    RcpVO vo1 = new RcpVO();
		vo1.setRCP_PK(rcpvo.getRCP_PK());
		vo1.setUSR_ID(session.getAttribute("usr_Id")+"");
	    RcpSer.input_scrap(vo1);
	    
	    return "redirect:/rcp/VgRcpDtail.do?RCP_PK="+a;
	   }
	
	// 레시피 스크랩 취소
	@RequestMapping("cancel_scrap.do")
	public String cancel_scrap(RcpVO rcpvo, HttpSession session) {
		RcpVO vo1 = new RcpVO();
		String a=rcpvo.getRCP_PK()+"";
		vo1.setRCP_PK(rcpvo.getRCP_PK());
		vo1.setUSR_ID(session.getAttribute("usr_Id")+"");
		RcpSer.cancel_scrap(vo1);
		
		return "redirect:/rcp/VgRcpDtail.do?RCP_PK="+a;
	}

}
