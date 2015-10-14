package csjobs.web.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import csjobs.model.Application;
import csjobs.model.User;
import csjobs.model.dao.ApplicationDao;
import csjobs.model.dao.JobDao;
import csjobs.model.dao.UserDao;

@Controller
@SessionAttributes("application")
public class ResearchStatementController {

	@Autowired
	private UserDao userDao;
	
    @Autowired
    private JobDao jobDao;

    @Autowired
    private HttpSession session;
    
    @Autowired
	private ServletContext context;
    
    @Autowired
    private ApplicationDao applicationDao;

    @RequestMapping(value="/application/ResearchStatement.html", method=RequestMethod.GET)
	public String RStatement(ModelMap models)
	{
    
		return "application/ResearchStatement";
	}
    
    @RequestMapping(value="/application/ResearchStatement.html", method=RequestMethod.POST)
    public String RStatement(@RequestParam MultipartFile file2) throws IllegalStateException, IOException
    {
		file2.transferTo(new File(getFileDirectory(),file2.getOriginalFilename()));
		
		Long id=(Long) session.getAttribute("applicationId");
		csjobs.model.Application currentApp=applicationDao.getApplication(id);
    	csjobs.model.User userToBeStored=userDao.getUser(currentApp.getApplicant().getId());
		
		csjobs.model.File fileToBeStored=new csjobs.model.File();
		fileToBeStored.setName(file2.getName());
		fileToBeStored.setType(file2.getContentType());
		fileToBeStored.setSize(file2.getSize());
		fileToBeStored.setDate(new Date());
		fileToBeStored.setOwner(userToBeStored);
		
		currentApp.setResearchStatement(fileToBeStored);
		applicationDao.saveApplication(currentApp);
		
		return "redirect:../applicant.html";
    }

	private File getFileDirectory() {
		//get user 
		
		User applicant = (User) session.getAttribute( "authenticatedUser" );
		Application app=applicationDao.getApplication((Long) session.getAttribute("applicationId"));
		
		String jobTitle=app.getJob().getTitle();
		String applicantName=applicant.getEmail();
		
		String path=context.getRealPath("/WEB-INF/files");
		new File(path+"/"+applicantName+"/"+jobTitle+"/ResearchStatement"+"/").mkdirs();
		String PATH=context.getRealPath("/WEB-INF/files/"+applicantName+"/"+jobTitle+"/ResearchStatement");
		
		return new File(PATH);
	}

}
