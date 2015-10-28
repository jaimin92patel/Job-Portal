package csjobs.web.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import csjobs.model.Application;
import csjobs.model.dao.ApplicationDao;

@Controller
public class ResearchStatementDController {

	@Autowired
	private ServletContext context;
	
	@Autowired
    private ApplicationDao applicationDao;
	
	@Autowired
    private HttpSession session;
	
	public File getFileDirectory(Application application,HttpSession session)
	{
		String appEmail=application.getApplicant().getEmail();
		String jobTitle=application.getJob().getTitle();
		
		String path=context.getRealPath("/WEB-INF/files/"+appEmail+"/"+jobTitle+"/ResearchStatement/"+application.getResearchStatement().getName());
		String PATH=context.getRealPath("/WEB-INF/files/"+appEmail+"/"+jobTitle+"/ResearchStatement");
		
		//set var in session
		session.setAttribute("fileName",FilenameUtils.getBaseName(path) );
		session.setAttribute("ext", FilenameUtils.getExtension(path));
		
		
		return new File(PATH);
		
	}
	
	@RequestMapping(value="/application/ResearchStatementDownload.html")
    public String DownloadFiles(@RequestParam Long applicationId,HttpServletResponse response,HttpSession session) throws IllegalStateException, IOException
    {
		
		Application application=applicationDao.getApplication(applicationId);
		
		String tempName=(String) session.getAttribute("fileName");
		String tempExt=(String) session.getAttribute("ext");
		
		response.setContentType( "text/plain" );
        response.setHeader( "Content-Disposition",
            "online; filename="+tempName+"."+tempExt);
		
		FileInputStream in = new FileInputStream( new File(getFileDirectory(application,session),tempName+"."+tempExt) );
		OutputStream out = response.getOutputStream();
		
		byte buffer[] = new byte[2048];
        int bytesRead;
        while( (bytesRead = in.read( buffer )) > 0 )
            out.write( buffer, 0, bytesRead );

        in.close();
        String temp=(String) session.getAttribute("applicationId");
    	
        return "redirect:../applicant.html";
        /*return "redirect:/?id="+temp;*/
    }

}
