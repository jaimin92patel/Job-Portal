package csjobs.web.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;





import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;

import csjobs.model.Application;
import csjobs.model.User;
import csjobs.model.dao.ApplicationDao;
import csjobs.model.dao.JobDao;
import csjobs.model.dao.UserDao;

@Controller
@SessionAttributes("application")
public class CVController {

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
    
    private static final Logger logger = LoggerFactory
            .getLogger(CVController.class);

    @RequestMapping(value="/application/Upload.html", method=RequestMethod.GET)
	public String Upload(ModelMap models)
	{
    
		return "application/Upload";
	}
    
    @RequestMapping(value="/application/Upload.html", method=RequestMethod.POST)
    public String Upload(@RequestParam("file") MultipartFile file) throws IllegalStateException, IOException
    {
		file.transferTo(new File(getFileDirectory(),file.getOriginalFilename()));
		
		Long id=(Long) session.getAttribute("applicationId");
		csjobs.model.Application currentApp=applicationDao.getApplication(id);
    	
		csjobs.model.User userToBeStored=userDao.getUser(currentApp.getApplicant().getId());
		csjobs.model.File fileToBeStored=new csjobs.model.File();
		fileToBeStored.setName(file.getOriginalFilename());
		fileToBeStored.setType(file.getContentType());
		fileToBeStored.setSize(file.getSize());
		fileToBeStored.setDate(new Date());
		fileToBeStored.setOwner(userToBeStored);
		currentApp.setCv(fileToBeStored);
		
		applicationDao.saveApplication(currentApp);
		
		return "redirect:/application/TeachingStatement.html";
    }

	private File getFileDirectory() {
		//get user 
		
		User applicant = (User) session.getAttribute( "authenticatedUser" );
		Application app=applicationDao.getApplication((Long) session.getAttribute("applicationId"));
		
		String jobTitle=app.getJob().getTitle();
		String applicantName=applicant.getEmail();
		
		String path=context.getRealPath("/WEB-INF/files");
		new File(path+"/"+applicantName+"/"+jobTitle+"/CV"+"/").mkdirs();
		String PATH=context.getRealPath("/WEB-INF/files/"+applicantName+"/"+jobTitle+"/CV");
		logger.info(PATH);
		return new File(PATH);
	}
}
