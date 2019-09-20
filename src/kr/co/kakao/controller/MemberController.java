package kr.co.kakao.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.codec.digest.MessageDigestAlgorithms;

import kr.co.jhta.mvc.annotation.Controller;
import kr.co.jhta.mvc.annotation.RequestMapping;
import kr.co.jhta.mvc.servlet.ModelAndView;
import kr.co.jhta.mvc.view.JSONView;
import kr.co.kakao.dao.MemberDao;
import kr.co.kakao.dao.OrderDao;
import kr.co.kakao.vo.Member;
import kr.co.kakao.vo.PointHistory;

@Controller
public class MemberController {

	MemberDao memberDao = new MemberDao();
	Random random = new Random();

	@RequestMapping("/member/returnidpwd.kakao")
	public ModelAndView returnid(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();

		if ("id".equals(req.getParameter("find"))) {
			String id = req.getParameter("userId");

			mav.addAttribute("find", "id");
			mav.addAttribute("id", id);
		} else {
			String pwd = req.getParameter("userPwd");

			mav.addAttribute("find", "pwd");
			mav.addAttribute("pwd", pwd);
		}

		mav.setViewName("member/returnidpwd.jsp");

		return mav;
	}

	@RequestMapping("/member/findidpwdbyemail.kakao")
	public ModelAndView findidbyemail(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();

		String name = req.getParameter("username");
		System.out.println(name);
		String email = req.getParameter("useremail");
		System.out.println(email);

		Map<String, String> map = new HashMap<String, String>();
		map.put("name", name);
		map.put("email", email);

		System.out.println("1");
		Member member = memberDao.findMemberIdPwdByEmail(map);
		System.out.println("2");

		if ("id".equals(req.getParameter("find"))) {
			System.out.println("id");
			if (member != null) {
				System.out.println("id-1");
				mav.setViewName("redirect:returnidpwd.kakao?find=id&userId=" + member.getId());
			} else {
				System.out.println("id-2");
				mav.setViewName("redirect:findidpwd.kakao?result=fail");
				return mav;
			}
		} else {
			System.out.println("pwd");
			if (member != null) {
				char pwdString[] = { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p',
						'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '1', '2', '3', '4', '5', '6', '7', '8', '9',
						'0' };
				
				String newPwd = "";
				
				for(int i = 0; i < 8; i++) {
					int randomNo = random.nextInt(36);
					newPwd += pwdString[randomNo];
				}

				mav.setViewName("redirect:returnidpwd.kakao?find=pwd&userPwd=" + newPwd);
				
				String digestPwd = new DigestUtils(MessageDigestAlgorithms.SHA_1).digestAsHex(newPwd);
				
				Map<String, Object> pwdMap = new HashMap<String, Object>();
				pwdMap.put("pwd", digestPwd);
				pwdMap.put("no", member.getNo());
				
				memberDao.updatePwd(pwdMap);
			} else {
				mav.setViewName("redirect:findidpwd.kakao?result=fail");
				return mav;
			}
		}

		return mav;
	}

	@RequestMapping("/member/findidpwd.kakao")
	public ModelAndView findid(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();

		if ("id".equals(req.getParameter("find"))) {
			mav.addAttribute("find", "id");
		} else if ("pwd".equals(req.getParameter("find"))) {
			mav.addAttribute("find", "pwd");
		}

		mav.setViewName("member/findidpwd.jsp");

		return mav;
	}

	@RequestMapping("/member/checkid.kakao")
	public ModelAndView checkid(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();

		String id = req.getParameter("id");
		Member member = memberDao.getMemberById(id);

		if (member != null) {
			mav.addAttribute("exist", "Yes");
		} else {
			mav.addAttribute("exist", "no");
		}

		mav.setView(new JSONView());

		return mav;
	}

	@RequestMapping("/member/logout.kakao")
	public ModelAndView logout(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();

		HttpSession session = req.getSession();
		session.invalidate();

		mav.setViewName("redirect:/kakao/main.kakao");

		return mav;
	}

	@RequestMapping("/member/login.kakao")
	public ModelAndView login(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/kakao/main.kakao");

		String id = req.getParameter("userid");
		String pwd = req.getParameter("userpwd");

		Member member = memberDao.getMemberById(id);

		if (member == null) {
			mav.setViewName("redirect:loginform.kakao?result=fail");
			return mav;
		}

		String digestPwd = new DigestUtils(MessageDigestAlgorithms.SHA_1).digestAsHex(pwd);

		if (!member.getPwd().equals(digestPwd)) {
			mav.setViewName("redirect:loginform.kakao?result=fail");
			return mav;
		}

		HttpSession session = req.getSession();
		session.setAttribute("LOGINMEMBER", member);
		mav.setViewName("redirect:/kakao/main.kakao");

		return mav;
	}

	@RequestMapping("/member/joinform.kakao")
	public ModelAndView joinform(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/joinform.jsp");

		return mav;
	}

	@RequestMapping("/member/loginform.kakao")
	public ModelAndView loginform(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/loginform.jsp");

		if ("fail".equals(req.getParameter("result"))) {
			mav.addAttribute("result", "fail");
		}

		return mav;
	}

	@RequestMapping("/member/register.kakao")
	public ModelAndView register(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/complete.jsp");

		String id = req.getParameter("userid");
		String pwd = req.getParameter("userpwd");
		String name = req.getParameter("username");
		String phone = req.getParameter("userphone");
		String email = req.getParameter("useremail");

		String postalCode = req.getParameter("userpostalcode");

		String address = req.getParameter("useraddress");
		String detailAddress = req.getParameter("userdetailaddress");
		String birth = req.getParameter("userbirth");

		String digestPwd = new DigestUtils(MessageDigestAlgorithms.SHA_1).digestAsHex(pwd);

		Member member = new Member();
		member.setId(id);
		member.setPwd(digestPwd);
		member.setName(name);
		member.setPhone(phone);
		member.setEmail(email);
		member.setPostalCode(postalCode);
		member.setAddress(address);
		member.setDetailAddress(detailAddress);
		member.setBirth(birth);

		memberDao.insertMember(member);

		Member mem = memberDao.getMemberById(member.getId());
		member.setNo(mem.getNo());

		PointHistory pointHistory = new PointHistory();
		pointHistory.setMember(member);
		pointHistory.setChangePoint(+5000);

		memberDao.insertRegistPoint(pointHistory);

		return mav;
	}
}
