package mvc.member;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class FileUpload {
	public static final String saveDir = 
			"/Users/jihyeon_sophia_lee/eclipse-workspace/practice-for-spring-jsp/Spring/KHSpring/WebContent/upload";

	int maxSize = 1024*1024*100;//100Mb;
	String encoding = "utf-8";
	MultipartRequest multipartRequest;
	String sysFile = "";
	String oriFile = "";

	public FileUpload(HttpServletRequest req) {
		try {
			multipartRequest = new MultipartRequest(req,saveDir,maxSize, encoding, new DefaultFileRenamePolicy());
			//업로드된 파일명
			Enumeration<String> en = multipartRequest.getFileNames();
			while(en.hasMoreElements()) {
				String tag = (String)en.nextElement();
				sysFile = multipartRequest.getFilesystemName(tag); // 수정된 파일명
				oriFile = multipartRequest.getOriginalFileName(tag); //원본 파일명
			}


		}catch(Exception ex) {
			System.out.println("FileUpload 생성자");
			ex.printStackTrace();
		}
	}

	public MemberVo getMember() {
		MemberVo vo = new MemberVo();
		vo.setAddress(multipartRequest.getParameter("address")); 
		vo.setEmail(multipartRequest.getParameter("email"));
		vo.setJoinedDate(multipartRequest.getParameter("joinedDate"));
		vo.setMid(multipartRequest.getParameter("mid"));
		vo.setName(multipartRequest.getParameter("name"));
		vo.setPhonenumber(multipartRequest.getParameter("phonenumber"));
		vo.setPassword(multipartRequest.getParameter("password"));
		vo.setZipcode(multipartRequest.getParameter("zipcode"));
		vo.setPhoto(sysFile);
		vo.setDelFile(multipartRequest.getParameter("delFile"));

		return vo;
	}

	public Page getPage() {
		Page page = new Page();

		if(multipartRequest.getParameter("findStr") != null) {
			page.setFindStr(multipartRequest.getParameter("findStr"));
		}
		if(multipartRequest.getParameter("nowPage") != null && !multipartRequest.getParameter("nowPage").equals("") ) {
			int nowPage = Integer.parseInt(multipartRequest.getParameter("nowPage"));
			page.setNowPage(nowPage);
		}else {
			page.setNowPage(1);
		}
		return page;

	}

}
